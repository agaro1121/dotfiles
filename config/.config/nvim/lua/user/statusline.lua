local M = {}

-- branch is cached per buffer; only refreshed on events, never while drawing
local function refresh_branch(buf)
  local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(buf))
  if dir == nil or dir == "" or vim.fn.isdirectory(dir) == 0 then
    vim.b[buf].branch = ""
    return
  end
  vim.system({ "git", "-C", dir, "branch", "--show-current" }, { text = true }, function(res)
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(buf) then
        vim.b[buf].branch = res.code == 0 and vim.trim(res.stdout) or ""
        vim.cmd("redrawstatus")
      end
    end)
  end)
end

function M.branch()
  local b = vim.b.branch
  return (b and b ~= "") and (" " .. b .. "  ") or ""
end

function M.searchcount()
  if vim.v.hlsearch == 0 then return "" end
  local ok, sc = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 100 })
  if not ok or not sc.total or sc.total == 0 then return "" end
  return ("[%d/%d]  "):format(sc.current, sc.total)
end

_G.Statusline = M

vim.o.laststatus = 3 -- one global statusline, same as lualine's globalstatus
vim.o.statusline = table.concat({
  "%{v:lua.Statusline.branch()}",
  "%{fnamemodify(expand('%:p'), ':~')}",  -- same as lualine filename path = 3
  "%=",
  "%{v:lua.Statusline.searchcount()}",
  "%l:%c  %p%%  %LL  %{&fenc != '' ? &fenc : &enc}  %{&ft}",
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "DirChanged" }, {
  callback = function(a) refresh_branch(a.buf) end,
})
