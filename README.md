# yoda.nvim <img width="34" height="34" alt="lightsaber_1281055" src="https://github.com/user-attachments/assets/c3c50b91-43c5-4531-9c8a-86936dd1306a" />

![yoda.nvim preview](media/preview2.png)

---

### ✨ Features

- Muted green palette for focused, balanced editing
- Dark and light theme variants
- Tree-sitter & LSP semantic highlighting support
- Works with **Lazy.nvim**, **Packer**, and **Plug**

<details>
<summary><b>🔌 Supported Plugins</b></summary>

| Plugin                                                                          | Highlights                                      |
| ------------------------------------------------------------------------------- | ----------------------------------------------- |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)                 | [neo-tree.lua](lua/yoda/plugins/neo-tree.lua)   |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                     | [nvim-tree.lua](lua/yoda/plugins/nvim-tree.lua) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)              | [telescope.lua](lua/yoda/plugins/telescope.lua) |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                 | [cmp.lua](lua/yoda/plugins/cmp.lua)             |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                     | [gitsigns.lua](lua/yoda/plugins/gitsigns.lua)   |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                    | [lualine.lua](lua/yoda/plugins/lualine.lua)     |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | [misc.lua](lua/yoda/plugins/misc.lua)           |
| [snacks.nvim](https://github.com/folke/snacks.nvim)                             | [misc.lua](lua/yoda/plugins/misc.lua)           |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)                     | [misc.lua](lua/yoda/plugins/misc.lua)           |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                       | [misc.lua](lua/yoda/plugins/misc.lua)           |

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

### 🎨 Extras

- **[Lazygit](extras/lazygit/)**
- **[Alacritty](extras/alacritty/)**
- **[Tmux](extras/tmux/)**
