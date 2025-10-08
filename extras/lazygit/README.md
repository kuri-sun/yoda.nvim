## Usage

1. Copy the `config.yml` file to your Lazygit configuration directory:

### Linux

```bash
mkdir -p ~/.config/lazygit
cp config.yml ~/.config/lazygit/config.yml
```

### macOS

```bash
mkdir -p ~/Library/Application\ Support/lazygit
cp config.yml ~/Library/Application\ Support/lazygit/config.yml
```

### Windows (PowerShell)

```powershell
mkdir "$env:LOCALAPPDATA\lazygit" -Force
Copy-Item config.yml "$env:LOCALAPPDATA\lazygit\config.yml"
```

2. Restart Lazygit to apply the theme

