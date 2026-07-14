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
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },

    window = { -- oxocarbon theme does not support borders
        -- completion = cmp.config.window.bordered(),
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },

        documentation = cmp.config.window.bordered(),
    },

    formatting = {
	-- word		the text that will be inserted, mandatory
	-- abbr		abbreviation of "word"; when not empty it is used in
	-- 		the menu instead of "word"
	-- menu		extra text for the popup menu, displayed after "word"
	-- 		or "abbr"
	-- info		more information about the item, can be displayed in a
	-- 		preview window
	-- kind		single letter indicating the type of completion
	-- icase		when non-zero case is to be ignored when comparing
	-- 		items to be equal; when omitted zero is used, thus
	-- 		items that only differ in case are added
	-- equal		when non-zero, always treat this item to be equal when
	-- 		comparing.  Which means, "equal=1" disables filtering
	-- 		of this item.
	-- dup		when non-zero this match will be added even when an
	-- 		item with the same word is already present.
	-- empty		when non-zero this match will be added even when it is
	-- 		an empty string
	-- user_data	custom data which is associated with the item and
	-- 		available in |v:completed_item|; it can be any type;
	-- 		defaults to an empty string
	-- abbr_hlgroup	an additional highlight group whose attributes are
	-- 		combined with |hl-PmenuSel| and |hl-Pmenu| or
	-- 		|hl-PmenuMatchSel| and |hl-PmenuMatch| highlight
	-- 		attributes in the popup menu to apply cterm and gui
	-- 		properties (with higher priority) like strikethrough
	-- 		to the completion items abbreviation
	-- kind_hlgroup	an additional highlight group specifically for setting
	-- 		the highlight attributes of the completion kind.  When
	-- 		this field is present, it will override the
	-- 		|hl-PmenuKind| highlight group, allowing for the
	-- 		customization of ctermfg and guifg properties for the
	-- 		completion kind
	-- match		See "matches" in |complete_info()|.
	--
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format(' [%s]  ', vim_item.kind)

            if vim_item.abbr ~= nil and vim_item.abbr ~= '' then
                vim_item.abbr = string.format('| %s', vim_item.abbr)
            end


            return vim_item
        end

    },

    completion = {
        autocomplete = false
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
    }),

    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" }
    }
})
