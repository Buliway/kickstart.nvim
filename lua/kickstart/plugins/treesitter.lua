-- Highlight, edit, and navigate code

return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-context',
                config = function()
                    require('treesitter-context').setup {
                        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                        multiwindow = false, -- Enable multiwindow support.
                        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                        line_numbers = true,
                        multiline_threshold = 3, -- Maximum number of lines to show for a single context
                        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
                        -- Separator between context and content. Should be a single character string, like '-'.
                        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                        separator = nil,
                        zindex = 20, -- The Z-index of the context window
                        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                    }
                    vim.keymap.set('n', 'gp', function()
                        require('treesitter-context').go_to_context(vim.v.count1)
                    end, { silent = true, desc = '[G]oto context ([P]arent)' })
                end,
            },
            -- {
            --     'nvim-treesitter/nvim-treesitter-textobjects',
            -- },
        },
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'cpp',
                'diff',
                'html',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'query',
                'vim',
                'vimdoc',
                'css',
                'javascript',
                'typescript',
                'json',
                'csv',
                'go',
                'nix',
                'python',
                'rust',
                'sql',
                'templ',
                'toml',
                'yaml',
                'cmake',
                'printf',
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },
}
