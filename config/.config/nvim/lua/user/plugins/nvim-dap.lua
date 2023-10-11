return {
  "mfussenegger/nvim-dap",
  config = function()
    map("n",        "<leader>dc", require("dap").continue)
    map("n",        "<leader>dr", require("dap").repl.toggle)
    map("n",        "<leader>db", require("dap").toggle_breakpoint)
    map("n",        "<leader>do", require("dap").step_over)
    map("n",        "<leader>di", require("dap").step_into)
    map("n",        "<leader>dl", require("dap").run_last)
    map("n",        "<leader>ds", require("dap").close)
    map("n",        "<leader>dt", require("dap").terminate)
    map({"n", "v"}, "<Leader>dh", require("dap.ui.widgets").hover)
    map({"n", "v"}, "<Leader>dp", require("dap.ui.widgets").preview)
  end
}
