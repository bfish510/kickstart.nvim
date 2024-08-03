local rose_pine_overrides = { buffer_selected = { italic = false } } -- { buffer_selected = { bg = '#FFFFFF', fg = '#000000', bold = false, italic = false } }

return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete [B]uffers: [O]ther' },
        { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
        { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
        { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
        { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    },
    opts = {
        options = {
            themeable = true,
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = 'Directory',
                    text_align = 'left',
                },
            },
        },
        highlights = function()
            local rose_pine_basis = require 'rose-pine.plugins.bufferline'
            local hi = vim.tbl_extend('force', rose_pine_basis, rose_pine_overrides)
            -- vim.print(hi)
            return hi
        end,
    },
    event = { 'VeryLazy', 'ColorScheme' },
}
