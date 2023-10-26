return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'andromeda' -- andromeda, atlantis
      vim.cmd("colorscheme sonokai")
      vim.cmd("hi Visual guibg=White")
      vim.cmd("hi Visual guifg=#2b2d3a")
    end
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = true,
    config = function()
      local monokai = require('monokai')
      monokai.setup {}
      monokai.setup { palette = monokai.pro }
    end
  },
  {
    "lourenci/github-colors",
    lazy = true
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },

}
