local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
  print("nvim-dap not installed!")
  return
end

require("mason-nvim-dap").setup({
    ensure_installed = { "cpptools" }
})
require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

local dap_ui_ok, ui = pcall(require, "dapui")
if not (dap_ok and dap_ui_ok) then
  require("notify")("dap-ui not installed!", "warning")
  return
end
vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

ui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = true,
  layouts = {
    {
      elements = {
        "scopes",
      },
      size = 0.3,
      position = "right"
    },
    {
      elements = {
        "repl",
        "breakpoints"
      },
      size = 0.3,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

--[[
dap.configurations = {
    cpp = {
      {
        type = "cpptools", -- Which adapter to use
        name = "Debug", -- Human readable name
        request = "launch", -- Whether to "launch" or "attach" to program
        program = "${file}", -- The buffer you are focused on when running nvim-dap
      },
    }
}

dap.configurations.cpp = {
  {
    name = "C++ Debug And Run",
    type = "cppdbg",
    request = "launch",
    program = function()
      -- First, check if exists CMakeLists.txt
      local cwd = vim.fn.getcwd()
      if file.exists(cwd, "CMakeLists.txt") then
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

dap.adapters.cpptools = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/cpptools'
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}


]]--
