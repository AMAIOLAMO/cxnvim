vim.g["lsp_zero_diagnostics_active"] = true
local function set_diagnostics(enable)
    vim.g.lsp_zero_diagnostics_active = enable
    if enable then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
end

local function toggle_diagnostics()
    set_diagnostics(not vim.g.lsp_zero_diagnostics_active)
end

return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    lazy = false,
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            set_diagnostics(false) -- diable diagnostics by default

            vim.keymap.set('n', 'gd',         function() vim.lsp.buf.definition()   end, opts)
            vim.keymap.set('n', 'K',          function() vim.lsp.buf.hover()        end, opts)
            vim.keymap.set('n', '[d',         function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set('n', ']d',         function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action()  end, opts)
            vim.keymap.set('n', '<leader>ra', function() vim.lsp.buf.rename()       end, opts)

            -- WARNING: LSP FORMATTING BY DEFAULT DOES NOT RESPECT TAB FORMATTING
            vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format()       end, opts)
            vim.keymap.set('n', '<leader>cd', function() toggle_diagnostics()       end, opts)
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
            filetypes = { "glsl", "frag", "vert" }
        })


        local cmp = require("cmp")

        -- biased setup, disable auto display of auto complete, instead manually call on Ctrl+Space
        cmp.setup({
            -- window = { -- oxocarbon theme does not support borders
            --     completion = cmp.config.window.bordered(),
            --     documentation = cmp.config.window.bordered(),
            -- },
            completion = {
                autocomplete = false
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            -- creates expansion of the snippet to cmp (requires saadparwaiz1/cmp_luasnip)
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" }
            }
        })
    end,
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    }
}
