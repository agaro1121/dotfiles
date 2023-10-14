return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    })
    map("n", "-", ":Oil<CR>")
  end
}
