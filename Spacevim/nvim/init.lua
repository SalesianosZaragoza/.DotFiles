function fif(condition, if_true, if_false)
  if condition then return if_true else return if_false end
end

vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
require('options')
require('plugins')
require('keybindings')
require('lualine-config')
require('dap')
--require('bufferline-config')
require('telescope-config')
require('octo')
require('terminal')
require("refactor")
require("gitsigns")
require('nvim-tree-config')
require('lspsaga-config')
require('jdtls-config')
