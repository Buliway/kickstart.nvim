return {
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = true,
        -- opts = ...
        init = function()
            local colors = require('gruvbox').palette
            colors.neutral_aqua = '#8bba7f'
            colors.bright_red = '#f2594b'
            colors.bright_green = '#a4ab43'
            -- Default options:
            require('gruvbox').setup {
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true, -- underline errors
                underline = true, -- underline links
                bold = false, -- bold keywords
                italic = {
                    strings = true,
                    emphasis = true, -- курсив выделения
                    comments = true,
                    operators = false,
                    folds = true, -- курсив для сворачиваемых блоков кода
                },
                strikethrough = true, -- зачёркиваниe удалённых или устаревших элементов
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = '', -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {
                    LspReferenceText = { -- ссылки на элементы под курсором
                        bg = '#504945',
                    },
                    LspReferenceWrite = {
                        bg = '#504945',
                    },
                    LspReferenceRead = {
                        bg = '#504945',
                    },
                    String = {
                        fg = colors.neutral_aqua,
                    },
                    ['@keyword.import.go'] = {
                        fg = colors.bright_red,
                    },
                },
                dim_inactive = false,
                transparent_mode = false,
            }
            vim.cmd.colorscheme 'gruvbox'
        end,
    },
}
