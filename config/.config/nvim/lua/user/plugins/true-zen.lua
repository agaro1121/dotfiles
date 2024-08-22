return {
  "agaro1121/true-zen.nvim",
  branch = "fix-issues",
  config = function()
    require("true-zen").setup {
      -- your config goes here
      -- or just leave it empty :)
      integrations = {
        lualine = false,
        tmux = false
      }
    }
  map("n", "<leader>zf", ":TZFocus<CR>", {desc = "zen.focus"})
  map("n", "<leader>zm", ":TZMinimalist<CR>", {desc = "zen.minimalist"})
  map("n", "<leader>za", ":TZAtaraxis<CR>", {desc = "zen.zen mode"})
  map("n", "<leader>zn", ":TZNarrow<CR>", {desc = "zen.narrow"})
  map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {desc = "zen.narrow"})
  end,
}
