require("nvim-tree").setup({
     disable_netrw = true,
     hijack_cursor = true,
     update_focused_file = {
         enable = true,
     },

     diagnostics = {
       enable = true,
       show_on_dirs = true,
       icons = {
         hint = "",
         info = "",
         warning = "",
         error = "",
       }
     },
     
     git = {
       enable = true,
       ignore = false,
       timeout = 400,
     }
})
