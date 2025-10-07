# 🌿 yoda.nvim

> A calm and minimal Neovim theme inspired by wisdom and focus.

![Preview](media/preview.png)

---

### ✨ Features

- Muted green palette for focused, balanced editing
- Minimal UI with clear syntax contrast
- Tree-sitter & LSP semantic highlighting support
- Works with **Lazy.nvim**, **Packer**, and **Plug**

---

### 🚀 Installation

#### **Lazy.nvim**
```lua
{
  "kuri-sun/yoda.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme yoda")
  end,
}
```

#### **Packer**
```lua
use({
  "kuri-sun/yoda.nvim",
  config = function()
    vim.cmd("colorscheme yoda")
  end,
})
```

---

### 🧠 Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines.

---

### 🪪 License

MIT © 2025 kuri-sun
