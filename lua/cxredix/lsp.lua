local function toggle_diagnostics()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

local opts = { buffer = bufnr, remap = false, desc = "UNDEFINED DESCRIPTION" }
vim.diagnostic.enable(false)

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition()    end, vim.tbl_extend('force', opts, {desc = "LSP Check Definition"}))
vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation()end, vim.tbl_extend('force', opts, {desc = "LSP Jump Definition"}))
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references()    end, vim.tbl_extend('force', opts, {desc = "LSP Jump References"}))

vim.keymap.set('n', 'K',  function() vim.lsp.buf.hover()         end, vim.tbl_extend('force', opts, {desc = "LSP Hover Information"}))

vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count =  1, float = true}) end, vim.tbl_extend('force', opts, {desc = "LSP Jump Next Diagnostic"}))
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count = -1, float = true})  end, vim.tbl_extend('force', opts, {desc = "LSP Jump Previous Diagnostic"}))

vim.keymap.set('n', '[e', function() vim.diagnostic.jump({severity = vim.diagnostic.severity.ERROR, count =  1, float = true}) end, vim.tbl_extend('force', opts, {desc = "LSP Jump Next Error"}))
vim.keymap.set('n', ']e', function() vim.diagnostic.jump({severity = vim.diagnostic.severity.ERROR, count = -1, float = true}) end, vim.tbl_extend('force', opts, {desc = "LSP Jump Previous Error"}))

vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, vim.tbl_extend('force', opts, {desc = "LSP Code Action"}))
vim.keymap.set('n', '<leader>ra', function() vim.lsp.buf.rename()      end, vim.tbl_extend('force', opts, {desc = "LSP Rename All"}))

vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format() end, vim.tbl_extend('force', opts, {desc = "LSP Format Entire File"}))
vim.keymap.set('n', '<leader>cd', function() toggle_diagnostics() end, vim.tbl_extend('force', opts, {desc = "LSP Toggle Diagnostics Display"}))

local lsp = vim.lsp
local lspconfig = lsp.config

local cmp = require("cmp")

-- biased setup, disable auto display of auto complete, instead you should manually call from Ctrl+Space
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

    sources = {
        { name = "nvim_lsp" },
    }
})
