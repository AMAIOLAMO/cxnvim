-- not used because of it's buggy nature
function set_background_as_transparent()
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

function colorscheme_set_or_default(defaultColor)
	color = defaultColor or 'nordic'
	vim.cmd.colorscheme(color)
end

