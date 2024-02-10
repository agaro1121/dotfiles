return {
  "ray-x/lsp_signature.nvim",
  config = function ()
    require("lsp_signature").setup{
      hint_enable = false,
      auto_close_after = 5,
    }
  end
}
