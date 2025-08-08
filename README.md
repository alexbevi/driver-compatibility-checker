# MongoDB Driver Compatibility Checker

A comprehensive static web application that helps developers determine if a specific MongoDB driver version is compatible with a given MongoDB server version. It uses MongoDB's [official support lifecycle policy](https://www.mongodb.com/legal/support-policy/lifecycles), which mandates drivers support server versions up to **3 years beyond EOL**.

---

## 🌐 Live Demo

[🔗 View App on GitHub Pages](https://<your-username>.github.io/<repo-name>/)

---

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

---

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

---

## 🎯 Supported MongoDB Drivers

This application provides comprehensive compatibility checking for all major MongoDB drivers:

| Driver | Language | Repository | Latest Version |
|--------|----------|------------|----------------|
| **C** | C | [mongo-c-driver](https://github.com/mongodb/mongo-c-driver) | 1.29.0 |
| **C++** | C++ | [mongo-cxx-driver](https://github.com/mongodb/mongo-cxx-driver) | 4.0.0 |
| **C#/.NET** | C# | [mongo-csharp-driver](https://github.com/mongodb/mongo-csharp-driver) | 3.4.2 |
| **Go** | Go | [mongo-go-driver](https://github.com/mongodb/mongo-go-driver) | 2.2.3 |
| **Java** | Java | [mongo-java-driver](https://github.com/mongodb/mongo-java-driver) | 5.5.1 |
| **Node.js** | JavaScript | [node-mongodb-native](https://github.com/mongodb/node-mongodb-native) | 6.18.0 |
| **PHP** | PHP | [mongo-php-driver](https://github.com/mongodb/mongo-php-driver) | 2.1.1 |
| **Python** | Python | [mongo-python-driver](https://github.com/mongodb/mongo-python-driver) | 4.14.0 |
| **Ruby** | Ruby | [mongo-ruby-driver](https://github.com/mongodb/mongo-ruby-driver) | 2.21.2 |
| **Rust** | Rust | [mongo-rust-driver](https://github.com/mongodb/mongo-rust-driver) | 3.2.4 |

*Driver data is regularly updated from official GitHub repositories*

---

## 🗂️ Directory Structure

```
/
├── mongodb_driver_checker.html  # Main SPA with modern UI
├── data/
│   ├── server_versions.json     # MongoDB server version data
│   ├── c.json                   # C driver versions
│   ├── cpp.json                 # C++ driver versions
│   ├── csharp.json              # C#/.NET driver versions
│   ├── go.json                  # Go driver versions
│   ├── java.json                # Java driver versions
│   ├── nodejs.json              # Node.js driver versions
│   ├── php.json                 # PHP driver versions
│   ├── python.json              # Python driver versions
│   ├── ruby.json                # Ruby driver versions
│   └── rust.json                # Rust driver versions
└── README.md                    # Project documentation
```

---

## 📊 Example Data Format

### `data/server_versions.json`

```json
[
  {
    "version": "8.0",
    "releaseDate": "2024-11-05",
    "eolDate": "2029-11-30"
  },
  {
    "version": "7.0",
    "releaseDate": "2023-08-15",
    "eolDate": "2026-08-15"
  },
  {
    "version": "6.0",
    "releaseDate": "2022-07-18",
    "eolDate": "2025-07-18"
  }
]
```

### Driver Data Format (e.g., `data/nodejs.json`)

```json
{
  "driver": "Node.js",
  "repository": "https://github.com/mongodb/node-mongodb-native",
  "versions": [
    { "version": "6.18.0", "releaseDate": "2025-07-30" },
    { "version": "6.17.0", "releaseDate": "2025-06-25" },
    { "version": "6.16.0", "releaseDate": "2025-05-28" }
  ]
}
```

---

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

---

## 🔄 Updating Driver Data

Driver version data is sourced from official MongoDB GitHub repositories. To update:

1. **Automated Updates**: The data can be refreshed by fetching from GitHub APIs:
   - `https://api.github.com/repos/mongodb/mongo-<driver>-driver/releases`

2. **Manual Updates**: Edit the JSON files in the `data/` directory following the format shown above

3. **Adding New Drivers**:
   - Create a new JSON file in `data/` with driver version information
   - Update the driver selection dropdown in the HTML file
   - Add appropriate styling and logos if desired

---

## 🛠 Built With

* **Frontend**: Vanilla HTML5, CSS3, and JavaScript (ES6+)
* **Styling**: Modern CSS with custom properties, flexbox, and advanced selectors
* **Version Parsing**: [`semver`](https://www.npmjs.com/package/semver) library (via CDN) with fallback regex
* **Data Format**: JSON for driver and server version information
* **Icons**: Unicode symbols and custom CSS styling
* **Theming**: CSS custom properties with automatic dark/light mode detection
* **No Dependencies**: Works entirely in the browser without build tools or frameworks

---

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

---

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

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙋‍♂️ Support & Questions

- **Issues**: Report bugs or request features via [GitHub Issues](https://github.com/<username>/<repo>/issues)
- **Documentation**: Check the [MongoDB Driver Documentation](https://www.mongodb.com/docs/drivers/)
- **Community**: Join the [MongoDB Community Forums](https://www.mongodb.com/community/forums/)

---

## ⭐ Acknowledgments

- MongoDB team for maintaining excellent driver documentation
- MongoDB Community for feedback and contributions
- GitHub API for providing reliable access to release data

*Last updated: August 2025*
