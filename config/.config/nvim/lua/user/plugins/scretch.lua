vim.pack.add({
  'https://github.com/agaro1121/scretch.nvim'
})

local scretch = require("scretch")

local config = {
  backend = "fzf-lua",
  use_project_dir = {
    auto_create_project_dir = true,
    scretch = true,  -- false | true | auto
    scretch_project_dir = ".scretch/",
    template = true, -- false | true | auto
    template_project_dir = ".scretch/templates/",
  }
}

scretch.setup(config)

vim.keymap.set('n', '<leader>sn', scretch.new, { desc = 'scretch: new'})
vim.keymap.set('n', '<leader>snn', scretch.new_named, { desc = 'scretch: new named'})
vim.keymap.set('n', '<leader>ss', scretch.search, { desc = 'scretch: search'})
vim.keymap.set('n', '<leader>sg', scretch.grep, { desc = 'scretch: grep'})

