return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        {
	    "mason-org/mason.nvim",
            opts = {
                ensure_installed = {
                    "tinymist",
                },
	    }
	},
	"neovim/nvim-lspconfig",
    },
    config = function()
        vim.lsp.config["tinymist"] = {
            cmd = { "tinymist" },
            filetypes = { "typst" },
            settings = {
		formatterMode = "typstyle",
                exportPdf = "onType",
                semanticTokens = "disable"
            }
	}
    end
}
