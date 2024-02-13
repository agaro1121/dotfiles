local M = {}

local create_keybinds = function(telescope_builtin)
  -------------------------------------- KEYBINDS --------------------------------------
  map("n", "gD", telescope_builtin.lsp_definitions)
  map("n", "gV", ":vsplit | lua vim.lsp.buf.definition()<CR>")
  map("n", "gH", ":split | lua vim.lsp.buf.definition()<CR>")
  map("n", "gt", telescope_builtin.lsp_type_definitions)
  map("n", "gi", telescope_builtin.lsp_implementations)
  map("n", "gic", vim.lsp.buf.incoming_calls, { desc = "who calls this symbol?" })
  map("n", "goc", vim.lsp.buf.outgoing_calls, { desc = "What does this symbol call?" })
  map("n", "gr", telescope_builtin.lsp_references)
  map("n", "gds", telescope_builtin.lsp_document_symbols)
  map("n", "gwds", telescope_builtin.lsp_dynamic_workspace_symbols)
  map("n", "<leader>wa", telescope_builtin.diagnostics)                                             -- workspace diagnostics
  map("n", "<leader>we", function() telescope_builtin.diagnostics({ severity = "E" }) end)          -- workspace errors
  map("n", "<leader>ww", function() telescope_builtin.diagnostics({ severity = "W" }) end)          -- workspace errors

  map("n", "<leader>ba", function() telescope_builtin.diagnostics({ bufnr = 0 }) end)               -- buffer diagnostics
  map("n", "<leader>be", function() telescope_builtin.diagnostics({ bufnr = 0, severity = "E" }) end) -- buffer errors
  map("n", "<leader>bw", function() telescope_builtin.diagnostics({ bufnr = 0, severity = "W" }) end) -- buffer warnings

  map("n", "gws", function()
    vim.ui.input({ prompt = "Workspace symbols: " }, function(query)
      telescope_builtin.lsp_workspace_symbols({ query = query })
    end)
  end)

  -- map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<cr>")
  -- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  -- map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  -- map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
  -- map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
  -- map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings

  -- map("n", "<leader>d", vim.diagnostic.setqflist) -- all diagnostics
  -- map("n", "<leader>d", vim.diagnostic.setloclist) -- buffer diagnostics only
  map("n", "[d", function() vim.diagnostic.goto_prev { wrap = false } end)
  map("n", "]d", function() vim.diagnostic.goto_next { wrap = false } end)
  map("n", "K", vim.lsp.buf.hover)

  map("n", "<leader>cl", vim.lsp.codelens.run)
  map("n", "<leader>sh", vim.lsp.buf.signature_help)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end)
  map("n", "<leader>H", vim.lsp.buf.document_highlight, { desc = "Highlights the current symbol in the entire buffer" })
  map("n", "<leader>nH", vim.lsp.buf.clear_references, { desc = "Clear symbol highlights" })

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
  -------------------------------------- KEYBINDS --------------------------------------
end

M.create_keybinds = create_keybinds
return M
