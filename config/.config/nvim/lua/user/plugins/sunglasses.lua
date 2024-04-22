-- NOTE: cannot be lazy-loaded for some reason
return {
  "miversen33/sunglasses.nvim",
  config = function()
    require("sunglasses").setup({
      filter_type = "NOSYNTAX", -- NOSYNTAX, SHADE
      filter_percent = .65
    })

    map("n", "<leader>se", ":SunglassesEnable<CR>")
    map("n", "<leader>sd", ":SunglassesDisable<CR>")
    map("n", "<leader>sg", ":SunglassesEnableToggle<CR>")

    vim.cmd("SunglassesDisable")
  end

}
