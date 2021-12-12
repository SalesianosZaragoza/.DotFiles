function! myconfig#after() abort
  let g:lsp_log_verbose = 1
  if has("nvim")  
    let g:lsp_log_fie = expand('~/nvim-lsp.log')
    luafile ~/.DotFiles/Spacevim/nvim/init.lua
  endif
  " Required for operations modifying multiple buffers like rename.
  set hidden
endfunction

function! myconfig#before() abort
  let g:tokyonight_style = 'night'
  let g:python3_host_prog = '/usr/bin/python3'
  let g:vimspector_enable_mappings='VISUAL_STUDIO'
  if !has("nvim")
    " disabled plugins
    let g:spacevim_disabled_plugins=[
      \ 'neovim/nvim-lspconfig',
      \ 'nvim-treesitter/nvim-treesitter',
      \ 'nvim-treesitter/playground',
      \ 'nvim-telescope/telescope.nvim',
      \ 'nvim-lua/plenary.nvim',
      \ 'neovim/lsp-config',
      \ 'hrsh7th/cmp-nvim-lsp',
      \ 'hrsh7th/cmp-buffer',
      \ 'hrsh7th/cmp-path',
      \ 'hrsh7th/cmp-cmdline',
      \ 'hrsh7th/nvim-cmp',
      \ 'neoclide/coc.nvim',
      \ 'romgrk/nvim-treesitter-context',
      \ 'chipsenkbeil/distant.nvim',
      \ 'ms-jpq/coq_nvim',
      \ 'github/copilot.vim',
      \ 'plugin/nvim-treesitter.vim'
      \ ]
  endif
  if has("nvim")  
    let g:spacevim_disabled_plugins=[
      \ 'deoplete.nvim',
      \ 'CompleteParameter.vim',
      \ 'vim-which-key'
      \ ]
  endif
endfunction
