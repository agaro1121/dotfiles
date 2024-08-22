return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    {"ga.", ":TextCaseOpenTelescope<CR>", mode = { "n", "v" }}
  },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")

    map({ "n", "v" }, "ga.", ":TextCaseOpenTelescope<CR>", {desc = "textcase.open"})
  end
}

