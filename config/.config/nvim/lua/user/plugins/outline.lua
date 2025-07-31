return {
  "hedyhli/outline.nvim",
  event = "LspAttach",
  dependencies = { "onsails/lspkind.nvim" },
  config = function()
    require('lspkind').init({})

    require("outline").setup {
      symbols = {
        icon_source = 'lspkind'
      }
    }

    map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "outline.Toggle" })
  end,
}
