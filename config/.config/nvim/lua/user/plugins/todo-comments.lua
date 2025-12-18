return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function ()
    local todoComments = require("todo-comments")
    todoComments.setup({
      search = {
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      }
    })

    vim.keymap.set('n', '<leader>tt', [[ <cmd> lua require('todo-comments.fzf').todo({winopts = {preview = { layout = 'vertical'} } }) <CR> ]], {desc = 'todo.show in fzf-lua'})
  end
}
