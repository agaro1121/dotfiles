vim.pack.add({
  { src = 'https://github.com/smart-splits-nvim/smart-splits.nvim', version = '^3.0.0' },
  'https://github.com/smart-splits-nvim/backend-tmux',
})

require('smart-splits').setup({
  ignored_filetypes = { 'NvimTree' },

  resize = {
    -- the default number of lines/columns to resize by at a time
    amount = 2,
  },

  mux = {
    -- enable or disable the tmux integration
    backend = 'smart-splits-backend-tmux',
  },
})
-- recommended mappings
-- resizing splits
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left,       { desc = 'smartsplits: resize left' })
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down,       { desc = 'smartsplits: resize down' })
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up,         { desc = 'smartsplits: resize up' })
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right,      { desc = 'smartsplits: resize right' })
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left,  { desc = 'smartsplits: move cursor left' })
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down,  { desc = 'smartsplits: move cursor down' })
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up,    { desc = 'smartsplits: move cursor up' })
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = 'smartsplits: move cursor right' })
