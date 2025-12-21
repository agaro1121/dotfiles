return {
  {
    'sainnhe/sonokai',
    lazy = true,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
    end
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin', -- doesn't work without this
    lazy = true,
    config = function()
      require('catppuccin').setup({
        flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      })
    end
  },
}
