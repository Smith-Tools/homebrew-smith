# Smith Tools Homebrew Tap 🍺

**Install Smith Tools via Homebrew with ease**

This tap provides Homebrew formulas for Smith Tools ecosystem components.

## 🚀 **Installation**

### **Add the Tap**
```bash
brew tap Smith-Tools/smith
```

### **Install Individual Tools**
```bash
# Multi-Skill Specialist System (Framework expertise)
brew install maxwell

# Unified CLI interface
brew install smith-cli

# Swift Package Manager analysis
brew install smith-spmsift

# Swift build analysis
brew install smith-sbsift

# Xcode build analysis
brew install smith-xcsift

# TCA architectural validation
brew install smith-validation
```

### **Install All Tools**
```bash
brew install maxwell smith-cli smith-spmsift smith-sbsift smith-xcsift smith-validation
```

## 📋 **Available Formulas**

| Formula | Description | Tool |
|---------|-------------|------|
| **maxwell** | Multi-Skill Specialist System - Framework expertise coordination | [Maxwell](https://github.com/Smith-Tools/Maxwell) |
| **smith-cli** | Unified CLI interface | [smith-cli](https://github.com/Smith-Tools/smith-cli) |
| **smith-spmsift** | Swift Package Manager analysis | [smith-spmsift](https://github.com/Smith-Tools/smith-spmsift) |
| **smith-sbsift** | Swift build analysis | [smith-sbsift](https://github.com/Smith-Tools/smith-sbsift) |
| **smith-xcsift** | Xcode build analysis | [smith-xcsift](https://github.com/Smith-Tools/smith-xcsift) |
| **smith-validation** | Swift architectural validation engine | [smith-validation](https://github.com/Smith-Tools/smith-validation) |

## 💡 **Usage Examples**

### **Maxwell - Framework Expertise**
```bash
# Search for framework patterns
maxwell search "TCA @Shared" --domain Point-Free

# List all patterns in a domain
maxwell domain SharePlay

# Find specific pattern
maxwell pattern "TCA @Shared Single Owner"

# In Claude Code - auto-triggers on framework keywords
@maxwell  # Explicit invocation for complex multi-domain questions
```

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

### **Architectural Validation**
```bash
# Validate Swift architecture
smith-validation --engine /path/to/project
```

## 🔧 **Development**

### **Update Formulas**
```bash
brew bump-formula-pr --url=NEW_URL smith-cli
brew bump-formula-pr --url=NEW_URL smith-spmsift
# ... etc
```

### **Test Formulas**
```bash
brew test smith-cli
brew test smith-spmsift
brew test smith-sbsift
brew test smith-xcsift
brew test smith-validation
```

## 📚 **More Information**

- **[Smith Tools Organization](https://github.com/Smith-Tools)** - Complete ecosystem
- **[Issues](https://github.com/Smith-Tools/homebrew-smith/issues)** - Report tap issues

## 📄 **License**

All Smith Tools are available under the MIT License.

---

**Smith Tools - Context-efficient Swift analysis for modern development**
