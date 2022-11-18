function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- vim config
map("n","<leader>E", ":source $HOME/.config/nvim/init.lua<cr>")
-- telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>bs", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- window navigation
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-Up>", ":resize +2<cr>")
map("n", "<C-Down>", ":resize -2<cr>")
map("n", "<C-Left>", ":vertical resize +2<cr>")
map("n", "<C-Right>", ":vertical resize -2<cr>")
map("n", "<Leader>th", "<C-w>t<C-w>H")
map("n", "<Leader>tk", "<C-w>t<C-w>K")
-- nvim-tree config
map("n", "<leader>e", ":NvimTreeToggle<cr>")
map("n", "<leader>s", ":NvimTreeFindFile<cr>")

-- break the habit
map("n", "<Up>",    "<NOP>")
map("n", "<Down>",  "<NOP>")
map("n", "<Left>",  "<NOP>")
map("n", "<Right>", "<NOP>")
map("i", "<Up>",    "<NOP>")
map("i", "<Down>",  "<NOP>")
map("i", "<Left>",  "<NOP>")
map("i", "<Right>", "<NOP>")

-- telescope.lazy
map("n", "<leader>ll", ":LazyGit<cr>")
-- copy/cut to clipboard
map("v", "<leader>c", [["+y<cr>]])
map("v", "<leader>d", [["+yy<cr>]])
map("v", "<leader>p", [["+p<cr>]])

-- LSP
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
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
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')
-- map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
map("n", "<leader>aa", [[<cmd>lua require"telescope.builtin".diagnostics()<CR>]]) -- all workspace diagnostics
-- map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
map("n", "<leader>ae", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "E"})<CR>]]) -- all workspace errors
-- map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
map("n", "<leader>aw", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "W"})<CR>]]) -- all workspace errors
map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
map("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
map("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")
map("n", "<leader>o", ":SymbolsOutline<CR>")
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

-- peek.nvim
map("n", "<leader>md", [[<cmd> PeekToggle<CR>]])

-- terminal
map("t", "<ESC>", [[<C-\><C-n><CR>]])
map("n", "<leader>t", ":18sp|:term<CR>")
