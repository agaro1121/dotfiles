return {
  'MeanderingProgrammer/render-markdown.nvim',
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    {'<leader>md'}
  },
  config = function()
    local render_markdown = require('render-markdown')
    render_markdown.setup({
      enabled = false,
      completions = {
        blink = { enabled = true },
        lsp = { enabled = true },
      }
    })

    local function toggle()
      if (render_markdown.get()) then
        render_markdown.preview()
        render_markdown.disable()
      else
        render_markdown.enable()
        render_markdown.preview()
      end
    end

    vim.keymap.set('n', '<leader>md', toggle, { desc = "RenderMarkdown: Show preview buffer separately" })
  end
}
