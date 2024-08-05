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
            statusline = { 'neo-tree', 'toggleterm', 'neotest-summary', 'edgy' },
            winbar = {},
        },
        ignore_focus = {
            'neo-tree',
            'toggleterm',
            'aerial',
            'neotest-summary',
        },
        extensions = { 'lazy', 'fzf', 'trouble' },
    },
}
