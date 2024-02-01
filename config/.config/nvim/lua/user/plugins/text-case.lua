return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")

    map({ "n", "v" }, "ga.", ":TextCaseOpenTelescope<CR>")
  end
}

