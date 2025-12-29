{pkgs, ...}: {
  home.packages = [
    pkgs.clojure
  ];
  programs.nixvim = {
    # extraPlugins = [
    #   (pkgs.vimUtils.buildVimPlugin {
    #     name = "conjure";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "Olical";
    #       repo = "conjure";
    #       rev = "90e7dbda6b2ba4e00e2876e7a50311e2e0ba51d2";
    #       hash = "sha256-ykJOEZXFrvCaDMdjITSTWXE5SZsZ6VU5KbYogGlpyTQ=";
    #     };
    #   })
    # ];
    plugins = {
      # lsp.servers.vtsls = {
      #   enable = true;
      #   filetypes = [
      #     "javascript"
      #     "javascriptreact"
      #     "javascript.jsx"
      #     "typescript"
      #     "typescriptreact"
      #     "typescript.tsx"
      #   ];
      #
      #   settings = {
      #     complete_function_calls = true;
      #     vtsls = {
      #       enableMoveToFileCodeAction = true;
      #       autoUseWorkspaceTsdk = true;
      #       experimental = {
      #         maxInlayHintLength = 30;
      #         completion = {
      #           enableServerSideFuzzyMatch = true;
      #         };
      #       };
      #     };
      #     typescript = {
      #       updateImportsOnFileMove = {enabled = "always";};
      #       suggest = {
      #         completeFunctionCalls = true;
      #       };
      #       inlayHints = {
      #         enumMemberValues = {enabled = true;};
      #         functionLikeReturnTypes = {enabled = true;};
      #         parameterNames = {enabled = "literals";};
      #         parameterTypes = {enabled = true;};
      #         propertyDeclarationTypes = {enabled = true;};
      #         variableTypes = {enabled = false;};
      #       };
      #     };
      #   };
      # };

      treesitter = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          clojure
        ];
      };

      # neotest = {
      #   adapters.jest = {
      #     enable = true;
      #   };
      # };
      #
      # conform-nvim = {
      #   settings.formatters_by_ft = {
      #     typescriptreact = {
      #       __unkeyed-1 = "prettierd";
      #       __unkeyed-2 = "prettier";
      #       stop_after_first = true;
      #     };
      #     typescript = {
      #       __unkeyed-1 = "prettierd";
      #       __unkeyed-2 = "prettier";
      #       stop_after_first = true;
      #     };
      #     javascriptreact = {
      #       __unkeyed-1 = "prettierd";
      #       __unkeyed-2 = "prettier";
      #       stop_after_first = true;
      #     };
      #     javascript = {
      #       __unkeyed-1 = "prettierd";
      #       __unkeyed-2 = "prettier";
      #       stop_after_first = true;
      #     };
      #   };
      # };
    };
  };
}
