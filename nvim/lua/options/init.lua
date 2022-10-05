vim.g.visual_impairing = ( os.getenv("BLIND") ~= nil )
function BlindReturn(if_true, if_false)
  if vim.g.visual_impairing then return if_true else return if_false end
end

vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
vim.g.mapleader = "º"
vim.o.ch = 0
vim.g.VM_default_mappings = 0
vim.cmd [[packadd packer.nvim]]
vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.relativenumber= true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = BlindReturn(false,true)
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.wo.wrap = BlindReturn(true, false)
vim.wo.number = true
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.opt.termguicolors = true
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = 'night'
