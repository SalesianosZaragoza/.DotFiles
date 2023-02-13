-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'rust_analyzer' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}
-- Turn on lsp status information
require('fidget').setup()
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp = require('lsp-zero')
lsp.preset('recommended')
-- See :help lsp-zero-preferences
lsp.set_preferences({
  set_lsp_keymaps = false, -- set to false if you want to configure your own keybindings
  manage_nvim_cmp = false, -- set to false if you want to configure nvim-cmp on your own

})

lsp.ensure_installed(servers);
-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  })

-- local lsp_installer = require('nvim-lsp-installer')
--[[
lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
                                                                    .make_client_capabilities())
  local opts = {capabilities = capabilities}
  if server.name == "sumneko_lua" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        Lua = {
          runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
          diagnostics = {globals = {'vim'}},
          workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
          telemetry = {enable = false}
        }
      }

    }, opts)
  end
  server:setup(opts)
end)]]
