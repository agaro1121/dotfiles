return {
  "miversen33/sunglasses.nvim",
  config = function()
    require("sunglasses").setup({
      filter_type = "NOSYNTAX", -- NOSYNTAX, SHADE
      filter_percent = .65
    })

    map("n", "<leader>SE", ":SunglassesEnable<CR>")
    map("n", "<leader>SD", ":SunglassesDisable<CR>")

    vim.cmd("SunglassesDisable")
  end

}
