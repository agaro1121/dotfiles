return {
  "f-person/git-blame.nvim",
  config = function ()
    vim.g.gitblame_display_virtual_text = 0 -- hides virtual text. Moved it to lualine.
  end
}
