local augend = require("dial.augend")
require("dial.config").augends:register_group{
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.alias.bool,
    augend.date.alias["%d/%m/%Y"],
--    augend.date.alias["%d-%m-%Y"],
--    augend.constant.alias.ja_weekday_full,
  },
  typescript = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.new{ elements = {"let", "const"} },
  },
  visual = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.alpha,
    augend.constant.alias.Alpha,
  },
}

local map = vim.api.nvim_set_keymap
map("n", "<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})
map("n", "<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})
map("v", "<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})
map("v", "<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})
map("v", "g<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})
map("v", "g<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})
