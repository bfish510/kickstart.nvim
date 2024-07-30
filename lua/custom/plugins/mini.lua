return {
    {
        -- Collection of various small independent plugins/modules
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup { n_lines = 500 }

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()

            require('mini.sessions').setup()

            require('mini.diff').setup {
                view = {
                    style = 'sign',
                },
            }

            local starter = require 'mini.starter'

            starter.setup {
                items = {
                    starter.sections.builtin_actions(),
                    starter.sections.recent_files(10, false),
                    starter.sections.recent_files(10, true),
                    -- Use this if you set up 'mini.sessions'
                    starter.sections.sessions(5, true),
                    starter.sections.telescope(),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(),
                    starter.gen_hook.indexing('all', { 'Builtin actions' }),
                    starter.gen_hook.aligning('center', 'center'),
                    starter.gen_hook.padding(3, 2),
                },
            }
        end,
    },
}
