local header = {
  "                                                                                                    ",
  "                                                                                                    ",
  "                                                                                                    ",
  "                         .^!^                                           .!~:                        ",
  "                    ^!JPB&B7.                                            !&&BPJ!:                   ",
  "                ^?P#@@@@@G.                   :       :                   ~@@@@@&B5!:               ",
  "             ^JB@@@@@@@@@7                   .#~     ?G                   .&@@@@@@@@&G?:            ",
  "          .7G@@@@@@@@@@@@#!                  7@&^   ~@@^                 .5@@@@@@@@@@@@@G7.         ",
  "        .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y#@@@@@@@@@@@@@@@@#?.       ",
  "       !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  ~@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@#!      ",
  "     .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y     ",
  "    :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5    ",
  "   .B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@J   ",
  "   5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGP555PPGBB#&#:  ",
  "   ^:.            .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.  ",
  "                       ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5:                      ",
  "                         P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                        ",
  "                         :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                        ",
  "                                         :?G@@@@@@@@@@@@P!.                                         ",
  "                                            ~5@@@@@@@@5^                                            ",
  "                                              ^P@@@@G^                                              ",
  "                                                !#@?                                                ",
  "                                                 :^                                                 ",
  "                                                                                                    ",
  "                                                                                                    ",
  "                                                                                                    ",
}

local footer = { "", "", "", "", "", "", "I am vengeance, I am justice, I am the night!", "I AM BATMAN" }

local icon = "\u{f1b2}" -- same icon dashboard-nvim used for every entry

local menu = {
  { key = "f", desc = "Find File", cmd = "FzfLua files" },
  { key = "t", desc = "File Tree", cmd = "NvimTreeOpen" },
  { key = "o", desc = "Oil",       cmd = "Oil" },
  { key = "q", desc = "Quit",      cmd = "quit" },
}

local ART_MENU_GAP = 2 -- blank lines between the art and the menu
local KEY_GAP = 16     -- spaces between the longest label and the key
local UP_OFFSET = 16   -- lines to nudge the whole block up from true center

local function define_highlights()
  -- ASCII art: yellow
  vim.api.nvim_set_hl(0, "SplashHeader", { fg = "#f9e2af" })
  -- footer quote: yellow, italic
  vim.api.nvim_set_hl(0, "SplashFooter", { fg = "#f9e2af", italic = true })
  -- menu: blue icon, green label, orange shortcut key
  vim.api.nvim_set_hl(0, "SplashMenuIcon", { fg = "#89b4fa" })
  vim.api.nvim_set_hl(0, "SplashMenuItem", { fg = "#a6e3a1" })
  vim.api.nvim_set_hl(0, "SplashMenuKey", { fg = "#fab387" })
end

define_highlights()
-- a later :colorscheme clears custom groups, so define them again
vim.api.nvim_create_autocmd("ColorScheme", { callback = define_highlights })

local function show()
  if vim.fn.argc() > 0 or vim.api.nvim_buf_get_name(0) ~= "" or vim.fn.line2byte("$") ~= -1 then
    return
  end

  local lines = vim.list_extend({}, header)
  for _ = 1, ART_MENU_GAP do
    table.insert(lines, "")
  end

  -- pad labels to one width so per-line centering keeps the keys aligned
  local labels, label_width = {}, 0
  for i, item in ipairs(menu) do
    labels[i] = icon .. " " .. item.desc
    label_width = math.max(label_width, vim.fn.strdisplaywidth(labels[i]))
  end
  local menu_rows = {} -- per entry: line index, label length, key offset (bytes from the label start)
  for i, item in ipairs(menu) do
    if i > 1 then
      table.insert(lines, "") -- blank line between entries
    end
    local spacing = (" "):rep(label_width - vim.fn.strdisplaywidth(labels[i]) + KEY_GAP)
    table.insert(lines, labels[i] .. spacing .. item.key)
    menu_rows[i] = { idx = #lines, label_len = #labels[i], key_off = #labels[i] + #spacing }
  end
  vim.list_extend(lines, footer)

  -- center horizontally and vertically
  local width = vim.o.columns
  local pad = math.max(0, math.floor((vim.o.lines - #lines) / 2) - UP_OFFSET)
  local indents = {}
  for i, l in ipairs(lines) do
    indents[i] = math.max(0, math.floor((width - vim.fn.strdisplaywidth(l)) / 2))
    lines[i] = (" "):rep(indents[i]) .. l
  end
  local top = {}
  for _ = 1, pad do
    table.insert(top, "")
  end
  lines = vim.list_extend(top, lines)

  local buf = vim.api.nvim_get_current_buf()
  vim.bo[buf].bufhidden, vim.bo[buf].buftype, vim.bo[buf].swapfile = "wipe", "nofile", false
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local ns = vim.api.nvim_create_namespace("splash")
  -- ASCII art: yellow
  vim.api.nvim_buf_set_extmark(buf, ns, pad, 0, {
    end_row = pad + #header, hl_group = "SplashHeader", hl_eol = true, strict = false,
  })

  -- footer quote: yellow, italic
  vim.api.nvim_buf_set_extmark(buf, ns, #lines - #footer, 0, {
    end_row = #lines, hl_group = "SplashFooter", hl_eol = true, strict = false,
  })

  -- menu: blue icon, green label, orange shortcut key
  for _, r in ipairs(menu_rows) do
    local row, start = pad + r.idx - 1, indents[r.idx]
    local text_start = start + #icon
    vim.api.nvim_buf_set_extmark(buf, ns, row, start, { end_col = text_start, hl_group = "SplashMenuIcon" })
    vim.api.nvim_buf_set_extmark(buf, ns, row, text_start, { end_col = start + r.label_len, hl_group = "SplashMenuItem" })
    vim.api.nvim_buf_set_extmark(buf, ns, row, start + r.key_off, { end_col = start + r.key_off + 1, hl_group = "SplashMenuKey" })
  end
  vim.bo[buf].modifiable = false
  for _, w in ipairs({ "number", "relativenumber", "cursorline", "list" }) do
    vim.wo[w] = false
  end

  for _, item in ipairs(menu) do
    vim.keymap.set("n", item.key, "<cmd>" .. item.cmd .. "<cr>", { buffer = buf, nowait = true })
  end
end

vim.api.nvim_create_autocmd("VimEnter", { once = true, nested = true, callback = show })
-- `:restart` restores the saved session after startup, which wipes the splash.
-- If that session had no real buffer, draw it again (show() skips named buffers).
vim.api.nvim_create_autocmd("SessionLoadPost", { callback = show })
