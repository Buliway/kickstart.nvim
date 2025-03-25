-- Highlight, edit, and navigate code

return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-context',
                config = function()
                    require('treesitter-context').setup {
                        enable = true,
                        multiwindow = false,
                        max_lines = 0,
                        min_window_height = 0,
                        line_numbers = true,
                        multiline_threshold = 3,
                        trim_scope = 'outer',
                        mode = 'cursor',
                        separator = nil,
                        zindex = 20,
                        on_attach = nil,
                    }
                    vim.keymap.set('n', 'gp', function()
                        require('treesitter-context').go_to_context(vim.v.count1)
                    end, { silent = true, desc = '[G]oto context ([P]arent)' })
                end,
            },
        },
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = {
                'bash',
                'diff',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'query',
                'vim',
                'vimdoc',
                'json',
                'csv',
                'toml',
                'yaml',
                'cmake',
                'printf',
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
    },
}
