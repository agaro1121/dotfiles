return {
  "echasnovski/mini.files",
  config = function()
    require('mini.files').setup({
      mappings = {
        close       = 'e',
      },
      options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = false,
      },
    })
    map("n", "<leader>mf", require("mini.files").open)
  end
}
