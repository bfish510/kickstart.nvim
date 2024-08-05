return {
    {
        'folke/edgy.nvim',
        event = 'VeryLazy',
        debug = true,
        ---@type Edgy.Config
        opts = {
            animate = {
                enabled = false,
            },
            ---@type (Edgy.View.Opts|string)[]
            bottom = {
                -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
                {
                    ft = 'toggleterm',
                    size = { height = 0.4 },
                    -- exclude floating windows
                    filter = function(_, win)
                        return vim.api.nvim_win_get_config(win).relative == ''
                    end,
                },
                {
                    ft = 'lazyterm',
                    title = 'LazyTerm',
                    size = { height = 0.4 },
                    filter = function(buf)
                        return not vim.b[buf].lazyterm_cmd
                    end,
                },
                'Trouble',
                {
                    ft = 'trouble',
                    filter = function(_buf, win)
                        return vim.w[win].trouble
                            and vim.w[win].trouble.type == 'split'
                            and vim.w[win].trouble.relative == 'editor'
                            and not vim.w[win].trouble_preview
                    end,
                },
                { ft = 'qf', title = 'QuickFix' },
                {
                    ft = 'help',
                    size = { height = 20 },
                    -- only show help buffers
                    filter = function(buf)
                        return vim.bo[buf].buftype == 'help'
                    end,
                },
                { ft = 'spectre_panel', size = { height = 0.4 } },
                { title = 'Neotest Output', ft = 'neotest-output-panel', size = { height = 15 } },
            },
            left = {
                {
                    title = 'Neo-Tree File System',
                    ft = 'neo-tree',
                    filter = function(buf, _win)
                        return vim.b[buf].neo_tree_source == 'filesystem'
                    end,
                    pinned = true,
                    collapsed = false,
                    open = 'Neotree position=left source=filesystem',
                },
                {
                    title = 'Neo-Tree Git',
                    ft = 'neo-tree',
                    filter = function(buf, _win)
                        return vim.b[buf].neo_tree_source == 'git_status'
                    end,
                    pinned = true,
                    collapsed = false,
                    open = function()
                        require('neo-tree.command').execute { source = 'git_status', toggle = true, action = 'focus', position = 'right' }
                    end,
                },
                {
                    title = 'Neotest Summary',
                    ft = 'neotest-summary',
                    pinned = true,
                    collapsed = false,
                    open = function()
                        require('neotest').summary.open()
                    end,
                },
            },
        },
        config = function(_, opts)
            require('edgy').setup(opts)
        end,
    },
    {
        'akinsho/bufferline.nvim',
        opts = function()
            local Offset = require 'bufferline.offset'
            if not Offset.edgy then
                local get = Offset.get
                Offset.get = function()
                    if package.loaded.edgy then
                        local layout = require('edgy.config').layout
                        local ret = { left = '', left_size = 0, right = '', right_size = 0 }
                        for _, pos in ipairs { 'left', 'right' } do
                            local sb = layout[pos]
                            if sb and #sb.wins > 0 then
                                local title = ' Sidebar' .. string.rep(' ', sb.bounds.width - 8)
                                ret[pos] = '%#EdgyTitle#' .. title .. '%*' .. '%#WinSeparator#│%*'
                                ret[pos .. '_size'] = sb.bounds.width
                            end
                        end
                        ret.total_size = ret.left_size + ret.right_size
                        if ret.total_size > 0 then
                            return ret
                        end
                    end
                    return get()
                end
                Offset.edgy = true
            end
        end,
    },
}
