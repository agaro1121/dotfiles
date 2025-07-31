return {
  "rmagatti/goto-preview",
  keys = "gpd",
  config = function()
    require("goto-preview").setup {
      default_mappings = true,
    }
  end
}
