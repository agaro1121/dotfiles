return {
  "chrisgrieser/nvim-origami",
  enabled = false,
  event = "LspAttach",
  dependencies = {
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          relculright = true,
          segments = {
            { text = { builtin.foldfunc } },
            { text = { "%s" } },
            { text = { builtin.lnumfunc, " " } },
          },
        })
      end,
    },
  },
  -- recommended: disable vim's auto-folding
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
  config = function()
    -- from ufo
    vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.opt.foldcolumn = 'auto:1' -- '0' is not bad
    -- from ufo

    -- default settings
    require("origami").setup {
      useLspFoldsWithTreesitterFallback = true,
      pauseFoldsOnSearch = true,
      foldtext = {
        enabled = true,
        padding = 3,
        lineCount = {
          template = "󰁂 %d lines", -- `%d` is replaced with the number of folded lines
          hlgroup = "Comment",
        },
        diagnosticsCount = nil, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
        gitsignsCount = false,  -- requires `gitsigns.nvim`
      },
      autoFold = {
        enabled = true,
        kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
      },
      foldKeymaps = {
        setup = true, -- modifies `h` and `l`
        hOnlyOpensOnFirstColumn = true,
      },
    }
  end
}
