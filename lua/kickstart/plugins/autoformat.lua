-- Autoformat
-- Timeout для форматирования пришлось задать в 5 секунд, потому что sqlfluff очень долго форматирует

return {
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format {
                        async = true,
                        lsp_format = 'fallback',
                        timeout_ms = 5000,
                    }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                local lsp_format_opt
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    lsp_format_opt = 'never'
                else
                    lsp_format_opt = 'fallback'
                end
                return {
                    timeout_ms = 5000,
                    lsp_format = lsp_format_opt,
                }
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                go = { 'gofmt', 'injected' },
                sql = { 'sqlfluff' },
                -- ['*'] = { 'injected' }, -- enables injected-lang formatting for all filetypes

                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            formatters = {
                -- sql_formatter = {
                --     -- prepend_args = { "-c", vim.fn.expand("~/.config/sql_formatter.json"),
                --     args = function()
                --         -- Создаём временный JSON-файл конфигурации
                --         local config_path = vim.fn.tempname() .. ".json"
                --         local config_content = vim.fn.json_encode({
                --             tabWidth = 4,
                --         })
                --         local file = io.open(config_path, "w")
                --         file:write(config_content)
                --         file:close()
                --         -- Возвращаем аргументы для форматтера с указанием конфигурационного файла
                --         return { "-c", config_path }
                --     end,
                --     stdin = true,
                -- },
                sqlfluff = {
                    command = 'sqlfluff',
                    args = {
                        'format',
                        -- 'fix',
                        -- '--dialect',
                        -- 'postgres',
                        -- '--disable-progress-bar',
                        '-',
                    },
                    stdin = true,
                },
            },
        },
    },
}
