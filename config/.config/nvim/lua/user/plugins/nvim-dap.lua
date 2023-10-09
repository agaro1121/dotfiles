return {
  "mfussenegger/nvim-dap",
  config = function()
    map("n", "<leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
    map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
    map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
    map("n", "<leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
    map("n", "<leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
    map("n", "<leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
    map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])
  end
}
