return {
  "f-person/git-blame.nvim",
  config = function()
    vim.g.gitblame_display_virtual_text = 1 -- hides virtual text. Moved it to lualine.
    vim.g.gitblame_message_when_not_committed = 'GitBlame: Not Committed Yet'
    vim.cmd("GitBlameToggle") -- this is the only way?
    vim.keymap.set("n", "<leader>bl", ":GitBlameToggle<CR>")
  end
}
