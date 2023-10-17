return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todoComments = require("todo-comments")
    todoComments.setup({
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--hidden",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      },
    })

    map("n", "<leader>tt", ":TodoTelescope<CR>")
  end
}
