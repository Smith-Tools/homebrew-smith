# Smith Tools Homebrew Tap 🍺

**Install Smith Tools via Homebrew with ease**

This tap provides Homebrew formulas for all Smith Tools ecosystem components.

## 🚀 **Installation**

### **Add the Tap**
```bash
brew tap Smith-Tools/smith
```

### **Install Individual Tools**
```bash
# Core framework
brew install smith-core

# Unified CLI interface
brew install smith-cli

# Swift Package Manager analysis
brew install smith-spmsift

# Swift build analysis
brew install smith-sbsift

# Xcode build analysis
brew install smith-xcsift
```

### **Install All Tools**
```bash
brew install smith-core smith-cli smith-spmsift smith-sbsift smith-xcsift
```

## 📋 **Available Formulas**

| Formula | Description | Tool |
|---------|-------------|------|
| **smith-core** | Core framework and data models | [smith-core](https://github.com/Smith-Tools/smith-core) |
| **smith-cli** | Unified CLI interface | [smith-cli](https://github.com/Smith-Tools/smith-cli) |
| **smith-spmsift** | Swift Package Manager analysis | [smith-spmsift](https://github.com/Smith-Tools/smith-spmsift) |
| **smith-sbsift** | Swift build analysis | [smith-sbsift](https://github.com/Smith-Tools/smith-sbsift) |
| **smith-xcsift** | Xcode build analysis | [smith-xcsift](https://github.com/Smith-Tools/smith-xcsift) |

## 💡 **Usage Examples**

### **Smith CLI**
```bash
smith-cli --help
smith-cli analyze /path/to/project
```

### **Build Analysis**
```bash
# Swift build analysis
swift build 2>&1 | smith-sbsift parse

# Xcode build analysis
xcodebuild build -scheme MyApp 2>&1 | smith-xcsift analyze

# Swift Package Manager analysis
swift package dump-package | smith-spmsift analyze
```

## 🔧 **Development**

### **Update Formulas**
```bash
brew bump-formula-pr --url=NEW_URL smith-core
brew bump-formula-pr --url=NEW_URL smith-cli
# ... etc
```

### **Test Formulas**
```bash
brew test smith-core
brew test smith-cli
# ... etc
```

## 📚 **More Information**

- **[Smith Tools Organization](https://github.com/Smith-Tools)** - Complete ecosystem
- **[Documentation](https://github.com/Smith-Tools/smith-core)** - Core framework docs
- **[Issues](https://github.com/Smith-Tools/homebrew-smith/issues)** - Report tap issues

## 📄 **License**

All Smith Tools are available under the [MIT License](https://github.com/Smith-Tools/smith-core/blob/main/LICENSE).

---

**Smith Tools - Context-efficient Swift build analysis for modern development**