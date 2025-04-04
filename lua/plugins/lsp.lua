return {
  {
    "peterhoeg/vim-qml",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
          end
          return false
        end,
      },
      autoformat = false,
      servers = {
        clangd = {
          cmd = { "clangd" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h" },
        },
      },
    },
  },
  { "headlines.nvim", enabled = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- trueにすると二重表示の可能性あり
      },
    },
  },
}
