# Contributing to yoda.nvim

Thank you for your interest in contributing to yoda.nvim! We welcome contributions that help improve this Neovim colorscheme.

## Development Setup

1. Fork and clone the repository
2. Create a symlink or use the local development path in your Neovim config:
   ```lua
   -- For development
   {
     dir = "~/path/to/yoda.nvim",
     lazy = false,
     priority = 1000,
     config = function()
       vim.cmd("colorscheme yoda")
     end,
   }
   ```

## Making Changes

### Color Palette
- Edit `lua/yoda/colors.lua` to modify the color palette
- Keep the minimal philosophy - avoid adding too many colors

### Highlights
- Edit `lua/yoda/highlights.lua` to change highlight groups
- Test with both Tree-sitter and LSP enabled/disabled

### Testing
1. Test with various file types (Lua, JavaScript, Python, etc.)
2. Verify both dark and light backgrounds work (if applicable)
3. Check terminal colors are properly set

## Submitting Changes

1. Create a feature branch: `git checkout -b feature/your-feature`
2. Make your changes and commit with clear messages
3. Push to your fork and open a Pull Request
4. Describe what changes you made and why

## Code Style

- Use consistent Lua formatting
- Add comments for non-obvious color choices
- Follow the existing code structure

## Questions?

Feel free to open an issue for any questions or suggestions!
