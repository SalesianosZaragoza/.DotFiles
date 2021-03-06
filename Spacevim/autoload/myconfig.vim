function! myconfig#after() abort
  let g:lsp_log_verbose = 1
  let g:lsp_log_file = expand('~/vim-lsp.log')
  lua require'lspconfig'.ccls.setup{}
  lua require'lspconfig'.pyls.setup{}
  lua require'lspconfig'.clangd.setup{}
  lua require'lspconfig'.pyright.setup{}
  " Required for operations modifying multiple buffers like rename.
  set hidden

  let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
      \ 'cpp': ['/usr/bin/clangd'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ }
  let g:LanguageClient_devel = 1 " Use rust debug build
  let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
  " note that if you are using Plug mapping you should not use `noremap` mappings.
  nmap <F5> <Plug>(lcn-menu)
  " Or map each action separately
  nmap <silent>K <Plug>(lcn-hover)
  nmap <silent> gd <Plug>(lcn-definition)
  nmap <silent> <F2> <Plug>(lcn-rename)
endfunction

function! myconfig#before() abort
  if !has("nvim")
    " disabled plugins
    let g:spacevim_disabled_plugins=[
      \ 'neovim/nvim-lspconfig',
      \ 'nvim-treesitter/nvim-treesitter'
      \ ]
  endif
endfunction
