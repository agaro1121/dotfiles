 -- NOTE: All git things cause perf issues when operating on many files ie 'diff' component
return {
  "nvim-lualine/lualine.nvim",
  -- event = { "BufReadPre", "BufNewFile" }, -- this combined with dashboard.nvim causes lualine to not load on startup
  dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
  config = function()
    local navic = require("nvim-navic")
    local navic_component = {
      function()
        return navic.get_location()
      end,
      cond = function()
        return navic.is_available()
      end
    }

    local git_blame = require("gitblame")
    local git_blame_enabled = function()
      if vim.g.gitblame_enabled == 0 then
        return false
      else
        return true
      end
    end
    local git_blame_component = function()
      local empty_result = ""       -- needed otherwise lua line shows 'nil' on the bar and does not auto-hide as intended
      if git_blame_enabled() then
        local r = git_blame.get_current_blame_text()
        return r and r or empty_result
      else
        return empty_result
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
        lualine_b = {
          { "diagnostics", sources = { "nvim_lsp" } }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location", "progress", "%LL", "encoding", "filetype" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = { -- inserts items at the very top like the OSX menu
        lualine_b = { { "filename", path = 1 } --[[ navic_section ]] },
        lualine_c = { navic_component },
        lualine_z = { git_blame_component }
      },
      winbar = { -- sits right below the tabline
        -- lualine_c = { "%f" }, -- same '%f' is the relative file path
      },
      inactive_winbar = { },
      extensions = { "nvim-tree", "quickfix", "oil", "symbols-outline", "nvim-dap-ui", "lazy", "mason", "trouble", "toggleterm", "fzf" }
    }
  end,
}
