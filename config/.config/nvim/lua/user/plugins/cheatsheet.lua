return {
  "sudormrfbin/cheatsheet.nvim",
  lazy = true,
  dependencies = {
    {"nvim-telescope/telescope.nvim"},
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
  },
  config = function ()
    map({"n", "v"}, "<leader>?", ":Cheatsheet<CR>")
  end
}
