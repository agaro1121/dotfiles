return {
  'stevearc/aerial.nvim',
  opts = {},
  config = function()
    local aerial = require('aerial')
    aerial.setup({
      backends = {
        ['_'] = { 'lsp', 'treesitter', 'markdown', 'asciidoc', 'man' },
        java = { 'treesitter', 'lsp' }
      },
      filter_kind = false,
      show_guides = true,
      layout = {
        default_direction = "prefer_right",
        resize_to_content = false,
        min_width = 0.23,
      },
      keymaps = {
        ["o"] = "actions.jump",
      }
    })

    local function format_status(symbols, depth, separator, icons_enabled)
      local parts = {}
      depth = depth or #symbols

      if depth > 0 then
        symbols = { unpack(symbols, 1, depth) }
      else
        symbols = { unpack(symbols, #symbols + 1 + depth) }
      end

      for _, symbol in ipairs(symbols) do
        if icons_enabled then
          table.insert(parts, string.format("%s %s", symbol.icon, symbol.name))
        else
          table.insert(parts, symbol.name)
        end
      end

      return table.concat(parts, separator)
    end

    local function output_symbols_structure()
      local symbols = aerial.get_location(true)
      local symbols_structure = format_status(symbols, nil, ' > ', true)
      return symbols_structure
    end

    _G.output_symbols_structure = output_symbols_structure

    vim.o.winbar = "%{%v:lua._G.output_symbols_structure()%}"
    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")
  end
}
