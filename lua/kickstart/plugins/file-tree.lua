return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
            -- { -- Optional image support in preview window: See `# Preview Mode` for more information
            --     '3rd/image.nvim',
            --     build = false, -- so that it doesn't build the rock
            --     opts = {
            --         backend = 'ueberzug', -- or "kitty"
            --         processor = 'magick_cli', -- or "magick_rock"
            --     },
            -- },
        },
        cmd = 'Neotree',
        keys = {
            { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
        },
        opts = {
            filesystem = {
                window = {
                    mappings = {
                        ['\\'] = 'close_window',
                    },
                },
                filtered_items = {
                    visible = true, -- Show hidden files
                    -- hide_dotfiles = false,
                    -- hide_gitignored = true,
                },
            },
        },
    },
}
