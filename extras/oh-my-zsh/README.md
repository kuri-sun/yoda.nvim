# Yoda Theme for Oh My Zsh

A Powerline-style theme with background colors, OS icons, and smart environment detection.

## Features

- **Powerline Design** - Multi-line segmented prompt with colored backgrounds and powerline separators
- **OS Icon Detection** - Automatically shows the appropriate icon:
  - 🍎  macOS
  -  Arch Linux
  -  Debian/Ubuntu
  -  RedHat/Fedora/CentOS
  -  Generic Linux
  -  Windows WSL
- **Git Integration** - Branch name with clean/dirty status
- **Python Virtual Environment** - Shows active venv
- **Node.js Version** - Displays Node version when in a project directory
- **Status Indicator** - Green prompt on success, red on error
- **SSH Detection** - Shows user@host only for remote sessions (local sessions hide username for cleaner look)

## Installation

### Dark Theme

1. Copy the theme file to your Oh My Zsh custom themes directory:

   ```bash
   cp yoda.zsh-theme ~/.oh-my-zsh/custom/themes/
   ```

2. Set the theme in your `~/.zshrc`:

   ```bash
   ZSH_THEME="yoda"
   ```

3. Reload your shell:
   ```bash
   source ~/.zshrc
   ```

### Light Theme

1. Copy the light theme to your custom themes directory:

   ```bash
   cp yoda-light.zsh-theme ~/.oh-my-zsh/custom/themes/
   ```

2. Set the theme in your `~/.zshrc`:

   ```bash
   ZSH_THEME="yoda-light"
   ```

3. Reload your shell:

   ```bash
   source ~/.zshrc
   ```

## Font Requirements

For the best experience, use a [Nerd Font](https://www.nerdfonts.com/) that includes icon glyphs:
- JetBrains Mono Nerd Font (recommended)
- Fira Code Nerd Font
- Any other Nerd Font

Without a Nerd Font, OS icons will not display correctly.
