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
      vim.cmd("hi LspReferenceRead guibg=White")   -- vim.lsp.buf.document_highlight
      vim.cmd("hi LspReferenceRead guifg=#2b2d3a") -- vim.lsp.buf.document_highlight
      vim.cmd("hi VirtualTextError guifg=Red")
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
    "Mofiqul/vscode.nvim",
    lazy = true
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true
  },
  {
    "cpea2506/one_monokai.nvim",
    lazy = true
  },
  {
    "catppuccin/nvim",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
      })
      -- vim.cmd("colorscheme catppuccin-macchiato")
      vim.cmd("hi Visual guibg=White")
      vim.cmd("hi Visual guifg=#2b2d3a")
      vim.cmd("hi LspReferenceRead guibg=White")   -- vim.lsp.buf.document_highlight
      vim.cmd("hi LspReferenceRead guifg=#2b2d3a") -- vim.lsp.buf.document_highlight
      vim.cmd("hi VirtualTextError guifg=Red")
    end
  },
  {
    "Yazeed1s/minimal.nvim",
    lazy = true
  },
  {
    "neko-night/nvim",
    lazy = true,
  }
}
