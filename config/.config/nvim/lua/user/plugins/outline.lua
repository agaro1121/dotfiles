return {
  "hedyhli/outline.nvim",
  event = "LspAttach",
  config = function()
    require("outline").setup{}

    map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "outline.Toggle" })
  end,
}
