return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
      default_file_explorer = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    })
    vim.keymap.set("n", "-", ":Oil<CR>", {desc = "oil.toggle"})
  end
}
