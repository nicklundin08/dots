{pkgs, ...}: {
  home.packages = [pkgs.vtsls];
  programs.nixvim = {
    plugins.lsp.servers.vtsls = {
      enable = true;
      config = {
        cmd = [
          "clangd"
          "--background-index"
        ];
        filetypes = [
          "javascript"
          "javascriptreact"
          "javascript.jsx"
          "typescript"
          "typescriptreact"
          "typescript.tsx"
        ];
        root_markers = [
          "compile_commands.json"
          "compile_flags.txt"
        ];
      };
    };
  };
}
