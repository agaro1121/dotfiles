return {
  "f-person/git-blame.nvim",
  config = function()
    vim.g.gitblame_display_virtual_text = 0 -- hides virtual text. Moved it to lualine.
    vim.g.gitblame_message_when_not_committed = 'GitBlame: Not Committed Yet'
    vim.g.gitblame_enabled = 0              -- disable on start. Huge perf hit when operating on many files at once.
    vim.keymap.set("n", "<leader>bl", ":GitBlameToggle<CR>")
    vim.cmd([[:GitBlameDisable]])
  end
}
