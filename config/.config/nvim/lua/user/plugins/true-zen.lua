return {
  "agaro1121/true-zen.nvim",
  keys = {"<leader>za"},
  branch = "fix-issues",
  config = function()
    require("true-zen").setup {
      -- your config goes here
      -- or just leave it empty :)
      integrations = {
        lualine = true,
        tmux = true
      }
    }
  -- map("n", "<leader>zf", ":TZFocus<CR>", {desc = "zen.focus"})
  -- map("n", "<leader>zm", ":TZMinimalist<CR>", {desc = "zen.minimalist"}) -- messes with number/relative number
  map("n", "<leader>za", ":TZAtaraxis<CR>", {desc = "zen.zen mode"})
  -- map("n", "<leader>zn", ":TZNarrow<CR>", {desc = "zen.narrow"})
  -- map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {desc = "zen.narrow"})
  end,
}
