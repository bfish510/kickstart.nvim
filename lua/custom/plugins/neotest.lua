-- TODO: Integrate with trouble
return {
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'nvim-lua/plenary.nvim',
            'antoinemadec/FixCursorHold.nvim',
            'nvim-treesitter/nvim-treesitter',
            'mrcjkb/rustaceanvim',
        },
        opts = {
            output = {
                open_on_run = true,
            },
            quickfix = {
                open = function()
                    require('trouble').open { mode = 'quickfix', focus = false }
                end,
            },
        },
        keys = {
            -- Temp for validating
            {
                '<leader>tt',
                function()
                    require('neotest').run.run(vim.fn.expand '%')
                end,
                desc = 'Run File',
            },
            {
                '<leader>tc',
                function()
                    require('neotest').output_panel.clear()
                end,
                desc = 'Clear Neotest',
            },
        },
        config = function(_, opts)
            opts.adapters = opts.adapters or {}
            vim.list_extend(opts.adapters, {
                require 'rustaceanvim.neotest',
            })
            require('neotest').setup(opts)
        end,
    },
}
