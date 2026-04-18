vim.pack.add({
  -- required
  'https://github.com/nvim-lua/plenary.nvim',
  -- optional
  'https://github.com/ibhagwan/fzf-lua',
  
  'https://github.com/NeogitOrg/neogit'
})

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Show Neogit UI' })