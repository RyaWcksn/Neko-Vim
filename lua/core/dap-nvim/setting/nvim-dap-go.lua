local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  return
end

dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/Gits/vscode-go/dist/debugAdapter.js'}; -- specify the path to the adapter
}

dap.configurations.go = {
  {
    type = "go",
    name = "Attach",
    request = "attach",
    processId = require("dap.utils").pick_process,
    program = "${workspaceFolder}",
    dlvToolPath = vim.fn.exepath('dlv')
  },
  {
    type = "go",
    name = "Debug curr file",
    request = "launch",
    program = "${file}",
    dlvToolPath = vim.fn.exepath('dlv')
  },
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${workspaceFolder}",
    dlvToolPath = vim.fn.exepath('dlv')
  },
  {
    type = "go",
    name = "Debug curr test",
    request = "launch",
    mode = "test",
    program = "${file}",
    dlvToolPath = vim.fn.exepath('dlv')
  },
  {
    type = "go",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${workspaceFolder}",
    dlvToolPath = vim.fn.exepath('dlv')
  },
}
