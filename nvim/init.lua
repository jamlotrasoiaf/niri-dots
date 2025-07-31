require("config.lazy")

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

require("catppuccin").setup()

vim.cmd.colorscheme "catppuccin"
vim.g.mapleader = " "

vim.lsp.config["tinymist"] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
	formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "disable"
    }
}
