require("which-key").setup
{
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
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
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
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
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
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


local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})
  return lazygit:toggle()
end
local mappings = {
  j = {':move .+1<CR>==', 'move line down'},
  k = {':move .-2<CR>==', 'move line up'},
  l = {
    name = "LSP",
    i = {":LspInfo<cr>", "Connected Language Servers"},
    A = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder"},
    R = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder"},
    l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', "List workspace folder"},
    D = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', "Type definition"},
    r = {'<cmd>lua vim.lsp.buf.rename()<CR>', "Rename"},
    a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code actions"},
    e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', "Show line diagnostics"},
    q = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', "Show loclist"}
  },
  t = {
    name = "Terminal",
    t = {":ToggleTerm<cr>", "Split Below"}, 
    f = {toggle_float, "Floating Terminal"}, 
    l = {toggle_lazygit, "LazyGit"},
    f = {":Telescope find_files<cr>", "Telescope Find Files"},
    r = {":Telescope live_grep<cr>", "Telescope Live Grep"},
    p = {'<cmd>lua require("telescope").extensions.packer.plugins(opts)<CR>', "Telescope Packer"}
  },
  g ={
    name = "Git",
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
  o = {
    name = "Open",
    o = {":Open<cr>", "Open"},
    c = {":OpenCwd<cr>", "Open Cwd"},
    d = {":OpenDir<cr>", "Open Dir"},
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
    s = {":OpenNewTab<cr>", "Open New Tab"},
    t = {":OpenNewTab<cr>", "Open New Tab"},
    w = {":OpenNewWin<cr>", "Open New Win"},
    v = {":OpenNewVertSplit<cr>", "Open New Vert Split"},
    h = {":OpenNewHorizSplit<cr>", "Open New Horiz Split"}, 
},
  i = {
    name = "Insert",
    i = {":Insert<cr>", "Insert"}, 
    c = {":InsertCwd<cr>", "Insert Cwd"},
    d = {":InsertDir<cr>", "Insert Dir"},
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
  }
  
}
local opts = {prefix = '<C-x>'}
local wk = require("which-key")
wk.register(mappings, opts)
