local nnoremap = require("cabanesdev.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)

nnoremap("<M-h>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<M-j>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<M-k>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<M-l>", function() require("harpoon.ui").nav_file(4) end, silent)

