return { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = { 'VeryLazy', 'VimEnter' }, -- Sets the loading event to 'VimEnter'
    opts = {
        preset = 'modern',
    },
    config = function(_, opts) -- This is the function that runs, AFTER loading
        vim.print(opts)
        require('which-key').setup(opts)

        -- Document existing key chains
        require('which-key').add {
            { '<leader>c', group = '[C]ode' },
            { '<leader>d', group = '[D]ocument' },
            { '<leader>r', group = '[R]ename' },
            { '<leader>s', group = '[S]earch' },
            { '<leader>w', group = '[W]orkspace' },
            { '<leader>t', group = '[H]ide/Show' },
            { '<leader>g', group = '[g]it' },
            { '<leader>G', group = '[G]it Hunk', mode = { 'n', 'v' } },
            { '<leader>x', group = 'Trouble' },
        }
    end,
}
