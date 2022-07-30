local Remap = require("cabanesdev.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

nnoremap("<leader>j", ":m .+1<CR>==");
nnoremap("<leader>k", ":m .-2<CR>==");
vnoremap("J", ":m '>+1<CR>gv=gv");
vnoremap("K", ":m '<-2<CR>gv=gv");
