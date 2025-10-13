# yoda.nvim CI Tools

This directory contains continuous integration tools for the yoda.nvim theme.

## 🔧 Tools

### `lint.sh` - Linting and Formatting
Comprehensive linting and formatting checks for Lua code.

**Usage:**
```bash
# Check everything (default)
./ci/lint.sh

# CI mode - check only, fail if issues found  
./ci/lint.sh --check-only

# Fix formatting issues automatically
./ci/lint.sh --fix

# Show verbose output
./ci/lint.sh --verbose
```

**Features:**
- ✅ **stylua** formatting check and fix
- ✅ **luacheck** Lua linting 
- ✅ Trailing whitespace detection/removal
- ✅ Line ending validation (LF vs CRLF)
- ✅ Colored output for better readability

### `validate.lua` - Theme Validation
Basic validation that ensures the theme loads correctly.

**Usage:**
```bash
nvim --headless -l ci/validate.lua
```

**Features:**
- ✅ Theme loading verification
- ✅ Module import testing
- ✅ Color palette accessibility
- ✅ Highlight group validation

### `preview.lua` - Theme Preview Generator
Generates HTML previews of the theme with syntax highlighting.

**Usage:**
```bash
# Generate preview files
nvim --headless -l ci/preview.lua

# Or use the shell wrapper
./ci/preview.sh
```

**Generated files:**
- `theme_preview.html` - Visual preview with syntax-highlighted code samples
- `theme_colors.json` - Extracted color palette for comparison

**Features:**
- 🎨 **HTML preview** with actual theme colors
- 📝 **Syntax highlighting** for Lua, TypeScript, Python, and Markdown
- 🌈 **Color palette extraction** from Neovim highlight groups
- 🔍 **Line numbers** and proper code formatting

## 🤖 GitHub Actions

### Main CI Workflow (`.github/workflows/ci.yml`)
Runs on every PR and push to main:

- **Lint Job**: stylua formatting, luacheck linting, whitespace checks
- **Validate Job**: theme loading, module imports, highlight groups

### Theme Preview Workflow (`.github/workflows/preview.yml`) 
Runs on PR creation and updates:

- 🌿 **Automatic theme preview generation**
- 🔄 **Color comparison** between PR and base branch
- 💬 **PR comments** with visual previews
- 📎 **Artifact uploads** for manual inspection

The preview bot will:
1. Generate HTML previews for both PR and base branches
2. Compare color palettes and highlight changes
3. Post/update a comment on the PR with:
   - Visual theme preview
   - Color change summary table
   - Side-by-side comparison when colors change

## 🛠️ Development

### Prerequisites
```bash
# Install required tools
cargo install stylua
luarocks install luacheck

# Or via Homebrew
brew install stylua luacheck
```

### Running Locally
```bash
# Full lint check
./ci/lint.sh

# Generate theme preview
./ci/preview.sh

# Theme validation
nvim --headless -l ci/validate.lua
```

### Configuration Files
- `.luacheckrc` - Luacheck configuration with Neovim globals
- `stylua.toml` - Code formatting rules (if needed)

---

*May the Force be with your PRs.* ✨