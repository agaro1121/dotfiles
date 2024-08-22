return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      action_keys = {         -- key mappings for actions in the trouble list
        close_folds = { "zC" }, -- close all folds
        open_folds = { "zO" }, -- open all folds
        toggle_fold = { "zo" }, -- toggle fold of current file
      },
      auto_preview = false,
    })
    map("n", "<leader>tr", [[<cmd> Trouble diagnostics toggle filter.buf=0<CR>]], {desc = "trouble.buffer diagnostics"})
    map("n", "<leader>tR", [[<cmd> Trouble diagnostics toggle<CR>]], {desc = "trouble.workspace diagnostics"})
  end
}
