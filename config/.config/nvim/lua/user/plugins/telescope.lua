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
    tag = '0.1.1',
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
      { "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
      { "<leader>bs", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
      { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local M = {}
      M.lsp_workspace_symbols = function()
        local input = vim.fn.input("Query: ")
        vim.api.nvim_command("normal :esc<CR>")
        if not input or #input == 0 then
          return
        end
        require("telescope.builtin").lsp_workspace_symbols({ query = input })
      end
      require("telescope").load_extension("ui-select")
      return { M }
    end,
  }
}
