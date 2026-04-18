vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/todo-comments.nvim'
})
  
local todoComments = require("todo-comments")
todoComments.setup({
  search = {
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  }
})

vim.keymap.set('n', '<leader>tt', [[ <cmd> lua require('todo-comments.fzf').todo({winopts = {preview = { layout = 'vertical'} } }) <CR> ]], {desc = 'todo.show in fzf-lua'})