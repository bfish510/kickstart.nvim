vim.g.rustaceanvim = function()
    return {
        server = {
            on_attach = function(_, bufnr)
                vim.keymap.set('n', '<leader>cR', function()
                    vim.cmd.RustLsp 'codeAction'
                end, { desc = 'Code Action', buffer = bufnr })
                vim.keymap.set('n', '<leader>dr', function()
                    vim.cmd.RustLsp 'debuggables'
                end, { desc = 'Rust Debuggables', buffer = bufnr })
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ['rust-analyzer'] = {
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        buildScripts = {
                            enable = true,
                        },
                    },
                    -- Add clippy lints for Rust.
                    checkOnSave = {
                        enable = true,
                        command = 'clippy',
                    },
                    procMacro = {
                        enable = true,
                        ignored = {
                            ['async-trait'] = { 'async_trait' },
                            ['napi-derive'] = { 'napi' },
                            ['async-recursion'] = { 'async_recursion' },
                        },
                    },
                },
            },
        },
    }
end

return {
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
        ft = { 'rust' },
    },
    {
        'Saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        opts = {
            completion = {
                cmp = { enabled = true },
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                taplo = {
                    keys = {
                        {
                            'K',
                            function()
                                if vim.fn.expand '%:t' == 'Cargo.toml' and require('crates').popup_available() then
                                    require('crates').show_popup()
                                else
                                    vim.lsp.buf.hover()
                                end
                            end,
                            desc = 'Show Crate Documentation',
                        },
                    },
                },
            },
            setup = {
                rust_analyzer = function()
                    return true
                end,
            },
        },
    },
}
