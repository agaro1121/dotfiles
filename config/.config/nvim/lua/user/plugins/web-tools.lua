-- Local server for web dev
return {
  "ray-x/web-tools.nvim", -- npm install -g browser-sync
  config = function()
    require("web-tools").setup({
      keymaps = {
        rename = nil,    -- by default use same setup of lspconfig
        repeat_rename = '.', -- . to repeat
      }
    })
  end
}
