return {
    {
        "AlexvZyl/nordic.nvim",
        branch = "main",
        lazy = false,
        priority = 1000,
		config = function()
            require('nordic').load()
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
