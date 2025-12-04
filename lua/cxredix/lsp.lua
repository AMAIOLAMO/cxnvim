local function toggle_diagnostics()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

local opts = { buffer = bufnr, remap = false }
vim.diagnostic.enable(false)

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition()    end, opts)
vim.keymap.set('n', 'K',  function() vim.lsp.buf.hover()         end, opts)
vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation()end, opts)
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references()    end, opts)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count =  1, float = true}) end, opts)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count = -1, float = true})  end, opts)

vim.keymap.set('n', '[e', function() vim.diagnostic.jump({severity = vim.diagnostic.severity.ERROR, count =  1, float = true}) end, opts)
vim.keymap.set('n', ']e', function() vim.diagnostic.jump({severity = vim.diagnostic.severity.ERROR, count = -1, float = true}) end, opts)

vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set('n', '<leader>ra', function() vim.lsp.buf.rename()      end, opts)

vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format() end, opts)
vim.keymap.set('n', '<leader>cd', function() toggle_diagnostics() end, opts)

local lsp = vim.lsp
local lspconfig = lsp.config

lspconfig('glsl_analyzer', {
    cmd = {'glsl_analyzer'},
    filetypes = {'glsl', 'vert', 'frag'}
})
lsp.enable('glsl_analyzer')

local cmp = require("cmp")

-- biased setup, disable auto display of auto complete, instead manually call on Ctrl+Space
cmp.setup({
    window = { -- oxocarbon theme does not support borders
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
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
