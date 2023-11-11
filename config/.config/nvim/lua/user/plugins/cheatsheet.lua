return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    {"nvim-telescope/telescope.nvim"},
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
  },
  config = function ()
    map({"n", "v"}, "<leader>?", ":Cheatsheet<CR>")
  end
}
