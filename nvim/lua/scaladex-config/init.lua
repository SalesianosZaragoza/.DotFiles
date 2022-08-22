vim.api.nvim_set_keymap('n', '<leader>pi', [[<cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>]], { noremap = true, silent = true })
