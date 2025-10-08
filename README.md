# yoda.nvim <img width="34" height="34" alt="lightsaber_1281055" src="https://github.com/user-attachments/assets/c3c50b91-43c5-4531-9c8a-86936dd1306a" />

![Preview](media/preview.png)

---

### ✨ Features

- Muted green palette for focused, balanced editing
- **Dark and light theme variants**
- Minimal UI with clear syntax contrast
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
use({
  "kuri-sun/yoda.nvim",
})
```

---

### ⚙️ Configuration

#### **Theme Variants**

```lua
-- Dark theme (default)
require("yoda").setup({
  theme = "dark",
})

-- Light theme
require("yoda").setup({
  theme = "light",
})

-- Toggle between themes
vim.keymap.set("n", "<leader>tt", function()
  require("yoda").toggle_theme()
end, { desc = "Toggle theme" })
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

### Extra (coming soon...)
