# GitHub Actions for Driver Data Updates

This directory contains GitHub Actions workflows that automatically update MongoDB driver version data from the official GitHub repositories.

## 📁 Workflow Files

### Core Workflows

- **`update-driver-data.yml`** - Main workflow that updates all drivers with matrix strategy
- **`update-single-driver.yml`** - Reusable workflow for updating a single driver
- **`bulk-update-drivers.yml`** - Batch update workflow with advanced options

### Individual Driver Workflows

Each driver has its own workflow file for targeted updates:

- `update-c-driver.yml` - C Driver
- `update-cpp-driver.yml` - C++ Driver
- `update-csharp-driver.yml` - C# Driver
- `update-go-driver.yml` - Go Driver
- `update-java-driver.yml` - Java Driver
- `update-nodejs-driver.yml` - Node.js Driver
- `update-php-driver.yml` - PHP Driver
- `update-python-driver.yml` - Python Driver
- `update-ruby-driver.yml` - Ruby Driver
- `update-rust-driver.yml` - Rust Driver

## 🚀 Usage

### Automatic Updates

All workflows are scheduled to run automatically:

- **Individual drivers**: Run daily at staggered times (1:00-5:30 AM UTC)
- **Bulk update**: Runs weekly on Sundays at 6:00 AM UTC
- **Main workflow**: Runs weekly on Sundays at 6:00 AM UTC

### Manual Triggers

You can manually trigger any workflow from the GitHub Actions tab:

#### 1. Update All Drivers
Navigate to **Actions** → **Update Driver Data** → **Run workflow**

Options:
- **Driver**: Select specific driver or "all" for all drivers
- **Force recreate**: Completely rebuild JSON files with all available releases

#### 2. Update Single Driver
Navigate to **Actions** → **Update [Language] Driver** → **Run workflow**

Options:
- **Force recreate**: Completely rebuild the JSON file

#### 3. Bulk Update (Advanced)
Navigate to **Actions** → **Bulk Update All Drivers** → **Run workflow**

Options:
- **Force recreate**: Rebuild all JSON files
- **Drivers to update**: Comma-separated list (e.g., "nodejs,python,go")

## 🔧 How It Works

### Update Process

1. **Fetch Releases**: Uses GitHub Releases API to get all published releases
2. **Filter & Validate**: Removes prereleases, drafts, and invalid semantic versions
3. **Compare Versions**: Checks against existing data to find new releases
4. **Update Data**: Merges new releases with existing data, maintaining sort order
5. **Commit Changes**: Automatically commits and pushes updates if changes are found

### Smart Updates

- **Incremental**: Only adds new releases unless `force_recreate` is enabled
- **Version Validation**: Uses semantic versioning rules to filter valid releases
- **Rate Limiting**: Includes delays and retry logic to respect GitHub API limits
- **Duplicate Prevention**: Prevents duplicate versions in the data files
- **Size Management**: Limits each file to 100 most recent versions

### Error Handling

- **Retry Logic**: Automatically retries failed API requests
- **Rate Limit Handling**: Waits and retries when rate limits are hit
- **Graceful Degradation**: Continues processing other drivers if one fails
- **Detailed Logging**: Provides comprehensive logs for debugging

## 📊 Data Format

Each workflow updates JSON files in the `data/` directory with this structure:

```json
{
  "driver": "Node.js",
  "repository": "https://github.com/mongodb/node-mongodb-native",
  "versions": [
    {
      "version": "6.18.0",
      "releaseDate": "2025-07-22"
    }
  ]
}
```

## 🔍 Monitoring

### Workflow Status

Check workflow status in the **Actions** tab:
- Green ✅ = Successful update
- Yellow 🟡 = No updates needed
- Red ❌ = Failed (check logs)

### Commit Messages

Updates create descriptive commit messages:
```
🔄 Update Node.js driver data

- Latest version: 6.18.0
- Total versions: 45
- Updated: 2025-08-08 12:00:00 UTC

Auto-updated by GitHub Actions from mongodb/node-mongodb-native
```

### Summary Reports

Each workflow generates a summary report showing:
- Driver updated
- Latest version found
- Whether updates were applied
- Links to repositories

## ⚙️ Configuration

### Repository Settings

Ensure your repository has:
- **Actions enabled**: Settings → Actions → General
- **Workflow permissions**: Settings → Actions → General → Workflow permissions
- **Write permissions**: Allow GitHub Actions to create and approve pull requests

### API Rate Limits

The workflows are designed to respect GitHub API limits:
- **Authenticated requests**: 5,000 per hour (using `GITHUB_TOKEN`)
- **Staggered execution**: Individual workflows run at different times
- **Request delays**: 1-2 second delays between API calls
- **Retry logic**: Automatic retries with exponential backoff

### Customization

To modify update behavior:

1. **Change schedules**: Edit `cron` expressions in workflow files
2. **Adjust version limits**: Modify the slice limit in update scripts
3. **Add new drivers**: Create new workflow files following the existing pattern
4. **Modify data format**: Update the JSON structure in update scripts

## 🛠 Troubleshooting

### Common Issues

1. **Rate Limit Exceeded**
   - Workflows include retry logic
   - Consider reducing update frequency
   - Check if multiple workflows are running simultaneously

2. **API Errors**
   - Usually temporary GitHub API issues
   - Workflows will retry automatically
   - Check GitHub Status page for outages

3. **No Updates Found**
   - Normal if no new releases are available
   - Check the repository's actual releases page
   - Verify the repository URL is correct

4. **Permission Errors**
   - Ensure workflow permissions are correctly set
   - Check that `GITHUB_TOKEN` has necessary permissions

### Debug Mode

To enable debug logging, add this to any workflow:

```yaml
env:
  ACTIONS_STEP_DEBUG: true
```

## 📋 Maintenance

### Adding New Drivers

1. Add driver configuration to `generate-workflows.sh`
2. Run the script to generate the workflow file
3. Update the main workflow matrix with the new driver
4. Create the initial JSON file in `data/` directory

### Updating Schedules

To change when workflows run:
1. Edit the `cron` expressions in workflow files
2. Consider staggering times to avoid API rate limits
3. Test with manual triggers before relying on schedules

### Repository Changes

If a MongoDB driver repository is renamed or moved:
1. Update the repository URL in all relevant workflow files
2. Update the matrix configuration in main workflows
3. Test the workflows manually after changes

---

For more information about GitHub Actions, see the [official documentation](https://docs.github.com/en/actions).
