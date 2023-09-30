return {
  "hinell/move.nvim",
  config = function ()
    local opts = { noremap = true, silent = true }
    -- normal mode
    vim.keymap.set('n', '<leader>k', ':MoveLine -1<CR>', opts)
    vim.keymap.set('n', '<leader>l', ':MoveWord 1<CR>', opts)
    vim.keymap.set('n', '<leader>h', ':MoveWord -1<CR>', opts)
    vim.keymap.set('n', '<leader>j', ':MoveLine 1<CR>', opts)

    -- visual mode
    vim.keymap.set('x', '<leader>j', ':MoveBlock 1<CR>', opts)
    vim.keymap.set('x', '<leader>k', ':MoveBlock -1<CR>', opts)
    vim.keymap.set('v', '<leader>h', ':MoveHBlock -1<CR>', opts)
    vim.keymap.set('v', '<leader>l', ':MoveHBlock 1<CR>', opts)
  end
}
