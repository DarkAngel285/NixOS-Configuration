{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      indent = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;

    # lspkind = {
    #   enable = true;
    #   cmp = {
    #     enable = true;
    #     menu = {
    #       nvim_lsp = "[LSP]";
    #       nvim_lua = "[api]";
    #       path = "[path]";
    #       luasnip = "[snip]";
    #       buffer = "[buffer]";
    #       neorg = "[neorg]";
    #       cmp_tabby = "[Tabby]";
    #     };
    #   };
    # };

    lsp-format.enable = true;
    lsp-lines.enable = true;
    helm.enable = true;

    lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true;
        nixd.enable = true;
        clangd.enable = true;
      };
    };
  };
}