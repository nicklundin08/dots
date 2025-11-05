{pkgs, ...}: {
  home.packages = [pkgs.vtsls];
  programs.nixvim = {
    plugins = {
      lsp.servers.vtsls = {
        enable = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "javascript.jsx"
          "typescript"
          "typescriptreact"
          "typescript.tsx"
        ];
      };

      treesitter = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          javascript
          jsdoc
          json
          jsonc
          tsx
          typescript
        ];
      };
    };
  };
}
