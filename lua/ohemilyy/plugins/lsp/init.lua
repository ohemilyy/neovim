local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("ohemilyy.plugins.lsp.configs")
require("ohemilyy.plugins.lsp.handlers").setup()
require("ohemilyy.plugins.lsp.null-ls")