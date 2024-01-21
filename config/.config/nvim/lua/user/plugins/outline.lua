return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }

    map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
  end,
}
