return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      save_native_terms = true,   -- integrate native terminals from `:terminal` command
      start_in_insert   = true,   -- start terminal in insert mode
      remember_mode     = true,   -- remember vi_mode of terminal buffer
      enable_ctrl_w     = true,   -- use <C-w> for window navigating in terminal mode (like vim8)
      terminal          = {       -- default terminal settings
        buflisted        = false, -- whether to set 'buflisted' option
        fallback_on_exit = true,  -- prevent auto-closing window on terminal exit
      },
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.45
        end
      end,
    })

    vim.keymap.set('n', [[<C-\>]], ':ToggleTerm direction=float<CR>', { desc = 'toggleterm: terminal float' })
    vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'toggleterm: terminal vertical' })
    vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'toggleterm: terminal horizontal' })
    vim.keymap.set('n', '<leader>sbt', ":TermExec cmd='sbt' direction=vertical<CR>", { desc = 'toggleterm: sbt terminal' })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    -- lazyvim
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit  = Terminal:new({
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      count = 99
    })

    local function _lazygit_toggle()
      lazygit:toggle()
    end
    _G._lazygit_toggle = _lazygit_toggle

    vim.keymap.set('n', '<leader>ll', '<cmd>lua _G._lazygit_toggle()<CR>', { desc = 'toggleterm.lazygit' })
  end
}
