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

local function show()
  if vim.fn.argc() > 0 or vim.api.nvim_buf_get_name(0) ~= "" or vim.fn.line2byte("$") ~= -1 then
    return
  end

  local lines = vim.list_extend({}, header)
  -- extra blank lines between the art and the menu
  local gap = 2
  for _ = 1, gap do
    table.insert(lines, "")
  end

  -- pad entries to one width so per-line centering keeps them aligned
  local desc_width = 0
  for _, item in ipairs(menu) do
    item.label = icon .. " " .. item.desc
    desc_width = math.max(desc_width, vim.fn.strdisplaywidth(item.label))
  end
  local key_gap = 16 -- spaces between the longest label and the key
  local entries = {}
  for _, item in ipairs(menu) do
    local gap = (" "):rep(desc_width - vim.fn.strdisplaywidth(item.label))
    table.insert(entries, ("%s%s%s%s"):format(item.label, gap, (" "):rep(key_gap), item.key))
  end
  local menu_width = 0
  for _, e in ipairs(entries) do
    menu_width = math.max(menu_width, vim.fn.strdisplaywidth(e))
  end
  for i, e in ipairs(entries) do
    if i > 1 then
      table.insert(lines, "") -- blank line between entries
    end
    table.insert(lines, e .. (" "):rep(menu_width - vim.fn.strdisplaywidth(e)))
  end
  vim.list_extend(lines, footer)

  -- center horizontally and vertically
  local width = vim.o.columns
  local pad = math.max(0, math.floor((vim.o.lines - #lines) / 2) - 16) -- nudge up from true center
  for i, l in ipairs(lines) do
    lines[i] = (" "):rep(math.max(0, math.floor((width - vim.fn.strdisplaywidth(l)) / 2))) .. l
  end
  lines = vim.list_extend(vim.fn["repeat"]({ "" }, pad), lines)

  local buf = vim.api.nvim_get_current_buf()
  vim.bo[buf].bufhidden, vim.bo[buf].buftype, vim.bo[buf].swapfile = "wipe", "nofile", false
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local ns = vim.api.nvim_create_namespace("splash")
  -- ASCII art: yellow
  vim.api.nvim_set_hl(0, "SplashHeader", { fg = "#f9e2af" })
  for row = pad, pad + #header - 1 do
    vim.api.nvim_buf_set_extmark(buf, ns, row, 0, { line_hl_group = "SplashHeader" })
  end

  -- footer quote: yellow, italic
  vim.api.nvim_set_hl(0, "SplashFooter", { fg = "#f9e2af", italic = true })
  for row = #lines - #footer, #lines - 1 do
    vim.api.nvim_buf_set_extmark(buf, ns, row, 0, { line_hl_group = "SplashFooter" })
  end

  -- menu: blue icon, green label, orange shortcut key
  vim.api.nvim_set_hl(0, "SplashMenuIcon", { fg = "#89b4fa" })
  vim.api.nvim_set_hl(0, "SplashMenuItem", { fg = "#a6e3a1" })
  vim.api.nvim_set_hl(0, "SplashMenuKey", { fg = "#fab387" })
  for row = #lines - #footer - (2 * #menu - 1), #lines - #footer - 1, 2 do
    -- line is "<indent><desc><spaces><key>"; keys are a single trailing character
    local line = lines[row + 1]
    local desc_start = #line:match("^%s*")
    local key_col = #line:gsub("%s+$", "") - 1
    local desc_end = #line:sub(1, key_col):gsub("%s+$", "")
    local text_start = desc_start + #icon
    -- icon (blue)
    vim.api.nvim_buf_set_extmark(buf, ns, row, desc_start, { end_col = text_start, hl_group = "SplashMenuIcon" })
    -- label (green)
    vim.api.nvim_buf_set_extmark(buf, ns, row, text_start, { end_col = desc_end, hl_group = "SplashMenuItem" })
    -- shortcut key (orange)
    vim.api.nvim_buf_set_extmark(buf, ns, row, key_col, { end_col = key_col + 1, hl_group = "SplashMenuKey" })
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
