-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
        { '<leader>gs', ':Neotree reveal git_status float<CR>', desc = '[G]it [S]tatus preview' },
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
        },
        open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
        hijack_netrw_behavior = 'open_default',
        follow_current_file = {
            enabled = true,
        },
    },
}
