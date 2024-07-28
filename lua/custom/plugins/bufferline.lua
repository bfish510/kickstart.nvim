return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
        { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete [B]uffers: [O]ther' },
        { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
        { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
        { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
        { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    },
    opts = {
        options = {
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'Neo-tree',
                    highlight = 'Directory',
                    text_align = 'left',
                },
            },
        },
    },
    event = 'VeryLazy',
}
