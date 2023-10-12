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
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
      { "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
      { "<leader>bs", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
      { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
      { "<leader>sp", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").load_extension("ui-select")
    end
  }
}
