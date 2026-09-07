vim.pack.add {{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" }}

vim.pack.add{{ src = "https://github.com/neovim/nvim-lspconfig" }}

vim.pack.add{{ src = "https://github.com/akinsho/bufferline.nvim" }}
vim.pack.add{{ src = "https://github.com/nvim-tree/nvim-web-devicons" }}
require("bufferline").setup()

vim.pack.add{{ src = "https://github.com/nvim-telescope/telescope.nvim" }}
vim.pack.add{{ src = "https://github.com/nvim-lua/plenary.nvim" }}
vim.pack.add{{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" }}

-- vim.pack.add{{ src = "https://github.com/saghen/blink.lib" }}
vim.pack.add{{ src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" }}
vim.pack.add{{ src = "https://github.com/rafamadriz/friendly-snippets" }}


require("blink.cmp").setup({
  keymap = { preset = "enter" },
  appearance = {
    nerd_font_variant = "normal"
  },
  completion = {
    documentation = { auto_show = false }
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = {
    implementation = "prefer_rust"
  }
})
