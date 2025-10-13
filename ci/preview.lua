#!/usr/bin/env nvim -l
-- ci/preview.lua
-- Generate theme preview for PR comments

-- Set up paths
local project_root = vim.fn.getcwd()
vim.opt.runtimepath:prepend(project_root)

local M = {}

-- Sample code to showcase the theme
local code_samples = {
    lua = [[
-- Lua example showcasing yoda.nvim theme
local config = {
  theme = "yoda",
  transparent_background = false,
  italic_comments = true,
}

-- TODO: Add more customization options
function setup_theme()
  local colors = require("yoda.colors").palette

  if config.transparent_background then
    colors.bg = "NONE"
  end

  -- Apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

local function calculate_brightness(hex)
  local r = tonumber(hex:sub(2, 3), 16)
  local g = tonumber(hex:sub(4, 5), 16)
  local b = tonumber(hex:sub(6, 7), 16)
  return (r * 299 + g * 587 + b * 114) / 1000
end

-- Export module
return {
  setup = setup_theme,
  config = config,
}]],

    typescript = [[
// TypeScript example with yoda.nvim theme
interface ThemeConfig {
  name: string;
  variant: 'dark' | 'light';
  colors: Record<string, string>;
}

const YODA_THEME: ThemeConfig = {
  name: 'yoda',
  variant: 'dark',
  colors: {
    primary: '#00dd88',
    secondary: '#5a7a5a',
  }
};

class ThemeManager {
  private config: ThemeConfig;

  constructor(config: ThemeConfig) {
    this.config = config;
  }

  // TODO: Implement theme switching
  async applyTheme(): Promise<void> {
    try {
      const response = await fetch('/api/theme');
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }
      console.log('Theme applied successfully');
    } catch (error) {
      console.error('Failed to apply theme:', error);
    }
  }
}

export default ThemeManager;]],

    python = [[
# Python example with yoda.nvim theme
from typing import Dict, List, Optional
import json
import logging

# Configure logging
logger = logging.getLogger(__name__)

class YodaTheme:
    """A serene theme inspired by the wise Jedi Master."""

    def __init__(self, variant: str = "dark"):
        self.variant = variant
        self.colors = self._load_colors()

    def _load_colors(self) -> Dict[str, str]:
        """Load theme colors from configuration."""
        # TODO: Load from external config file
        return {
            "background": "#050705",
            "foreground": "#d4d4d4",
            "accent": "#00dd88",
            "string": "#b9f6ca",
            "comment": "#5a7a5a",
        }

    def apply(self, editor: Optional[str] = None) -> bool:
        """Apply the theme to the specified editor."""
        try:
            if not editor:
                editor = "neovim"

            # Apply color scheme
            for element, color in self.colors.items():
                self._set_color(element, color)

            logger.info(f"Applied {self.variant} theme to {editor}")
            return True

        except Exception as e:
            logger.error(f"Failed to apply theme: {e}")
            return False

    def _set_color(self, element: str, color: str) -> None:
        """Set color for a specific element."""
        pass  # Implementation depends on editor]],

    markdown = [[
# 🌿 Yoda.nvim Theme Preview

> *"Do or do not, there is no try."* - Master Yoda

## Features

- **🎨 Serene colors** inspired by nature
- **🌓 Dark/Light variants** for any time of day
- **🔌 Plugin support** for modern Neovim
- **⚡ Fast loading** with optimized code

## Installation

```lua
-- Using lazy.nvim
{
  'kuri-sun/yoda.nvim',
  config = function()
    require('yoda').setup({
      style = 'dark',
      transparent_background = false,
    })
    vim.cmd('colorscheme yoda')
  end
}
```

## Color Palette

| Element | Color | Usage |
|---------|-------|-------|
| Background | `#050705` | Main editor background |
| Accent | `#00dd88` | Keywords, highlights |
| String | `#b9f6ca` | String literals |
| Comment | `#5a7a5a` | Code comments |

### Code Examples

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

```javascript
const greet = (name) => {
  console.log(`Hello, ${name}!`);
};
```

---

*May the Force be with you.* ✨]],
}

-- Get highlight group color as hex
local function get_hl_color(group, attr)
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    if hl[attr] then
        return string.format("#%06x", hl[attr])
    end
    return nil
end

-- Extract all colors from current theme
local function extract_theme_colors()
    local colors = {}

    -- Map highlight groups to semantic names
    local mappings = {
        background = { group = "Normal", attr = "bg" },
        foreground = { group = "Normal", attr = "fg" },
        comment = { group = "Comment", attr = "fg" },
        string = { group = "String", attr = "fg" },
        number = { group = "Number", attr = "fg" },
        keyword = { group = "Keyword", attr = "fg" },
        ["function"] = { group = "Function", attr = "fg" },
        type = { group = "Type", attr = "fg" },
        constant = { group = "Constant", attr = "fg" },
        operator = { group = "Operator", attr = "fg" },
        error = { group = "ErrorMsg", attr = "fg" },
        warning = { group = "WarningMsg", attr = "fg" },
        cursor_line = { group = "CursorLine", attr = "bg" },
        visual = { group = "Visual", attr = "bg" },
        search = { group = "Search", attr = "bg" },
    }

    for name, mapping in pairs(mappings) do
        local color = get_hl_color(mapping.group, mapping.attr)
        if color then
            colors[name] = color
        end
    end

    return colors
end

-- Generate CSS from theme colors
local function generate_css(colors)
    local css_template = [[
:root {
  --bg-color: %s;
  --fg-color: %s;
  --comment-color: %s;
  --string-color: %s;
  --number-color: %s;
  --keyword-color: %s;
  --function-color: %s;
  --type-color: %s;
  --constant-color: %s;
  --operator-color: %s;
  --cursor-line-color: %s;
  --visual-color: %s;
}

.preview-container {
  font-family: 'JetBrains Mono', 'Fira Code', 'SF Mono', Consolas, monospace;
  font-size: 14px;
  line-height: 1.5;
  background: var(--bg-color);
  color: var(--fg-color);
  padding: 20px;
  border-radius: 8px;
  overflow-x: auto;
  margin: 10px 0;
}

.code-block {
  background: var(--bg-color);
  border: 1px solid #333;
  border-radius: 6px;
  padding: 16px;
  margin: 12px 0;
  position: relative;
}

.code-header {
  position: absolute;
  top: 8px;
  right: 12px;
  font-size: 12px;
  opacity: 0.7;
  color: var(--comment-color);
}

.line-number {
  color: var(--comment-color);
  opacity: 0.6;
  margin-right: 16px;
  user-select: none;
  display: inline-block;
  width: 30px;
  text-align: right;
}

/* Syntax highlighting classes */
.comment { color: var(--comment-color); font-style: italic; }
.string { color: var(--string-color); }
.number { color: var(--number-color); }
.keyword { color: var(--keyword-color); font-weight: bold; }
.function { color: var(--function-color); }
.type { color: var(--type-color); }
.constant { color: var(--constant-color); }
.operator { color: var(--operator-color); }

/* Special elements */
.todo { background: #ff6b6b; color: #fff; padding: 2px 4px; border-radius: 3px; }
.cursor-line { background: var(--cursor-line-color); }

.color-swatch {
  display: inline-block;
  width: 16px;
  height: 16px;
  border-radius: 3px;
  margin-right: 8px;
  vertical-align: middle;
  border: 1px solid rgba(255,255,255,0.2);
}
]]

    return string.format(
        css_template,
        colors.background or "#050705",
        colors.foreground or "#d4d4d4",
        colors.comment or "#5a7a5a",
        colors.string or "#b9f6ca",
        colors.number or "#7dd3c0",
        colors.keyword or "#f48fb1",
        colors["function"] or "#d4a574",
        colors.type or "#81c784",
        colors.constant or "#7dd3c0",
        colors.operator or "#f48fb1",
        colors.cursor_line or "#1a1b1a",
        colors.visual or "#264f78"
    )
end

-- Simple syntax highlighter (basic regex-based)
local function highlight_code(code, lang)
    -- Basic patterns for different languages
    local patterns = {
        lua = {
            { pattern = "(%-%-[^\n]*)", class = "comment" },
            { pattern = "(['\"][^'\"]*['\"])", class = "string" },
            { pattern = "(%d+%.?%d*)", class = "number" },
            {
                pattern = "\\b(local|function|if|then|else|end|for|while|do|return|require|true|false|nil)\\b",
                class = "keyword",
            },
            { pattern = "\\b([%w_]+)%(", class = "function" },
            { pattern = "(TODO|FIXME|NOTE):", class = "todo" },
        },
        typescript = {
            { pattern = "(//[^\n]*|/\\*[^*]*\\*/)", class = "comment" },
            { pattern = "(['\"`][^'\"]*['\"`])", class = "string" },
            { pattern = "(%d+%.?%d*)", class = "number" },
            {
                pattern = "\\b(interface|class|function|const|let|var|if|else|return|import|export|async|await|try|catch|throw)\\b",
                class = "keyword",
            },
            { pattern = "\\b(string|number|boolean|void|Promise)\\b", class = "type" },
            { pattern = "\\b([%w_]+)%(", class = "function" },
            { pattern = "(TODO|FIXME|NOTE):", class = "todo" },
        },
        python = {
            { pattern = "(#[^\n]*)", class = "comment" },
            { pattern = "(['\"][^'\"]*['\"])", class = "string" },
            { pattern = "(%d+%.?%d*)", class = "number" },
            {
                pattern = "\\b(def|class|if|else|elif|return|import|from|try|except|with|as|True|False|None)\\b",
                class = "keyword",
            },
            { pattern = "\\b(str|int|float|bool|list|dict|tuple)\\b", class = "type" },
            { pattern = "\\b([%w_]+)%(", class = "function" },
            { pattern = "(TODO|FIXME|NOTE):", class = "todo" },
        },
    }

    local lang_patterns = patterns[lang] or patterns.lua
    local highlighted = code

    -- Apply syntax highlighting (simple approach)
    for _, rule in ipairs(lang_patterns) do
        -- Note: This is a simplified approach for demo
        -- In production, you'd want a proper syntax highlighter
        local pattern = rule.pattern:gsub("\\b", ""):gsub("\\(", "("):gsub("\\)", ")")
        highlighted = highlighted:gsub(pattern, '<span class="' .. rule.class .. '">%1</span>')
    end

    return highlighted
end

-- Generate HTML preview
function M.generate_preview()
    -- Load the theme
    pcall(vim.cmd, "colorscheme yoda")

    local colors = extract_theme_colors()
    local css = generate_css(colors)

    -- Create color palette section
    local color_palette_html = "<h3>🎨 Color Palette</h3><div class='color-palette'>"
    for name, color in pairs(colors) do
        color_palette_html = color_palette_html
            .. string.format(
                '<div><span class="color-swatch" style="background-color: %s;"></span><strong>%s:</strong> <code>%s</code></div>',
                color,
                name:gsub("_", " "):gsub("^%l", string.upper),
                color
            )
    end
    color_palette_html = color_palette_html .. "</div>"

    -- Generate code samples
    local code_samples_html = "<h3>📝 Code Samples</h3>"
    for lang, code in pairs(code_samples) do
        local lines = vim.split(code, "\n")
        local numbered_lines = {}
        for i, line in ipairs(lines) do
            table.insert(
                numbered_lines,
                string.format('<span class="line-number">%2d</span>%s', i, highlight_code(line, lang))
            )
        end

        code_samples_html = code_samples_html
            .. string.format(
                '<div class="code-block"><div class="code-header">%s</div><pre>%s</pre></div>',
                lang,
                table.concat(numbered_lines, "\n")
            )
    end

    -- Complete HTML
    local html = string.format(
        [[
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>yoda.nvim Theme Preview</title>
  <style>%s</style>
</head>
<body>
  <div class="preview-container">
    <h2>🌿 yoda.nvim Theme Preview</h2>
    %s
    %s
  </div>
</body>
</html>]],
        css,
        color_palette_html,
        code_samples_html
    )

    return html, colors
end

-- Main function for CLI usage
function M.main()
    local html, colors = M.generate_preview()

    -- Write HTML file
    local html_file = "theme_preview.html"
    vim.fn.writefile(vim.split(html, "\n"), html_file)
    print("📁 Theme preview generated: " .. html_file)

    -- Write colors JSON for comparison
    local colors_file = "theme_colors.json"
    vim.fn.writefile({ vim.fn.json_encode(colors) }, colors_file)
    print("🎨 Theme colors extracted: " .. colors_file)

    return 0
end

-- Run if called directly
if vim.fn.expand("%:t") == "preview.lua" or arg and arg[0]:match("preview%.lua$") then
    os.exit(M.main())
end

return M
