return {
  "agaro1121/Otree.nvim",
  lazy = false,
  dependencies = {
    "stevearc/oil.nvim",
    -- { "echasnovski/mini.icons", opts = {} },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("Otree").setup({
      win_size = 40,
      keymaps = {
        ["<C-h>"] = "",
        ["<C-l>"] = "",
      },
      tree = {
        space_after_connector = "",
      },
    })
    map("n", "<leader>e", ":Otree<cr>", { desc = "nvimtree.Toggele" })
  end
}
