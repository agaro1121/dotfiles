return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').git_files({show_untracked=true})<cr>" },
      { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles({only_cwd=true})<cr>" },
      { "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
      { "<leader>bs", "<cmd>lua require('telescope.builtin').buffers({show_all_buffers = false, sort_mru=true, ignore_current_buffer=false})<cr>" },
      { "<leader>sp", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
      { "<leader>gs", "<cmd>lua require('telescope.builtin').grep_string()<cr>" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          -- args for live_grep and grep_string
          vimgrep_arguments = { -- install ripgrep!
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            -- '--glob',
            -- '!{**/.git/*, **/.metals/*}', --do not search git,metals directory
          },
          file_ignore_patterns = {
            ".git/.*"
          }
        }
      })

      telescope.load_extension("ui-select")
    end
  }
}
