local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local lspconfig = require "lspconfig"

local servers = {
  solargraph = {},
  tsserver = {}
}

local servers_default_config = {
  on_attach = on_attach,
  capabilities = capabilities
}

for server_name, server_config in pairs(servers) do
  local final_config = vim.tbl_deep_extend("force", servers_default_config, server_config)
  lspconfig[server_name].setup(final_config)
end

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = "always",
  },
  severity_sort = true
})
