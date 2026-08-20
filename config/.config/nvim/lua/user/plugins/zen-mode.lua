vim.pack.add({
  'https://github.com/folke/zen-mode.nvim',
})

vim.keymap.set('n', '<leader>za', '<cmd>ZenMode<cr>', { desc = 'metals: menu' })
