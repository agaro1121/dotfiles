function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- LSP
-- map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>")
map("n", "gD", [[<cmd>lua require"telescope.builtin".lsp_definitions()<CR>]])
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")
--map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gi", [[<cmd>lua require"telescope.builtin".lsp_implementations()<CR>]])
--map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gr", [[<cmd>lua require"telescope.builtin".lsp_references()<CR>]])
-- map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "gds", [[<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>]])
--map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
map("n", "gws", [[<cmd>lua require"telescope.builtin".lsp_dynamic_workspace_symbols()<CR>]])
map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>")
-- map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>ca", [[<cmd> lua require"actions-preview".code_actions()<CR>]])
map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')
-- map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
map("n", "<leader>aa", [[<cmd>lua require"telescope.builtin".diagnostics()<CR>]]) -- all workspace diagnostics
-- map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
map("n", "<leader>ae", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "E"})<CR>]]) -- all workspace errors
-- map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
map("n", "<leader>aw", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "W"})<CR>]]) -- all workspace errors
map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")
-- map("n", "<leader>o", ":SymbolsOutline<CR>")
map("n", "<leader>o", ":AerialToggle<CR>")
map("n", "<leader>O", ":AerialNavToggle<CR>")
map("n", "<leader>mc", [[<cmd>lua require"telescope".extensions.metals.commands()<CR>]])

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
map("n", "<leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
map("n", "<leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
map("n", "<leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
map("n", "<leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])
