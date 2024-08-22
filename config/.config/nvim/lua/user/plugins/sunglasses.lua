-- NOTE: cannot be lazy-loaded for some reason
return {
  "miversen33/sunglasses.nvim",
  config = function()
    require("sunglasses").setup({
      filter_type = "NOSYNTAX", -- NOSYNTAX, SHADE
      filter_percent = .65
    })

    map("n", "<leader>se", ":SunglassesEnable<CR>", {desc = "sunglasses.enable"})
    map("n", "<leader>sd", ":SunglassesDisable<CR>", {desc = "sunglasses.disable"})
    map("n", "<leader>sg", ":SunglassesEnableToggle<CR>", {desc = "sunglasses.toggle"})

    vim.cmd("SunglassesDisable")
  end

}
