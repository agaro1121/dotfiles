vim.keymap.set('n', '<leader>g?', function() require("fzf-lua").fzf_exec("cat cheatsheet.txt") end, { desc = 'cheatsheet' } )
