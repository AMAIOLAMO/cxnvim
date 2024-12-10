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
    { "wakatime/vim-wakatime" },
}
