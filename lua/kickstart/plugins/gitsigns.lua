-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require 'gitsigns'

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true }
                    else
                        gitsigns.nav_hunk 'next'
                    end
                end, { desc = 'Jump to next git [c]hange' })

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true }
                    else
                        gitsigns.nav_hunk 'prev'
                    end
                end, { desc = 'Jump to previous git [c]hange' })

                -- Actions
                -- visual mode
                map('v', '<leader>Gs', function()
                    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = 'stage git hunk' })
                map('v', '<leader>Gr', function()
                    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = 'reset git hunk' })
                -- normal mode
                map('n', '<leader>Gs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
                map('n', '<leader>Gr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
                map('n', '<leader>GS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
                map('n', '<leader>Gu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
                map('n', '<leader>GR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
                map('n', '<leader>Gp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
                map('n', '<leader>Gb', gitsigns.blame_line, { desc = 'git [b]lame line' })
                map('n', '<leader>Gd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
                map('n', '<leader>GD', function()
                    gitsigns.diffthis '@'
                end, { desc = 'git [D]iff against last commit' })
                -- Toggles
                map('n', '<leader>hb', gitsigns.toggle_current_line_blame, { desc = '[H]ide/Show git show [b]lame line' })
                map('n', '<leader>hD', gitsigns.toggle_deleted, { desc = '[H]ide/Show git show [D]eleted' })
            end,
        },
    },
}
