return {
  "mistricky/codesnap.nvim",
  build = "make",
  config = function()
    require("codesnap").setup {
      bg_theme = "default",
      watermark = "",
      save_path = "."
    }
  end
}
