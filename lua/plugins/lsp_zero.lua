return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    lazy = false,
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set('n', '<leader>ra', function() vim.lsp.buf.rename() end, opts)
            -- vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.references() end, opts)

            -- lsp_zero.default_keymaps({buffer = bufnr, remap = false})
        end)

        lsp_zero.setup()
        local lspconf = require("lspconfig")

        local lspconfig_defaults = lspconf.util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        lspconf.glsl_analyzer.setup({
            filetypes = {"glsl", "frag", "vert"}
        })

    end,
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
    }
}

