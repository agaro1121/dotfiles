return {
  "Pocco81/true-zen.nvim",
  config = function()
    require("true-zen").setup {
      -- your config goes here
      -- or just leave it empty :)
      integrations = {
        lualine = true
      }
    }
  map("n", "<leader>zf", ":TZFocus<CR>")
  map("n", "<leader>zm", ":TZMinimalist<CR>")
  map("n", "<leader>za", ":TZAtaraxis<CR>")
  end,
}
