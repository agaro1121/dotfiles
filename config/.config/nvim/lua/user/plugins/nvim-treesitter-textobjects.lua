return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require("nvim-treesitter-textobjects").setup {
      select = {
        lookahead = false,
        include_surrounding_whitespace = false,
      },
    }

    -- Select keymaps
    -- You can use the capture groups defined in `textobjects.scm`
    map({ "x", "o" }, "af", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end)
    map({ "x", "o" }, "if", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end)
    map({ "x", "o" }, "ac", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end)
    map({ "x", "o" }, "ic", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end)
    map({ "x", "o" }, "ap", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
    end)

    -- Swap keymaps
    map("n", "<leader>a", function()
      require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
    end)
    map("n", "<leader>A", function()
      require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
    end)

    -- keymaps
    -- You can use the capture groups defined in `textobjects.scm`
    map({ "n", "x", "o" }, "]f", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "]c", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "[f", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "[c", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end)

    map({ "n", "x", "o" }, "]F", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "]C", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "[F", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
    end)
    map({ "n", "x", "o" }, "[C", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
    end)

  end
}
