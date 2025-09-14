return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
            filesystem = {
                filtered_items = {
				    hide_dotfiles = false,
                    visible = true,
                },
            },
        },
	    config = function(_,opts)
            require("neo-tree").setup(opts)
	        vim.keymap.set('n', '<C-n>', ':Neotree toggle right<CR>')
            vim.keymap.set('n', '<C-A-n>', ':Neotree focus right<CR>' )
	    end
    }
}
