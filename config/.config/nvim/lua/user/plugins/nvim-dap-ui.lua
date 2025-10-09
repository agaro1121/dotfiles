return {
  "rcarriga/nvim-dap-ui",
  event = "LspAttach",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end

    map("n", "<leader>dut", dapui.toggle, { desc = "dap.ui.toggle" })
    map("n", "<leader>dur", function()
        dapui.float_element("repl")
      end,
      { desc = "dap.ui.repl" })
    map("n", "<leader>duc", function()
        dapui.float_element("console")
      end,
      { desc = "dap.ui.console" })
  end
}
