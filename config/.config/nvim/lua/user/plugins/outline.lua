return {
  "hedyhli/outline.nvim",
  dependencies = { "onsails/lspkind.nvim" },
  config = function()
    require('lspkind').init({})

    require("outline").setup {
      symbols = {
        icon_source = 'lspkind'
      }
    }

    map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
  end,
}
