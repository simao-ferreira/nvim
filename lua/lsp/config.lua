local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "cmake",
  "dockerls",
  "groovyls",
  "jsonls",
  "pyright",
  "yamlls",
  "sumneko_lua",
  "zk",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

    if server.name == "jsonls" then
        local lopts = require("lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", lopts, opts)
    end

    if server.name == "pyright" then
        local lopts = require("lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", lopts, opts)
    end

    if server.name == "sumneko_lua" then
        local lopts = require("lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", lopts, opts)
    end

    if server.name == "yamlls" then
        local lopts = require("lsp.settings.yamlls")
        opts = vim.tbl_deep_extend("force", lopts, opts)
    end

	server:setup(opts)
end)
