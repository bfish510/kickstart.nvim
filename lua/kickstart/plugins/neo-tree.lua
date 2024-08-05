-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    debug = true,
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    ---@type LazyKeysSpec[]
    keys = {
        { '\\', ':Neotree reveal source=filesystem position=left<CR>', desc = 'NeoTree reveal', silent = true },
        {
            '<leader>gs',
            function()
                require('neo-tree.command').execute { source = 'git_status', toggle = true, action = 'focus' }
            end,
            desc = '[G]it [S]tatus preview',
            silent = false,
        },
    },
    deactivate = function()
        vim.print 'Deactiveate neotree'
        vim.cmd [[Neotree close]]
    end,
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['<space>'] = 'none',
                    ['<C-space>'] = 'toggle_node',
                    -- ['\\'] = 'close_window',
                },
            },
        },
        git_status = {
            window = {
                position = 'right',
                mappings = {
                    ['<space>'] = 'none',
                    ['<C-space>'] = 'toggle_node',
                    -- ['\\'] = 'close_window',
                    -- ['<space>gs'] = 'close_window'
                },
            },
        },
        open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf', 'Trouble', 'Outline', 'edgy' },
        hijack_netrw_behavior = 'open_default',
        follow_current_file = {
            enabled = true,
        },
    },
}
