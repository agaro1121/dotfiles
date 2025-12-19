 -- NOTE: All git things cause perf issues when operating on many files ie 'diff' component
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true
      },
      sections = {
        lualine_a = { "branch", { "filename", path = 3 } },
        lualine_b = { }, -- NOTE: need to leave these blank ones here or there's overflow
        lualine_c = { },
        lualine_x = { },
        lualine_y = { },
        lualine_z = { "location", "progress", "%LL", "encoding", "filetype" }
      },
      extensions = { "nvim-tree", "oil" }
    }
  end,
}
