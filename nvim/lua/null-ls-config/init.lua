local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
        formatting.prettier, formatting.gofmt, formatting.shfmt,
    formatting.clang_format, formatting.cmake_format, formatting.dart_format, formatting.google_java_format,
    formatting.isort, formatting.codespell.with({ filetypes = { 'markdown' } })
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end
})
