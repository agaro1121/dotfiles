return {
  'MeanderingProgrammer/treesitter-modules.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    auto_install = true,
    fold = { enable = false },
    highlight = { enable = false },
    indent = { enable = false },
    incremental_selection = { enable = true },
  }
}
