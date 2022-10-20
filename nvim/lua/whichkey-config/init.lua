local wk = require("which-key")

local conf = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = BlindReturn(40,20), -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = BlindReturn(">", "»"), -- symbol used in the command line area that shows your active key combo
    separator = BlindReturn("->", "➜"), -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "top", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 100, max = 125 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
wk.setup(conf)

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})
  return lazygit:toggle()
end
local vmappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },

    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    },
    R = {
      name = "Refactor",
      f = {"<cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function"},
      F = {"<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract to File" },
      b = {"<cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block"},
      B = {"<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block to File"},
      l = {"<cmd>lua require('refactoring').refactor('Extract Local')<CR>", "Extract Local"},
      v = {"<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable"},
      m = {"<cmd>lua require('refactoring').refactor('Extract Method')<CR>", "Extract Method"},
      L = {"<cmd>lua require('refactoring').refactor('Inline Local')<CR>", "Inline Local"},
      V = {"<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable"},
      M = {"<cmd>lua require('refactoring').refactor('Inline Method')<CR>", "Inline Method"},
      S = {"<cmd>lua require('refactoring').select_refactor()<CR>", "Select"},
      R = {'<cmd>Lspsaga rename<cr>', "Rename"},
    },
  j = {
    name = "Java",
      -- Java specific
      e ={ "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "extract variables"},
      E = {"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "extract method"},
    },
}
local mappings = {
  [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    c = { "<cmd>BufferKill<CR>", "Close Buffer" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
  d ={
    name = "Debug",
    d = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
    B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Set Breakpoint" },
    l = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Log Point" },
    p = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
    n = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
    r = { "<cmd>lua require'dap'.repl.open()<CR>", "Repl" },
    R = { "<cmd>lua require'dap'.run_last()<CR>", "Run Last" },
    c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    s = { "<cmd>lua require'dap'.stop()<CR>", "Stop" },
    i = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
    D = {
      name = "DapUI",
      t = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle" },
      o = { "<cmd>lua require'dapui'.open()<CR>", "Open" },
      h = { "<cmd>lua require'dapui'.float_element('hover')<CR>", "Hover" },
      s = { "<cmd>lua require'dapui'.float_element('scopes')<CR>", "Scopes" },
      b = { "<cmd>lua require'dapui'.float_element('breakpoints')<CR>", "Breakpoints" },
      w = { "<cmd>lua require'dapui'.float_element('watch')<CR>", "Watch" },
      S = { "<cmd>lua require'dapui'.float_element('stacks')<CR>", "Stacks" },
      T = { "<cmd>lua require'dapui'.float_element('threads')<CR>", "Threads" },
      f = { "<cmd>lua require'dapui'.float_element('frames')<CR>", "Frames" },
      l = { "<cmd>lua require'dapui'.float_element('locals')<CR>", "Locals" },
      c = { "<cmd>lua require'dapui'.close()<CR>", "Close" },
    }
    },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
    P = {'<cmd>lua require("telescope").extensions.packer.plugins(opts)<CR>', "Telescope Packer"},
  },
  j = {
    name = "Java",
      -- Java specific
      i = {"<Cmd>lua require'jdtls'.organize_imports()<CR>", "organize imports"},
      T = {"<Cmd>lua require'jdtls'.test_class()<CR>", "test class"},
      n = {"<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "text nearest method"},
      e ={ "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "extract variables"},
      s = {"<Cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>", "scaladex telescope"},
    },
  G = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
    G ={
      name = "Git Advanced",
      g = {":GitGrep<cr>", "Git Grep"},
      s = {":GitStash<cr>", "Git Stash"},
      c = {":GitCommit<cr>", "Git Commit"},
      p = {":GitPush<cr>", "Git Push"},
      u = {":GitPull<cr>", "Git Pull"},
      d = {":GitDiff<cr>", "Git Diff"},
      a = {":GitAdd<cr>", "Git Add"},
      r = {":GitRevert<cr>", "Git Revert"},
      b = {":GitBranch<cr>", "Git Branch"},
      m = {":GitMerge<cr>", "Git Merge"},
      t = {":GitTag<cr>", "Git Tag"},
      y = {":GitShow<cr>", "Git Show"},
      n = {":GitNew<cr>", "Git New"},
      e = {":GitExport<cr>", "Git Export"},
      i = {":GitIgnore<cr>", "Git Ignore"},
    },
  },
  t = {
    name = "Terminal",
    t = {":ToggleTerm<cr>", "Split Below"},
    f = {toggle_float, "Floating Terminal"},
    l = {toggle_lazygit, "LazyGit"},
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    I = { "<cmd>LspInfo<cr>", "Info" },
    M = { "<cmd>Mason<cr>", "Mason Info" },
    J = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    K = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    p = {
      name = "Peek",
    },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    W = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    f = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    i = {":LspInfo<cr>", "Connected Language Servers"},
    Q = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', "Show loclist"},
    k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
    h = {"<cmd>Lspsaga hover_doc<cr>", "Hover Commands"},
    L = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', "List Workspace Folders"},
    t = {'<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition"},
    d = {'<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition"},
    D = {'<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration"},
    F = {
      name = "Refactor",
      S = {"<cmd>lua require('refactoring').select_refactor()<CR>", "Select"},
      b = {"<cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block"},
      B = {"<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block to File"},
      l = {"<cmd>lua require('refactoring').refactor('Extract Local')<CR>", "Extract Local"},
      v = {"<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable"},
      m = {"<cmd>lua require('refactoring').refactor('Extract Method')<CR>", "Extract Method"},
      L = {"<cmd>lua require('refactoring').refactor('Inline Local')<CR>", "Inline Local"},
      V = {"<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable"},
      M = {"<cmd>lua require('refactoring').refactor('Inline Method')<CR>", "Inline Method"},
      R = {'<cmd>Lspsaga rename<cr>', "Rename"},
    },
    R = {  '<cmd>lua vim.lsp.buf.references()<cr>', "References"},
    e = {'<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics"},
    E = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', "Show line diagnostics"},
    n = {'<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic"},
    N = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic"}
  },
  L = {
    name = "Logs",
    N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
    n = { "<cmd>Telescope notify<cr>", "View Notifications" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    g = {":Telescope live_grep<cr>", "Telescope Live Grep"},
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  e = {
    name = "edit",
    j = {':move .+1<CR>==', 'move line down'},
    k = {':move .-2<CR>==', 'move line up'},
    h = {':move <left>', 'move char left'},
    l = {':move <right>', 'move char right'},
    J = {':m .+1<CR>==', 'move line down'},
    K = {':m .-2<CR>==', 'move line up'},
    H = {':m <', 'move line left'},
    L = {':m >', 'move line right'},
    d = {':call DeleteTrailingWhitespace()<CR>', 'delete trailing whitespace'},

  },
  W ={
    name = "Workspace",
    A = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder"},
    R = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder"},
    l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', "List workspace folder"},
    w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder"},
    W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder"},
  },
  f = {
    name = "Format",
    f = {'<cmd> lua vim.lsp.buf.formatting_seq_sync()<CR>', "format file"}
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Treesitter info" },
    p = { ":TSPlaygroundToggle<cr>", "Treesitter playground" },
    r = { ":TSBufEnable highlight<cr>", "Treesitter highlight" },
    R = { ":TSBufDisable highlight<cr>", "Treesitter highlight" },

  },
  o = {
    name = "Open",
    o = {":Open<cr>", "Open"},
    c = {":OpenCwd<cr>", "Open Cwd"},
    C = {":OpenDir<cr>", "Open Dir"},
    f = {":OpenFile<cr>", "Open File"},
    s = {":OpenSplit<cr>", "Open Split"},
    t = {":OpenTab<cr>", "Open Tab"},
    w = {":OpenWin<cr>", "Open Win"},
    v = {":OpenVertSplit<cr>", "Open Vert Split"},
    h = {":OpenHorizSplit<cr>", "Open Horiz Split"},
    a = {":OpenAll<cr>", "Open All"},
    p = {":OpenPane<cr>", "Open Pane"},
    r = {":OpenWinRight<cr>", "Open Win Right"},
    l = {":OpenWinLeft<cr>", "Open Win Left"},
    u = {":OpenWinUp<cr>", "Open Win Up"},
    d = {":OpenWinDown<cr>", "Open Win Down"},
    j = {":OpenWinDown<cr>", "Open Win Down"},
    k = {":OpenWinDown<cr>", "Open Win Down"},
    n = {":OpenNewTab<cr>", "Open New Tab"},
    q = {":OpenNewWin<cr>", "Open New Win"},
    g = {":OpenNewVertSplit<cr>", "Open New Vert Split"},
    b = {":OpenNewHorizSplit<cr>", "Open New Horiz Split"},
    m = {":OpenNewPane<cr>", "Open New Pane"},
},
  i = {
    name = "Insert",
    i = {":Insert<cr>", "Insert"},
    c = {":InsertCwd<cr>", "Insert Cwd"},
    C = {":InsertDir<cr>", "Insert Dir"},
    f = {":InsertFile<cr>", "Insert File"},
    s = {":InsertSplit<cr>", "Insert Split"},
    t = {":InsertTab<cr>", "Insert Tab"},
    w = {":InsertWin<cr>", "Insert Win"},
    v = {":InsertVertSplit<cr>", "Insert Vert Split"},
    h = {":InsertHorizSplit<cr>", "Insert Horiz Split"},
    a = {":InsertAll<cr>", "Insert All"},
    p = {":InsertPane<cr>", "Insert Pane"},
    r = {":InsertWinRight<cr>", "Insert Win Right"},
    l = {":InsertWinLeft<cr>", "Insert Win Left"},
    u = {":InsertWinUp<cr>", "Insert Win Up"},
    d = {":InsertWinDown<cr>", "Insert Win Down"},
  },
  S = {
    name = "Sql dadbod",
    C = {":DBUIConnect<cr>", "DBUI Connect"},
    D = {":DBUIDisconnect<cr>", "DBUI Disconnect"},
    E = {":DBUIExecute<cr>", "DBUI Execute"},
    f = {":DBUIFindBuffer<cr>", "DBUI Find Buffer"},
    i = {":DBUI<cr>", "DBUI"},
    I = {":DBUILastQueryInfo<cr>", "DBUI Last Query Info"},
    n = {":DBUINewQuery<cr>", "DBUI New Query"},
    o = {":DBUIOpen<cr>", "DBUI Open"},
    q = {":DBUIQuickQuery<cr>", "DBUI Quick Query"},
    r = {":DBUIRenameBuffer<cr>", "DBUI Rename Buffer"},
    s = {":DBUIShowHistory<cr>", "DBUI Show History"},
    t = {":DBUIToggleResults<cr>", "DBUI Toggle Results"},
    u = {":DBUIUseConnection<cr>", "DBUI Use Connection"},
    w = {":DBUIWhereAmI<cr>", "DBUI Where Am I"},
    a = {":DBUIAddConnection<cr>", "DBUI Add Connection"},
    d = {":DBUIDeleteConnection<cr>", "DBUI Delete Connection"},
    e = {":DBUIEditConnection<cr>", "DBUI Edit Connection"},
    l = {":DBUIListConnections<cr>", "DBUI List Connections"},
    R = {":DBUIRenameConnection<cr>", "DBUI Rename Connection"},
    },
  z = {
    name = "Focus",
    z = {":ZenMode<cr>", "Toggle Zen Mode"},
    t = {":Twilight<cr>", "Toggle Twilight"}
  }
}

  local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<space>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
  local vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<space>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
wk.register(mappings, opts)
wk.register(vmappings, vopts)
