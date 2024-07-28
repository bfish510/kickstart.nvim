return {
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
        ft = { 'rust' },
    },
    {
        'nvim-neotest/neotest',
        optional = true,
        opts = {
            adapters = {
                ['rustaceanvim.neotest'] = {},
            },
        },
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
}
