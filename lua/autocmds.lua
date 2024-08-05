local function augroup(name)
    return vim.api.nvim_create_augroup('Stolen_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('FileType', {
    group = augroup 'close_with_q',
    pattern = {
        'OverseerForm',
        'OverseerList',
        'checkhealth',
        'floggraph',
        'fugitive',
        'git',
        'help',
        'lspinfo',
        'man',
        'neotest-output',
        'neotest-summary',
        'qf',
        'query',
        'spectre_panel',
        'startuptime',
        'toggleterm',
        'tsplayground',
        'vim',
        'neoai-input',
        'neoai-output',
        'netrw',
        'notify',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
})
