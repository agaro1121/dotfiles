return {
  "mfussenegger/nvim-dap",
  config = function()
    map("n",        "<leader>dc", require("dap").continue, {desc = "dap.continue"})
    map("n",        "<leader>dr", require("dap").repl.toggle, {desc = "dap.repl toggle"})
    map("n",        "<leader>db", require("dap").toggle_breakpoint, {desc = "dap.toggle breakpoint"})
    map("n",        "<leader>do", require("dap").step_over, {desc = "dap.step over"})
    map("n",        "<leader>di", require("dap").step_into, {desc = "dap.step into"})
    map("n",        "<leader>dl", require("dap").run_last, {desc = "dap.run last"})
    map("n",        "<leader>ds", require("dap").close, {desc = "dap.close"})
    map("n",        "<leader>dt", require("dap").terminate, {desc = "dap.terminate"})
    -- map({"n", "v"}, "<Leader>dh", require("dap.ui.widgets").hover, {desc = "dap.hover"})
    -- map({"n", "v"}, "<Leader>dp", require("dap.ui.widgets").preview, {desc = "dap.preview"})
  end
}
