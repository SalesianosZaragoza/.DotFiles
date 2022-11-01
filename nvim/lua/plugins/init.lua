require 'packer.luarocks'.install_commands()
local vscode = vim.g.vscode == 1
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'mg979/vim-visual-multi'
  use 'skywind3000/asyncrun.vim'
  use 'wbthomason/packer.nvim'
  use {
    'lewis6991/impatient.nvim',
    config = 'require("impatient")'
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = 'require("treesitter-config")',
    disable = vscode
  }
  use {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  }
  use {
    'tamton-aquib/staline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  use { "LinArcX/telescope-command-palette.nvim" }
  use({
    'nat-418/telescope-color-names.nvim',
    config = function()
      require('telescope').load_extension('color_names')
    end
  })
  use({
    "neanias/telescope-lines.nvim",
    requires = "nvim-telescope/telescope.nvim",
  })
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    after = "nvim-treesitter"
  }
  use {
    'p00f/nvim-ts-rainbow',
    after = "nvim-treesitter"
  }
  use {
    'windwp/nvim-autopairs',
    config = "require('autopairs-config')",
    after = "nvim-cmp"
  }
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = "require('whichkey-config')",
    disable = vscode
  }
  use 'nvim-telescope/telescope.nvim'
  use 'LinArcX/telescope-env.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'folke/lua-dev.nvim'
  use 'folke/trouble.nvim'
  use 'monaqa/dial.nvim'
  use 'ggandor/leap.nvim'
  use 'ggandor/leap-ast.nvim'
  use 'ggandor/leap-spooky.nvim'
  use 'cwebster2/github-coauthors.nvim'
  use({
    "folke/noice.nvim",
    event = "VimEnter",
    config = "require('noice-config')",
    requires = { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", "hrsh7th/nvim-cmp" },
    disable = vscode
  })
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'lukas-reineke/cmp-rg'
  use 'hrsh7th/vim-vsnip-integ'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'
  use {
    'tanvirtin/vgit.nvim',
    config = "require('vgit').setup()",
    disable = vscode
  }
  use 'echasnovski/mini.nvim'
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
    disable = vscode
  }
  use 'glepnir/dashboard-nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    config = "require('toggleterm-config')",
    disable = vscode
  }
  use {
    'numToStr/Comment.nvim',
    config = "require('Comment')"
  }
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'williamboman/nvim-lsp-installer'
  use {
    'glepnir/lspsaga.nvim',
    branch = "main"
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
    'folke/zen-mode.nvim',
    config = 'require("zen-mode-config")',
    disable = vscode
  }
  use {
    'folke/twilight.nvim',
    config = 'require("twilight-config")',
    disable = vscode
  }
  use {
    'beauwilliams/focus.nvim',
    config = function()
      require("focus").setup()
    end,
    disable = vscode
  }
  use 'szw/vim-maximizer'
  use 'lambdalisue/suda.vim'
  use 'puremourning/vimspector'
  use 'Shougo/vimproc.vim'
  use 'hashivim/vim-terraform'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-treesitter/playground'
  use 'kyazdani42/nvim-web-devicons'
  use 'scalameta/nvim-metals'
  use 'sudormrfbin/cheatsheet.nvim'
  use 'romgrk/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'github/copilot.vim'
  use {
    'tzachar/cmp-tabnine',
    run = './install.sh'
  }
  use 'ray-x/cmp-treesitter'
  use 'crispgm/telescope-heading.nvim'
  use 'nvim-telescope/telescope-packer.nvim'
  use 'nvim-telescope/telescope-vimspector.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'axieax/urlview.nvim'
  use 'mfussenegger/nvim-lint'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'rcarriga/nvim-notify'
  use 'jayp0521/mason-nvim-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'ravenxrz/DAPInstall.nvim'
  use 'mbbill/undotree'
  use 'voldikss/vim-translator'
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'chipsenkbeil/distant.nvim'
  use 'ms-jpq/coq_nvim'
  use 'mfussenegger/nvim-dap-python'
  use 'mfussenegger/nvim-jdtls'
  use 'nvim-telescope/telescope-media-files.nvim'
  use {
    'nvim-telescope/telescope-z.nvim',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-telescope/telescope.nvim' } }
  }
  use 'softinio/scaladex.nvim'
  use 'onsails/lspkind-nvim'
  use 'WhoIsSethDaniel/mason-tool-installer.nvim'
  use 'rafamadriz/friendly-snippets'
  use 'kitagry/vs-snippets'
  use 'petertriho/cmp-git'
  use 'TC72/telescope-tele-tabby.nvim'
  use 'tjdevries/complextras.nvim'
  use 'folke/tokyonight.nvim'
  use { 'nvim-lualine/lualine.nvim', disable = vscode }
  use 'unblevable/quick-scope'
  use 'tamago324/telescope-openbrowser.nvim'
  use 'tyru/open-browser.vim'
  use 'camgraff/telescope-tmux.nvim'
  use 'norcalli/nvim-terminal.lua'
  use 'danielpieper/telescope-tmuxinator.nvim'
  use 'ThePrimeagen/refactoring.nvim'
  use 'fcying/telescope-ctags-outline.nvim'
  use 'jvgrootveld/telescope-zoxide'
  use 'dhruvmanila/telescope-bookmarks.nvim'
  use 'nvim-telescope/telescope-github.nvim'
  use 'cljoly/telescope-repo.nvim'
  use 'LinArcX/telescope-changes.nvim'
  use({
    "echasnovski/mini.surround",
    branch = 'stable'
})
  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup()
    end,
    disable = vscode
  }
  use 'L3MON4D3/LuaSnip'
  use 'kristijanhusak/vim-carbon-now-sh'
  use 'pwntester/octo.nvim'
  use 'liuchengxu/vim-clap'
  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require("lsp_lines").setup()
    end,
    disable = vscode
  }
  use 'sam4llis/nvim-lua-gf'
  use {
    'anuvyklack/windows.nvim',
    requires = { 'anuvyklack/middleclass', 'anuvyklack/animation.nvim' },
    config = function()
      vim.o.winwidth = 20
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end,
    disable = vscode
  }
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    disable = vscode,
    cond = function()
      return vim.g.vscode ~= nil
    end
  }
  -- Auto docstring generator
  use({
    'danymat/neogen',
    config = function()
      require('neogen').setup {}
    end,
    disable = vscode
  })
end)
