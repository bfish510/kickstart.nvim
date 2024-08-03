return { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    {
        'folke/tokyonight.nvim',
        priority = 1000,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        events = 'ColorScheme',
        config = function()
            require('rose-pine').setup {
                disable_background = false,
                styles = {
                    italic = false,
                },
            }
        end,
        init = function()
            vim.cmd.colorscheme 'rose-pine-moon'
        end,
    },
}
