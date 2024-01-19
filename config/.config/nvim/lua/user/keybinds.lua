-- window navigation
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader>th", "<C-w>t<C-w>H", {desc="Switches horizontal panes to vertial panes"})
map("n", "<leader>tk", "<C-w>t<C-w>K", {desc="Switches vertical panes to horizontal panes"})

-- window sizing
map({"n"}, "<Up>",    ":resize -2<CR>")
map({"n"}, "<Down>",  ":resize +2<CR>")
map({"n"}, "<Left>",  ":vertical resize +2<CR>")
map({"n"}, "<Right>", ":vertical resize -2<CR>")

-- better experience
map({"n", "v"}, "<Space>", "<Nop>")

-- move line(s)
map("v", "J", ":mo '>+1<CR>gv=gv", {desc="Move highlighted lines down"})
map("v", "K", ":mo '<-2<CR>gv=gv", {desc="Move highlighted lines up"})
map("x", "<leader>p", "\"_dP", {desc="Paste without having your register overwritten"})
map("x", "<leader>c", "\"_c", {desc="Paste without having your register overwritten"})
