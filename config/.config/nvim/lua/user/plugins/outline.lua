return {
  'hedyhli/outline.nvim',
  dependencies = {
      'epheien/outline-treesitter-provider.nvim'
  },
  config = function()
    require('outline').setup {
       providers = {
         priority = { 'lsp', 'coc', 'markdown', 'norg', 'man', 'treesitter' }
      }
    }

    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'outline: Toggle' })
  end,
}
