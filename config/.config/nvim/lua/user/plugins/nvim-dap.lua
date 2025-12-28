return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'dap: continue' })
      vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'dap: repl toggle' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'dap: toggle breakpoint' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'dap: step over' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'dap: step into' })
      vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'dap: run last' })
      vim.keymap.set('n', '<leader>ds', dap.close, { desc = 'dap: close' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'dap: terminate' })
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require('dap'), require('dapui')

      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated['dapui_config'] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited['dapui_config'] = function()
      --   dapui.close()
      -- end

      vim.keymap.set('n', '<leader>dut', dapui.toggle, { desc = 'dapui: toggle' })
      vim.keymap.set('n', '<leader>dur', function() dapui.float_element('repl') end, { desc = 'dapui: repl' })
      vim.keymap.set('n', '<leader>duc', function() dapui.float_element('console') end, { desc = 'dapui: console' })
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function ()
      require("nvim-dap-virtual-text").setup({})
    end
  }
}
