return {
  'Wansmer/treesj',
  keys = { '<space>m', "<cmd>TSJToggle<CR>", desc = "Toggle Treesitter join" },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup({--[[ your config ]]})
  end,
}
