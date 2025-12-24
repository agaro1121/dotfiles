---@module "lazy"
---@type LazySpec
return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
  },
  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    opts = {},
    config = function()
      require('treesitter-modules').setup({
        ensure_installed = {
          'bash',
          'comment',
          'css',
          'diff',
          'git_config',
          'git_rebase',
          'gitcommit',
          'gitignore',
          'html',
          'javascript',
          'json',
          'lua',
          'luadoc',
          'make',
          'markdown',
          'markdown_inline',
          'python',
          'query',
          'regex',
          'toml',
          'vim',
          'vimdoc',
          'xml',
          'scala',
          'yaml',
          'latex'
        },
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        fold = { enable = false, disable = false },
        highlight = {
          enable = true,
          -- setting this to true will run `:h syntax` and tree-sitter at the same time
          -- set this to `true` if you depend on 'syntax' being enabled
          -- using this option may slow down your editor, and duplicate highlights
          -- instead of `true` it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          -- set value to `false` to disable individual mapping
          -- node_decremental captures both node_incremental and scope_incremental
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        indent = { enable = true },
      })
    end
  }
}
