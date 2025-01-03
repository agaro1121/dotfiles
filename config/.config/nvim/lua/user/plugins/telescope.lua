return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  keys = {
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", desc = "telescope.find files" },
    { "<leader>fg", "<cmd>lua require('telescope.builtin').git_files({show_untracked=true})<cr>", desc = "telescope.git files" },
    { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles({only_cwd=true})<cr>", desc = "telescope.old files" },
    { "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "telescope.live grep" },
    { "<leader>lgs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "telescope.grep string" },
    { "<leader>bs",
      "<cmd>lua require('telescope.builtin').buffers({show_all_buffers = false, sort_mru=true, ignore_current_buffer=false})<cr>", desc = "telescope.buffers" },
    { "<leader>sp", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>", desc = "telescope.spell suggest" },
    { "<leader>fb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "telescope.fuzzy find in current buffer" },
    { "<leader>tq", require("telescope.builtin").quickfix, desc = "telescope.transfer to quickfix" },
    { "<leader>tk", require("telescope.builtin").keymaps, desc = "telescope.show keymaps" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    -- "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        },
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
        }
      },
      defaults = {
      --   -- args for live_grep and grep_string
        vimgrep_arguments = { -- install ripgrep!
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          -- '--glob', '!{**/.git/*, **/.metals/*}', --do not search git,metals directory. FIXME: Adding this seems to mess up live grep.
        },
        file_ignore_patterns = {
          --getting this wrong causes telescope.builtin lsp actions to stop working on metals
          "%.git/",
          "%.class",
          "%.semanticdb",
          "%.cache",
          "%.jar",
        }
      }
    })

    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")
    -- telescope.load_extension("file_browser")
  end
}
