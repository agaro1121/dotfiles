return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "drewtempelmeyer/palenight.vim",
    lazy = true,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'default'
      vim.cmd("colorscheme sonokai")
    end
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = true
  },
  {
    "lourenci/github-colors",
    lazy = true
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = true
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "rebelot/kanagawa.nvim"
  },
  {
    "ribru17/bamboo.nvim"
  },
  {
    "shaunsingh/nord.nvim"
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = true,
  }

}
