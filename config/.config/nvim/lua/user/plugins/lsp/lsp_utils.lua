local M = {}

local on_attach = function(navic, telescope_builtin, init)
  -- breadcrumbs in lualine
  local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end

    require("keybinds").create_keybinds(telescope_builtin)

    if init ~= nil then
      init()
    end
  end
  return on_attach
end

local capabilities = function(cmp_lsp)
  -- enable completion on all lsp instances
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  local cmp_capabilities = cmp_lsp.default_capabilities(capabilities)

  -- enable code folding
  -- needs to be on cmp_capabilities or it will get overwritten
  cmp_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
end


M.on_attach = on_attach
M.capabilities = capabilities
return M
