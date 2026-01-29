{pkgs, ...}: {
  home.packages = [
    pkgs.gopls
    pkgs.go
    pkgs.gofumpt
    pkgs.gotestfmt
  ];
  programs.nixvim = {
    plugins = {
      lsp.servers.gopls = {
        enable = true;
        filetypes = [
          "go"
        ];

        # settings = {
        #   complete_function_calls = true;
        #   vtsls = {
        #     enableMoveToFileCodeAction = true;
        #     autoUseWorkspaceTsdk = true;
        #     experimental = {
        #       maxInlayHintLength = 30;
        #       completion = {
        #         enableServerSideFuzzyMatch = true;
        #       };
        #     };
        #   };
        #   typescript = {
        #     updateImportsOnFileMove = {enabled = "always";};
        #     suggest = {
        #       completeFunctionCalls = true;
        #     };
        #     inlayHints = {
        #       enumMemberValues = {enabled = true;};
        #       functionLikeReturnTypes = {enabled = true;};
        #       parameterNames = {enabled = "literals";};
        #       parameterTypes = {enabled = true;};
        #       propertyDeclarationTypes = {enabled = true;};
        #       variableTypes = {enabled = false;};
        #     };
        #   };
        # };
      };

      treesitter = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          go
          gomod
          gowork
          gosum
        ];
      };

      # neotest = {
      #   adapters.jest = {
      #     enable = true;
      #   };
      # };

      conform-nvim = {
        settings.formatters_by_ft = {
          go = {
            __unkeyed-1 = "goimports";
            __unkeyed-2 = "gofumpt";
            stop_after_first = true;
          };
        };
      };
    };
  };
}
