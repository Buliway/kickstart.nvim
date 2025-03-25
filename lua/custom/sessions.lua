local function get_git_branch()
    local branch = vim.fn.systemlist('git branch --show-current')[1] or ''
    return (vim.v.shell_error == 0 and branch ~= '') and branch or nil
end
local function session_name()
    local cwd = vim.fn.getcwd()
    local branch = get_git_branch()
    local name = cwd
    local sha = vim.fn.sha256(name)
    if branch then
        sha = sha .. '-' .. branch
    end
    return sha
end
local function should_save_session()
    local argc = vim.fn.argc()
    if argc == 0 then
        return true
    end
    if argc == 1 then
        local first_arg = vim.fn.argv(0)
        return vim.fn.isdirectory(first_arg) == 1
    end
    return false
end
local function session_exist()
    local session_dir = vim.fn.stdpath 'data' .. '/session/'
    local session_path = session_dir .. session_name()
    return vim.fn.filereadable(session_path) == 1
end
local function save_session()
    if not should_save_session() then
        return
    end
    local name = session_name()
    require('mini.sessions').write(name)
    print('💾 Session Saved: ' .. name)
end

vim.api.nvim_create_autocmd('VimLeavePre', {
    desc = 'Auto save session on exit if session exists',
    callback = function()
        if not session_exist() then
            return
        end

        save_session()
    end,
})
local function restore_session()
    if not should_save_session() then
        return
    end
    if not session_exist() then
        return
    end
    local name = session_name()
    require('mini.sessions').read(name)
    print('💾 Session Restored: ' .. name)
end
vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    desc = 'Auto restore session after plugin load',
    callback = function()
        vim.defer_fn(function()
            restore_session()
        end, 50)
    end,
    nested = true,
})
vim.keymap.set('n', '<Space><BS>', function()
    restore_session()
end, { desc = 'Restore session' })
vim.keymap.set('n', '<Space>Sd', function()
    local name = session_name()
    require('mini.sessions').delete(name)
    print('💾 Session Deleted: ' .. name)
end, { desc = '[S]ession [D]elete' })
vim.keymap.set('n', '<Space>Sc', function()
    save_session()
end, { desc = '[S]ession [C]reate' })
