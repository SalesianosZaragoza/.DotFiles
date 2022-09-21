vim.g.visual_impairing = ( os.getenv("BLIND") ~= nil )
function BlindReturn(if_true, if_false)
  if vim.g.visual_impairing then return if_true else return if_false end
end

vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
require('options')
require('plugins')
require('keybindings')
require('lsp')
require('lualine-config')
-- require('bufferline-config')
require('telescope-config')
require('octo-config')
require('dap-config')
require('dashboard-config')
require('terminal-config')
require("refactor-config")
require("gitsigns-config")
require('nvim-tree-config')
require('lspsaga-config')
require('scaladex-config')
require('command-palette-config')
require('lua-dev-config')
require('barbar-config')
