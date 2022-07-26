function fif(condition, if_true, if_false)
  if condition then return if_true else return if_false end
end

local lspsaga = require 'lspsaga'
lspsaga.setup {
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = fif(vim.visual_impairing,"Error",""),
  warn_sign =  fif(vim.visual_impairing,"Warn",""),
  hint_sign =  fif(vim.visual_impairing,"Hint",""),
  infor_sign =  fif(vim.visual_impairing,"Info",""),
  diagnostic_header_icon =  fif(vim.visual_impairing,"Bug","   "),
  -- code action title icon
  code_action_icon =  fif(vim.visual_impairing,"Fix"," "),
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
}
