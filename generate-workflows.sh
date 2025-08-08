#!/bin/bash

# Script to generate individual driver workflow files

# Driver configurations
declare -A drivers=(
    ["c"]="C:mongodb/mongo-c-driver"
    ["cpp"]="C++:mongodb/mongo-cxx-driver"
    ["csharp"]="C#:mongodb/mongo-csharp-driver"
    ["go"]="Go:mongodb/mongo-go-driver"
    ["java"]="Java:mongodb/mongo-java-driver"
    ["nodejs"]="Node.js:mongodb/node-mongodb-native"
    ["php"]="PHP:mongodb/mongo-php-driver"
    ["python"]="Python:mongodb/mongo-python-driver"
    ["ruby"]="Ruby:mongodb/mongo-ruby-driver"
    ["rust"]="Rust:mongodb/mongo-rust-driver"
)

# Schedule times (staggered to avoid API rate limits)
declare -A schedules=(
    ["c"]="0 1 * * *"
    ["cpp"]="30 1 * * *"
    ["csharp"]="0 2 * * *"
    ["go"]="30 2 * * *"
    ["java"]="0 3 * * *"
    ["nodejs"]="30 3 * * *"
    ["php"]="0 4 * * *"
    ["python"]="30 4 * * *"
    ["ruby"]="0 5 * * *"
    ["rust"]="30 5 * * *"
)

# Create workflow files
for driver_key in "${!drivers[@]}"; do
    IFS=':' read -r display_name repo <<< "${drivers[$driver_key]}"
    schedule="${schedules[$driver_key]}"

    cat > ".github/workflows/update-${driver_key}-driver.yml" << EOF
name: Update ${display_name} Driver

on:
  schedule:
    # Run daily at staggered times
    - cron: '${schedule}'

  workflow_dispatch:
    inputs:
      force_recreate:
        description: 'Force recreate JSON file with all releases'
        required: false
        type: boolean
        default: false

jobs:
  update-${driver_key}:
    uses: ./.github/workflows/update-single-driver.yml
    with:
      driver_name: '${driver_key}'
      driver_display_name: '${display_name}'
      repo_name: '${repo}'
      force_recreate: \${{ github.event.inputs.force_recreate == true }}
    secrets: inherit

  notify:
    needs: update-${driver_key}
    runs-on: ubuntu-latest
    if: always()
    steps:
    - name: Create summary
      run: |
        echo "## 🔄 ${display_name} Driver Update Summary" >> \$GITHUB_STEP_SUMMARY
        echo "" >> \$GITHUB_STEP_SUMMARY
        echo "**Repository:** https://github.com/${repo}" >> \$GITHUB_STEP_SUMMARY
        echo "**Force Recreate:** \${{ github.event.inputs.force_recreate }}" >> \$GITHUB_STEP_SUMMARY
        echo "" >> \$GITHUB_STEP_SUMMARY

        if [ "\${{ needs.update-${driver_key}.result }}" == "success" ]; then
          echo "✅ **Status:** Workflow completed successfully" >> \$GITHUB_STEP_SUMMARY
        else
          echo "❌ **Status:** Workflow failed or was cancelled" >> \$GITHUB_STEP_SUMMARY
        fi
EOF

    echo "Created .github/workflows/update-${driver_key}-driver.yml"
done

echo "All driver workflow files created successfully!"
