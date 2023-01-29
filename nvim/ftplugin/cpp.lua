local scan = require "plenary.scandir"
local contains = function(tbl, str)
  for _, v in ipairs(tbl) do
    if v == str then
      return true
    end
  end
  return false
end
local exists = function(dir, file_pattern)
  local dirs = scan.scan_dir(dir, { depth = 1, search_pattern = file_pattern })
  return contains(dirs, dir .. "/" .. file_pattern)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities,
cmd = { "clangd", '--background-index', '--clang-tidy' }
})

local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
  print("nvim-dap not installed!")
  return
end

require("mason-nvim-dap").setup({
    ensure_installed = { "cpptools" }
})
require('dap').set_log_level('DEBUG') -- Helps when configuring DAP, see logs with :DapShowLog

local dap_ui_ok, ui = pcall(require, "dapui")
if not (dap_ok and dap_ui_ok) then
  require("notify")("dap-ui not installed!", "warning")
  return
end
vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

dap.configurations.cpp = {
  {
    name = "C++ Debug And Run",
    type = "codelldb",
    request = "launch",
    program = function()
      -- First, check if exists CMakeLists.txt
      local cwd = vim.fn.getcwd()
      if exists(cwd, "CMakeLists.txt") then
        -- Then invoke cmake commands
        -- Then ask user to provide execute file
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      else
        local fileName = vim.fn.expand("%:t:r")
        -- create this directory
        os.execute("mkdir -p " .. "bin")
        local cmd = "!g++ -g % -o bin/" .. fileName
        -- First, compile it
        vim.cmd(cmd)
        -- Then, return it
        return "${fileDirname}/bin/" .. fileName
      end
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
}

dap.adapters.executable = {
type = 'executable',
command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
name = 'lldb1',
host = '127.0.0.1',
port = 13000
}

dap.adapters.codelldb = {
    name = "codelldb server",
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}
