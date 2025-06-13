return {
  {
    "peterhoeg/vim-qml",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        sourcekit = {
          cmd = { "xcrun", "sourcekit-lsp" },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          root_dir = require("lspconfig.util").root_pattern("Package.swift", ".git", "*.xcodeproj", "*.xcworkspace"),
          autoformat = false,
        },
      },
      setup = {
        sourcekit = function(_, opts)
          opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
          end
        end,
      },
    },
  },
  { "headlines.nvim", enabled = false },
}
