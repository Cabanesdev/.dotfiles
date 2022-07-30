local Remap = require("cabanesdev.keymap")
local nnoremap = Remap.nnoremap

nnoremap("ff", ":Telescope find_files<CR>")
nnoremap("fb", ":Telescope buffers<CR>")
nnoremap("fg", ":Telescope live_grep<CR>")
nnoremap("<leader>fb",":Telescope file_browser<CR>")
