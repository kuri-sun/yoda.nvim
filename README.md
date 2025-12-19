# yoda.nvim

### ✨ Features

- Muted green palette for focused, balanced editing
- Dark and light theme variants
- Tree-sitter & LSP semantic highlighting support
- Works with **Lazy.nvim**, **Packer**, and **Plug**

<details>
<summary><b>🔌 Supported Plugins</b></summary>

| Plugin                                                                          | Highlights                                                    |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)                 | [neo-tree.lua](lua/yoda/plugins/neo-tree.lua)                 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                     | [nvim-tree.lua](lua/yoda/plugins/nvim-tree.lua)               |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)              | [telescope.lua](lua/yoda/plugins/telescope.lua)               |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                 | [cmp.lua](lua/yoda/plugins/cmp.lua)                           |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                     | [gitsigns.lua](lua/yoda/plugins/gitsigns.lua)                 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                    | [lualine.lua](lua/lualine/themes/yoda.lua)                    |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | [indent-blankline.lua](lua/yoda/plugins/indent-blankline.lua) |
| [snacks.nvim](https://github.com/folke/snacks.nvim)                             | [snacks.lua](lua/yoda/plugins/snacks.lua)                     |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)                     | [dashboard.lua](lua/yoda/plugins/dashboard.lua)               |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                       | [which-key.lua](lua/yoda/plugins/which-key.lua)               |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)               | [todo-comments.lua](lua/yoda/plugins/todo-comments.lua)       |
| netrw (built-in)                                                                | [netrw.lua](lua/yoda/plugins/netrw.lua)                       |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                           | [mini.lua](lua/yoda/plugins/mini.lua)                         |
| [noice.nvim](https://github.com/folke/noice.nvim)                               | [noice.lua](lua/yoda/plugins/noice.lua)                       |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                           | [trouble.lua](lua/yoda/plugins/trouble.lua)                   |

</details>

---

### 🎨 Color Palette

<details>
<summary><b>Dark Theme</b></summary>

| Color            | Hex       | Preview                                                         | Usage                          |
| ---------------- | --------- | --------------------------------------------------------------- | ------------------------------ |
| **Accent**       | `#00dd88` | ![#00dd88](https://via.placeholder.com/80x20/00dd88/00dd88.png) | Primary accent, function calls |
| **String Green** | `#b9f6ca` | ![#b9f6ca](https://via.placeholder.com/80x20/b9f6ca/b9f6ca.png) | Strings                        |
| **Number**       | `#7dd3c0` | ![#7dd3c0](https://via.placeholder.com/80x20/7dd3c0/7dd3c0.png) | Numbers                        |
| **String**       | `#e6d7a3` | ![#e6d7a3](https://via.placeholder.com/80x20/e6d7a3/e6d7a3.png) | Booleans, constants            |
| **Brown**        | `#d4a574` | ![#d4a574](https://via.placeholder.com/80x20/d4a574/d4a574.png) | Functions, methods             |
| **Interface**    | `#4fa8d8` | ![#4fa8d8](https://via.placeholder.com/80x20/4fa8d8/4fa8d8.png) | Types, classes                 |
| **Pink**         | `#e6a3d0` | ![#e6a3d0](https://via.placeholder.com/80x20/e6a3d0/e6a3d0.png) | Keywords, control flow         |
| **Todo Purple**  | `#a78bfa` | ![#a78bfa](https://via.placeholder.com/80x20/a78bfa/a78bfa.png) | TODO comments                  |
| **Error**        | `#ff6666` | ![#ff6666](https://via.placeholder.com/80x20/ff6666/ff6666.png) | Errors, deletions              |
| **Warning**      | `#ffee58` | ![#ffee58](https://via.placeholder.com/80x20/ffee58/ffee58.png) | Warnings, changes              |
| **Foreground**   | `#d4d4d4` | ![#d4d4d4](https://via.placeholder.com/80x20/d4d4d4/d4d4d4.png) | Default text                   |
| **Background**   | `#050705` | ![#050705](https://via.placeholder.com/80x20/050705/050705.png) | Editor background              |
| **Dim**          | `#5a7a5a` | ![#5a7a5a](https://via.placeholder.com/80x20/5a7a5a/5a7a5a.png) | Comments                       |
| **Subtle**       | `#7a9a8a` | ![#7a9a8a](https://via.placeholder.com/80x20/7a9a8a/7a9a8a.png) | Punctuation, operators         |

</details>

<details>
<summary><b>Light Theme</b></summary>

| Color            | Hex       | Preview                                                         | Usage                          |
| ---------------- | --------- | --------------------------------------------------------------- | ------------------------------ |
| **Accent**       | `#3bb07a` | ![#3bb07a](https://via.placeholder.com/80x20/3bb07a/3bb07a.png) | Primary accent, function calls |
| **String Green** | `#2e7d32` | ![#2e7d32](https://via.placeholder.com/80x20/2e7d32/2e7d32.png) | Strings                        |
| **Number**       | `#57aeb6` | ![#57aeb6](https://via.placeholder.com/80x20/57aeb6/57aeb6.png) | Numbers                        |
| **String**       | `#b89335` | ![#b89335](https://via.placeholder.com/80x20/b89335/b89335.png) | Booleans, constants            |
| **Brown**        | `#b88347` | ![#b88347](https://via.placeholder.com/80x20/b88347/b88347.png) | Functions, methods             |
| **Interface**    | `#6aa8ef` | ![#6aa8ef](https://via.placeholder.com/80x20/6aa8ef/6aa8ef.png) | Types, classes                 |
| **Pink**         | `#b0307a` | ![#b0307a](https://via.placeholder.com/80x20/b0307a/b0307a.png) | Keywords, control flow         |
| **Todo Purple**  | `#b0a4f5` | ![#b0a4f5](https://via.placeholder.com/80x20/b0a4f5/b0a4f5.png) | TODO comments                  |
| **Error**        | `#e38a8a` | ![#e38a8a](https://via.placeholder.com/80x20/e38a8a/e38a8a.png) | Errors, deletions              |
| **Warning**      | `#f0b56d` | ![#f0b56d](https://via.placeholder.com/80x20/f0b56d/f0b56d.png) | Warnings, changes              |
| **Foreground**   | `#1a1d1f` | ![#1a1d1f](https://via.placeholder.com/80x20/1a1d1f/1a1d1f.png) | Default text                   |
| **Background**   | `#f3f5f4` | ![#f3f5f4](https://via.placeholder.com/80x20/f3f5f4/f3f5f4.png) | Editor background              |
| **Dim**          | `#56606b` | ![#56606b](https://via.placeholder.com/80x20/56606b/56606b.png) | Comments                       |
| **Subtle**       | `#6b7280` | ![#6b7280](https://via.placeholder.com/80x20/6b7280/6b7280.png) | Punctuation, operators         |

</details>

---

### 🚀 Installation

#### **Lazy.nvim**

```lua
{
  "kuri-sun/yoda.nvim",
}
```

#### **Packer**

```lua
use { "kuri-sun/yoda.nvim" }

```

---

### 🚀 Usage

```lua
vim.cmd("colorscheme yoda")
```

---

### ⚙️ Configuration

```lua
require("yoda").setup({
    -- Set light or dark variant
    theme = "dark", -- "dark" or "light"

    -- Style options
    italic_comments = true,
    transparent_background = false,
    bold_keywords = true,
    underline_match_paren = true,

    -- Override specific colors
    colors = {}, -- Override palette colors

    -- Override specific highlight groups
    highlights = {}, -- Override highlight groups

    -- Disable or enable colorscheme extensions
    extensions = {
        telescope = true,
        neo_tree = true,
        nvim_tree = true,
        cmp = true,
        gitsigns = true,
        snacks = true,
        netrw = true,
        todo_comments = true,
        indent_blankline = true,
        dashboard = true,
        which_key = true,
        misc = true,
        mini = true,
        noice = true,
        trouble = true,
    },
})
```

#### **Lualine Setup**

To use the yoda theme with lualine:

```lua
require('lualine').setup {
  options = {
    theme = 'yoda',
    -- ... other lualine options
  }
}
```

---

### 🎁 Extras

- **[Lazygit](extras/lazygit/)**
- **[Alacritty](extras/alacritty/)**
- **[Kitty](extras/kitty/)**
- **[Tmux](extras/tmux/)**
- **[Oh My Zsh](extras/oh-my-zsh/)**
