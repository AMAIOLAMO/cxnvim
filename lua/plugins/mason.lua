return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
        dependencies = {
            "VonHeikemen/lsp-zero.nvim"
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim"
        },
        opts = {
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end
            },
        }
    }
}
