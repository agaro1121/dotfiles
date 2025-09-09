local function fix_highlights()
  vim.cmd("hi Visual guibg=White")
  vim.cmd("hi Visual guifg=#2b2d3a")
  vim.cmd("hi LspReferenceRead guibg=White")   -- vim.lsp.buf.document_highlight
  vim.cmd("hi LspReferenceRead guifg=#2b2d3a") -- vim.lsp.buf.document_highlight
  vim.cmd("hi VirtualTextError guifg=Red")
end
return {
  {
    "sainnhe/sonokai",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'andromeda' -- andromeda, atlantis
      fix_highlights()
      -- vim.cmd("colorscheme sonokai")
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
    lazy = true,
    config = function ()
      require('nordic').setup{
        cursorline = {
        -- Bold font in cursorline.
        bold = false,
        -- Bold cursorline number.
        bold_number = true,
        -- Available styles: 'dark', 'light'.
        theme = 'light',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.35,
        },
      }
      fix_highlights()
      -- vim.cmd("colorscheme nordic")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin", -- doesn't work without this
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
      })
      fix_highlights()
      vim.cmd("colorscheme catppuccin-macchiato")
    end
  },
  {
    "Yazeed1s/minimal.nvim",
    lazy = true
  },
  {
    "datsfilipe/min-theme.nvim",
    lazy = true
  }
}
