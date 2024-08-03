return {
    'nvim-lualine/lualine.nvim',
    event = { 'VeryLazy', 'ColorScheme' },
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = ' '
        else
            vim.o.laststatus = 0
        end
    end,
    opts = {
        theme = 'rose-pine',
        icons_enabled = true,
        disabled_filetypes = {
            statusline = { 'neo-tree', 'toggleterm' },
            winbar = {},
        },
        ignore_focus = {
            'neo-tree',
            'toggleterm',
            'aerial',
        },
        extensions = { 'neo-tree', 'lazy', 'fzf', 'trouble' },
    },
}
