require('leap').add_default_mappings()
vim.keymap.set({'n', 'x', 'o'}, '<C-s>', function() require'leap-ast'.leap() end, {})
require('leap-spooky').setup {
  affixes = {
    -- These will generate mappings for all native text objects, like:
    -- ir{obj}, ar{obj}, iR{obj}, aR{obj}, etc.
    -- Special "remote" line objects will also be added, by repeating the
    -- affixes. E.g. `yrr<leap>` will yank a line in the current window.
    window       = 'r',
    cross_window = 'R',
  },
  -- If this option is set to true, the yanked text will automatically be pasted
  -- at the cursor position if the unnamed register is in use.
  yank_paste = false,
  -- Call-specific overrides for the Leap motion itself.
  -- E.g.: opts = { equivalence_classes = {} }
  opts = nil,
}

