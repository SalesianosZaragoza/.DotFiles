-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig.configs'.ls_emmet = {
  default_config = {
    cmd = {'ls_emmet', '--stdio'},
    filetypes = {'html', 'css', 'scss'}, -- Add the languages you use, see language support
    root_dir = function(_)
      return vim.loop.cwd()
    end,
    settings = {}
  }
}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local langservers = {'html', 'eslint','ansiblels','cmake', 'terraform_lsp','vimls', 'intelephense', 'jsonls', 'ccls', 'clangd','pyright', 'cssls', 'tsserver'}


for _, server in ipairs(langservers) do
    require'lspconfig'[server].setup {capabilities = capabilities}
end
require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
require('telescope').load_extension('dap')
require("dapui").setup()
require('dap-python').setup('/bin/python3')