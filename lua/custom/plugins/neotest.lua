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
            status = {
                virtual_text = true,
            },
            quickfix = {
                open = function()
                    require('trouble').open { mode = 'quickfix', focus = false }
                end,
            },
        },
        keys = {
            { '<leader>t', '', desc = '+test' },
            {
                '<leader>tt',
                function()
                    require('neotest').run.run(vim.fn.expand '%')
                end,
                desc = 'Run File',
            },
            {
                '<leader>tT',
                function()
                    require('neotest').run.run(vim.uv.cwd())
                end,
                desc = 'Run All Test Files',
            },
            {
                '<leader>tr',
                function()
                    require('neotest').run.run()
                end,
                desc = 'Run Nearest',
            },
            {
                '<leader>tl',
                function()
                    require('neotest').run.run_last()
                end,
                desc = 'Run Last',
            },
            {
                '<leader>ts',
                function()
                    require('neotest').summary.toggle()
                end,
                desc = 'Toggle Summary',
            },
            {
                '<leader>to',
                function()
                    require('neotest').output.open { enter = true, auto_close = true }
                end,
                desc = 'Show Output',
            },
            {
                '<leader>tO',
                function()
                    require('neotest').output_panel.toggle()
                end,
                desc = 'Toggle Output Panel',
            },
            {
                '<leader>tS',
                function()
                    require('neotest').run.stop()
                end,
                desc = 'Stop',
            },
            {
                '<leader>tw',
                function()
                    require('neotest').watch.toggle(vim.fn.expand '%')
                end,
                desc = 'Toggle Watch',
            },
        },
        config = function(_, opts)
            -- adapters
            opts.adapters = opts.adapters or {}
            vim.list_extend(opts.adapters, {
                require 'rustaceanvim.neotest',
            })

            -- trouble
            opts.consumers = opts.consumers or {}
            -- Refresh and auto close trouble after running tests
            ---@type neotest.Consumer
            opts.consumers.trouble = function(client)
                client.listeners.results = function(adapter_id, results, partial)
                    if partial then
                        return
                    end
                    local tree = assert(client:get_position(nil, { adapter = adapter_id }))

                    local failed = 0
                    for pos_id, result in pairs(results) do
                        if result.status == 'failed' and tree:get_key(pos_id) then
                            failed = failed + 1
                        end
                    end
                    vim.schedule(function()
                        local trouble = require 'trouble'
                        if trouble.is_open() then
                            trouble.refresh()
                            if failed == 0 then
                                trouble.close()
                            end
                        end
                    end)
                    return {}
                end
            end
            require('neotest').setup(opts)
        end,
    },
}
