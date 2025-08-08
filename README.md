# MongoDB Driver Compatibility Checker

A comprehensive static web application that helps developers determine if a specific MongoDB driver version is compatible with a given MongoDB server version. It uses MongoDB's [official support lifecycle policy](https://www.mongodb.com/legal/support-policy/lifecycles), which mandates drivers support server versions up to **3 years beyond EOL**.

## 🌐 Live Demo

[🔗 View App on GitHub Pages](https://alexbevi.com/driver-compatibility-checker/)

## ✨ Features

* ✅ **Comprehensive Driver Support** - Covers all 10 major MongoDB drivers with up-to-date version data
* 🔍 **Smart Compatibility Checking** - Validates driver versions against server EOL + 3-year support windows
* ⚠️ **Compatibility Notice** - Clear admonition explaining the 3-year EOL rule upfront
* 🎯 **Sequential Selection Flow** - Enforced server → language → driver selection order to prevent errors
* 🔍 **Intelligent Version Input** - Custom dropdown with digit-based filtering and keyboard navigation
* 💡 **Real-time Validation** - Live semantic version validation with visual feedback indicators
* 📊 **Contextual Help** - Shows latest versions, release dates, and repository links for each selection
* 🌙 **Dark/Light Theme** - Automatic system theme detection with manual toggle option
* 📱 **Responsive Design** - Works seamlessly on desktop and mobile devices
* 🎨 **Modern UI** - Professional interface with smooth animations and hover effects
* 🔗 **GitHub Integration** - Direct links to official repositories and release notes

## 🎮 User Experience

### Sequential Selection Flow
1. **Server Version First** - Choose from all supported MongoDB server versions with release/EOL dates
2. **Language Selection** - Pick your driver/language after selecting a server version
3. **Driver Version Input** - Enhanced input with smart dropdown filtering and validation

### Enhanced Version Input
- **Custom Dropdown** - Replaces browser datalist with full keyboard navigation support
- **Digit-based Filtering** - Dropdown only appears when you type at least one digit
- **Real-time Validation** - Visual indicators (✅ ❌ ⚠️) show version status instantly
- **Release Date Display** - See when each version was published
- **Repository Links** - Direct access to GitHub releases for each driver

### Theme Support
- **Automatic Detection** - Respects your system's dark/light mode preference
- **Manual Toggle** - Switch themes manually with the moon/sun button
- **Smooth Transitions** - All theme changes animate smoothly

## 🎯 Supported MongoDB Drivers

This application provides comprehensive compatibility checking for all major MongoDB drivers:

| Driver | Language | Repository |
|--------|----------|------------|
| **C** | C | [mongo-c-driver](https://github.com/mongodb/mongo-c-driver) |
| **C++** | C++ | [mongo-cxx-driver](https://github.com/mongodb/mongo-cxx-driver) |
| **C#/.NET** | C# | [mongo-csharp-driver](https://github.com/mongodb/mongo-csharp-driver) |
| **Go** | Go | [mongo-go-driver](https://github.com/mongodb/mongo-go-driver) |
| **Java** | Java | [mongo-java-driver](https://github.com/mongodb/mongo-java-driver) |
| **Node.js** | JavaScript | [node-mongodb-native](https://github.com/mongodb/node-mongodb-native) |
| **PHP** | PHP | [mongo-php-driver](https://github.com/mongodb/mongo-php-driver) |
| **Python** | Python | [mongo-python-driver](https://github.com/mongodb/mongo-python-driver) |
| **Ruby** | Ruby | [mongo-ruby-driver](https://github.com/mongodb/mongo-ruby-driver) |
| **Rust** | Rust | [mongo-rust-driver](https://github.com/mongodb/mongo-rust-driver) |

*Driver data is regularly updated from official GitHub repositories*

## 🚀 Getting Started

### Option 1: Open Locally
1. Clone or download this repository
2. Open `mongodb_driver_checker.html` in your web browser
3. The app works entirely in the browser - no server required!

### Option 2: Deploy to GitHub Pages
1. Fork this repository to your GitHub account
2. Go to **Settings > Pages** in your repository
3. Under **Source**, select your branch (e.g., `main`) and root folder (`/`)
4. Access your app at `https://<your-username>.github.io/<repo-name>/`
5. Update the demo link in this README with your actual URL

## 🔄 Automated Data Updates

This repository includes comprehensive GitHub Actions workflows to automatically keep driver version data up-to-date:

### 🤖 Automation Features

* **🕐 Scheduled Updates** - Individual drivers update daily at staggered times to avoid API rate limits
* **📦 Bulk Updates** - Weekly comprehensive updates of all drivers
* **🎯 Selective Updates** - Manual triggers for specific drivers or combinations
* **🔄 Smart Merging** - Only adds new releases, preserves existing data
* **⚡ Force Rebuild** - Option to completely recreate data files with all available releases
* **🛡️ Rate Limit Handling** - Built-in retry logic and delays to respect GitHub API limits
* **📊 Comprehensive Logging** - Detailed workflow summaries and commit messages

### 🚀 Manual Triggers

You can manually update driver data anytime:

1. **Single Driver**: Go to Actions → "Update [Language] Driver" → Run workflow
2. **All Drivers**: Go to Actions → "Update Driver Data" → Run workflow
3. **Bulk Operations**: Go to Actions → "Bulk Update All Drivers" → Run workflow
4. **Test System**: Go to Actions → "Test Driver Update" → Run workflow

### 📈 Data Freshness

- **Individual drivers**: Updated daily at staggered times (1:00-5:30 AM UTC)
- **Bulk updates**: Weekly on Sundays at 6:00 AM UTC
- **Manual updates**: Available anytime via GitHub Actions interface
- **Version limit**: Each driver maintains up to 100 most recent versions

For detailed workflow documentation, see [`.github/workflows/README.md`](.github/workflows/README.md).

## 🔄 Updating Driver Data

## 🔄 Updating Driver Data (Legacy/Manual)

> **Note**: Driver data is now automatically updated via GitHub Actions. Manual updates are only needed for custom modifications or troubleshooting.

Driver version data is sourced from official MongoDB GitHub repositories. To update manually:

1. **Automated Updates** (Recommended): Use the GitHub Actions workflows described above

2. **Manual API Fetching**: The data can be refreshed by fetching from GitHub APIs:
   - `https://api.github.com/repos/mongodb/mongo-<driver>-driver/releases`

3. **Manual File Updates**: Edit the JSON files in the `data/` directory following the format shown above

4. **Adding New Drivers**:
   - Create a new JSON file in `data/` with driver version information
   - Add the driver to the GitHub Actions matrix in workflow files
   - Update the driver selection dropdown in the HTML file
   - Add appropriate styling and logos if desired

## 🛠 Built With

* **Frontend**: Vanilla HTML5, CSS3, and JavaScript (ES6+)
* **Styling**: Modern CSS with custom properties, flexbox, and advanced selectors
* **Version Parsing**: [`semver`](https://www.npmjs.com/package/semver) library (via CDN) with fallback regex
* **Data Format**: JSON for driver and server version information
* **Icons**: Unicode symbols and custom CSS styling
* **Theming**: CSS custom properties with automatic dark/light mode detection
* **No Dependencies**: Works entirely in the browser without build tools or frameworks

## 🎨 Technical Highlights

### Advanced CSS Features
- **CSS Custom Properties** - Dynamic theming with automatic dark/light mode
- **Progressive Enhancement** - Graceful degradation for older browsers
- **CSS Grid & Flexbox** - Modern layout techniques for responsive design
- **Smooth Animations** - CSS transitions for hover effects and theme switching

### Modern JavaScript
- **ES6+ Features** - Arrow functions, async/await, destructuring, template literals
- **Event Delegation** - Efficient event handling for dynamic content
- **Custom Dropdown Component** - Full keyboard navigation and accessibility
- **Real-time Validation** - Debounced input processing with visual feedback

### User Experience
- **Progressive Disclosure** - Form elements enable sequentially to guide users
- **Contextual Help** - Dynamic help text that updates based on selections
- **Error Prevention** - Validation prevents invalid combinations before submission
- **Visual Feedback** - Icons and colors provide immediate status indication

## 🤝 Contributing

Contributions are welcome! Here are some ways you can help:

### 🆕 Adding New Drivers
- Create driver data files following the established JSON format
- Update the main HTML file to include the new driver option
- Add appropriate styling and branding

### 📊 Improving Data Accuracy
- Keep driver version data up-to-date with official releases
- Verify MongoDB server lifecycle dates
- Report any compatibility issues or discrepancies

### 🎨 Enhancing the UI
- Improve the visual design and user experience
- Add new features like version comparison charts
- Optimize for mobile devices and accessibility

### 🔧 Technical Improvements
- Optimize performance and loading times
- Add unit tests for compatibility logic
- Improve error handling and user feedback

**To contribute:**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.