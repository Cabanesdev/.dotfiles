local fb_actions = require "telescope".extensions.file_browser.actions
require("telescope").setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
            files = true,
            grouped = true,
            sorting_strategy = 'ascending',
            hidden = true,
        }
    },
}
require("telescope").load_extension "file_browser"
