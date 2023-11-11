return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
  config = function()
    local navic = require("nvim-navic")

    local git_blame = require("gitblame")
    local is_git_blame_enabled = function()
      if vim.g.gitblame_enabled == 0 then
        return false
      else
        return true
      end
    end

    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" --[[ , 'diff' ]] }, --diff causes perf issues when operating on many files
        lualine_c = {},
        lualine_x = { "g:metals_status" },
        lualine_y = { "diagnostics", { "filename", path = 1 }, "encoding", "filesize" },
        lualine_z = { "%LL", "location", "progress" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" }
      },
      tabline = {
        lualine_c = { {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            } },
        lualine_x = { { git_blame.get_current_blame_text, cond = is_git_blame_enabled } }
      },
      winbar = {
        -- lualine_c = {'%f'},
      },
      inactive_winbar = {},
      extensions = { "nvim-tree", "quickfix" }
    }
  end,
}
