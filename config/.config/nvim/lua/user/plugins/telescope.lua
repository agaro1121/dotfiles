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
    tag = '0.1.3',
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>" },
      { "<leader>of", "<cmd>lua require('telescope.builtin').oldfiles({only_cwd=true})<cr>" },
      { "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
      { "<leader>bs", "<cmd>lua require('telescope.builtin').buffers({show_all_buffers = false, sort_mru=true, ignore_current_buffer=false})<cr>" },
      { "<leader>sp", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
      { "<leader>lgs", "<cmd>lua require('telescope.builtin').grep_string()<cr>" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").load_extension("ui-select")
    end
  }
}
