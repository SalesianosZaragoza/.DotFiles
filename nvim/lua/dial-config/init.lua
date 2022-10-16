local augend = require("dial.augend")
require("dial.config").augends:register_group{
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.alias.boolean,
    augend.date.alias["%d/%m/%Y"],
    augend.date.alias["%d-%m-%Y"],
    augend.complex.alias.ja_weekday_full,
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
map("n", "<c-a>", require("dial.map").inc_normal(), {noremap = true})
map("n", "<c-x>", require("dial.map").dec_normal(), {noremap = true})
map("v", "<c-a>", require("dial.map").inc_visual(), {noremap = true})
map("v", "<c-x>", require("dial.map").dec_visual(), {noremap = true})
map("v", "g<C-a>", require("dial.map").inc_gvisual(), {noremap = true})
map("v", "g<C-x>", require("dial.map").dec_gvisual(), {noremap = true})
