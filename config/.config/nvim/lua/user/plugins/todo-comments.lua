return {
  "folke/todo-comments.nvim",
  keys = {"<leader>tt"},
  dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
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

    -- preview window below results window
    map("n", "<leader>tt", [[ <cmd> lua require("todo-comments.fzf").todo({winopts = {preview = { layout = "vertical"} } }) <CR> ]], {desc = "todo.show in fzf-lua"})
  end
}
