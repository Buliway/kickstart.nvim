return {
    {
        'echasnovski/mini.nvim',
        config = function()
            require('mini.ai').setup { n_lines = 500 }
            require('mini.surround').setup()
            require('mini.sessions').setup {
                autoread = false,
                autowrite = false,
                force = { read = false, write = true, delete = true },
                hooks = {
                    pre = { read = nil, write = nil, delete = nil },
                    post = { read = nil, write = nil, delete = nil },
                },
                verbose = { read = false, write = true, delete = true },
            }
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = vim.g.have_nerd_font }
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%2l:%-2v'
            end
        end,
    },
}
