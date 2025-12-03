return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 1000,
		config = function()
            vim.cmd.colorscheme("oxocarbon")
		end
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

    { "hiphish/rainbow-delimiters.nvim" },
    { "folke/which-key.nvim" },

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
}
