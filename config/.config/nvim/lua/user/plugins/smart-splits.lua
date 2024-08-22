return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      -- Ignored buffer types (only while resizing)
      ignored_buftypes = { "NvimTree" },
      -- the default number of lines/columns to resize by at a time
      default_amount = 2,
      -- when moving cursor between splits left or right,
      -- place the cursor on the same row of the *screen*
      -- regardless of line numbers. False by default.
      -- Can be overridden via function parameter, see Usage.
      move_cursor_same_row = false,
      -- ignore these autocmd events (via :h eventignore) while processing
      -- smart-splits.nvim computations, which involve visiting different
      -- buffers and windows. These events will be ignored during processing,
      -- and un-ignored on completed. This only applies to resize events,
      -- not cursor movement events.
      ignored_events = {
        "BufEnter",
        "WinEnter",
      },
      -- enable or disable the tmux integration
      multiplexer_integration = "tmux"
    })
    -- recommended mappings
    -- resizing splits
    map("n", "<A-h>", require("smart-splits").resize_left, {desc = "smartsplits.resize left"})
    map("n", "<A-j>", require("smart-splits").resize_down, {desc = "smartsplits.resize down"})
    map("n", "<A-k>", require("smart-splits").resize_up, {desc = "smartsplits.resize up"})
    map("n", "<A-l>", require("smart-splits").resize_right, {desc = "smartsplits.resize right"})
    -- moving between splits
    map("n", "<C-h>", require("smart-splits").move_cursor_left, {desc = "smartsplits.move cursor left"})
    map("n", "<C-j>", require("smart-splits").move_cursor_down, {desc = "smartsplits.move cursor down"})
    map("n", "<C-k>", require("smart-splits").move_cursor_up, {desc = "smartsplits.move cursor up"})
    map("n", "<C-l>", require("smart-splits").move_cursor_right, {desc = "smartsplits.move cursor right"})
  end,
}
