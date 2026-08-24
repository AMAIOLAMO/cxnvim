return {
    {
        'sainnhe/sonokai',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_enable_italic = false
            vim.g.sonokai_disable_italic_comment = true
            vim.g.sonokai_style = 'shusia'
            vim.cmd.colorscheme('sonokai')
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
}
