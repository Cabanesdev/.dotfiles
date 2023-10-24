vim.keymap.set("n", "<leader>j", ":m .+1<CR>==");
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==");
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");
