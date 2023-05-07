return {
  "johmsalas/text-case.nvim",
  keys = {
   { "ga.", "<cmd>TextCaseOpenTelescope<CR>", desc = "Telescope" },
   { "ga.", "<cmd>TextCaseOpenTelescope<CR>", desc = "Teslescope", mode = "v"},
  },
  config = function()
    require('textcase').setup {}
    require('telescope').load_extension('textcase')
  end
}
