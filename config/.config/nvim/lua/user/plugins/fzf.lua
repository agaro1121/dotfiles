return {
  'ibhagwan/fzf-lua',
  ---@module 'fzf-lua'
  ---@type fzf-lua.Config|{}
  ---@diagnostics disable: missing-fields
  opts = {},
  config = function()
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
    vim.keymap.set('n', '<leader>lg', fzflua.grep_project, { desc = 'fzflua: Live grep' })
    vim.keymap.set('n', '<leader>/',  fzflua.lgrep_curbuf, { desc = 'fzflua: Live grep current file' })
  end
  ---@diagnostics enable: missing-fields
}
