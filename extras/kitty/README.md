# Yoda Theme for Kitty Terminal

This directory contains Kitty terminal configurations for the Yoda theme.

## Installation

### Dark Theme

**Option 1: Direct use**
```bash
cp kitty.conf ~/.config/kitty/kitty.conf
```

**Option 2: Include in existing config**

Add this line to your existing `~/.config/kitty/kitty.conf`:
```conf
include /path/to/yoda.nvim/extras/kitty/kitty.conf
```

Or copy just the color scheme and paste it into your existing config.

### Light Theme

**Option 1: Direct use**
```bash
cp kitty-light.conf ~/.config/kitty/kitty.conf
```

**Option 2: Include in existing config**

Add this line to your existing `~/.config/kitty/kitty.conf`:
```conf
include /path/to/yoda.nvim/extras/kitty/kitty-light.conf
```

## Notes

- Both config files contain commented-out optional settings at the bottom. Uncomment and adjust them to your preference.
- The configs include tab bar styling, cursor colors, and window border colors to match the Yoda theme aesthetic.
- After making changes, reload Kitty with `Ctrl+Shift+F5` or restart the terminal.

## Switching Between Themes

You can create separate config files and switch between them:

1. Create theme-specific configs:
   - `~/.config/kitty/yoda-dark.conf` (dark theme colors)
   - `~/.config/kitty/yoda-light.conf` (light theme colors)

2. In your main `~/.config/kitty/kitty.conf`, include one:
   ```conf
   include yoda-dark.conf
   # include yoda-light.conf
   ```

3. Comment/uncomment the desired theme and reload Kitty.

May the Force be with you! ✨
