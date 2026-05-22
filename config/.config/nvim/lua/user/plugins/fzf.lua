vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua'
})

local fzflua = require('fzf-lua')
fzflua.setup{
  keymap = {
    fzf = {
      ['ctrl-q'] = 'select-all+accept', -- send results to quickfix
    }
  }
}
fzflua.register_ui_select() -- use fzf-lua as neovim's `vim.ui.select`

vim.keymap.set('n', '<leader>ff', fzflua.files, { desc = 'fzflua: Find files' })
vim.keymap.set('n', '<leader>tk', fzflua.keymaps, { desc = 'fzflua: Keymaps' })
-- vim.keymap.set('n', '<leader>lg', fzflua.live_grep_native, { desc = 'fzflua: Live grep' })
vim.keymap.set('n', '<leader>lg', fzflua.live_grep, { desc = 'fzflua: Live grep glob' })
vim.keymap.set('v', '<leader>lgs', fzflua.grep_visual, { desc = 'fzflua: Live grep highlighted text' })
vim.keymap.set('n', '<leader>lgs', fzflua.grep_cword, { desc = 'fzflua: Live grep word under cursor' })
vim.keymap.set('n', '<leader>/',  fzflua.lgrep_curbuf, { desc = 'fzflua: Live grep current file' })
vim.keymap.set('n', '<leader>bs',  fzflua.buffers, { desc = 'fzflua: Open buffers' })
