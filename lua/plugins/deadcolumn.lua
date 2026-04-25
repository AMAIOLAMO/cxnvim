return {
    'Bekaboo/deadcolumn.nvim',

    config = function()
        vim.opt.colorcolumn = '90'
        require('deadcolumn').setup()
    end
}
