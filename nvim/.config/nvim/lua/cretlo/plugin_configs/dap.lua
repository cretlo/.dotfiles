local dap = require('dap')
local dapui = require("dapui")
dapui.setup()

dap.adapters['pwa-node'] = {
    type = 'server',
    host = '127.0.0.1',
    port = 8123,
    executable = {
        command = 'js-debug-adapter',
    }
}

--require('dap-vscode-js').setup({
--    adapters = {'pwa-node'},
--    debugger_path = "/home/cretlo/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", -- Path to vscode-js-debug installation.
--})

for _, language in ipairs {'typescript'} do
    dap.configurations[language] = {
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            command = 'ts-node ${file}',
            program = '${file}',
            cwd = '${workspaceFolder}',
        }
    }
end

--for _, language in ipairs {'typescript', 'javascript'} do
--    dap.configurations[language] = {
--        {
--            type = 'pwa-node',
--            request = 'launch',
--            name = 'Launch file',
--            program = '${file}',
--            cwd = '${workspaceFolder}',
--            runtimeExecutable = 'node',
--        }
--    }
--end

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
