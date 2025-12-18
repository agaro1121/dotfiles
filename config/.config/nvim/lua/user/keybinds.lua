vim.keyvim.keymap.set.set('n', '<leader>g?', function() require("fzf-lua").fzf_exec("cat cheatsheet.txt") end, { desc = 'cheatsheet' } )

-- window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>pv", "<C-w>t<C-w>H", {desc="Switches horizontal panes to vertcial panes"})
vim.keymap.set("n", "<leader>ph", "<C-w>t<C-w>K", {desc="Switches vertical panes to horizontal panes"})

-- window sizing
vim.keymap.set({"i"}, "<Up>",    "<Nop>")
vim.keymap.set({"i"}, "<Down>",  "<Nop>")
vim.keymap.set({"i"}, "<Left>",  "<Nop>")
vim.keymap.set({"i"}, "<Right>", "<Nop>")

-- better experience
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>")

-- move line(s)
vim.keymap.set("v", "J", ":mo '>+1<CR>gv=gv", {desc="Move highlighted lines down"})
vim.keymap.set("v", "K", ":mo '<-2<CR>gv=gv", {desc="Move highlighted lines up"})
