local dap = require('dap')
local dap_vscode = require('dap.ext.vscode')
local dap_ui_widgets = require('dap.ui.widgets')

local dapui = require('dapui')

dapui.setup()

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F6>', function() dap_vscode.load_launchjs() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dapui').eval(nil, { enter = true })
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    dap_ui_widgets.preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    dap_ui_widgets.centered_float(dap_ui_widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    dap_ui_widgets.centered_float(dap_ui_widgets.scopes)
end)

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

dap.adapters.lldb = {
    type = 'executable',
    command = vim.env.HOME .. '/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.rust = {
    {
        name = 'Launch lldb',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/',
            'file'
            )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    }
}
