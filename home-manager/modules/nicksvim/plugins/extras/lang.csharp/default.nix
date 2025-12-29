{pkgs, ...}: {
  home.packages = [
    pkgs.csharpier
    pkgs.omnisharp-roslyn
  ];

  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "omnisharp-extended-lsp";
        src = pkgs.fetchFromGitHub {
          owner = "Hoffs";
          repo = "omnisharp-extended-lsp.nvim";
          rev = "a47388e5417e7f1cfa6962cc441a23c4c5fb2151";
          hash = "sha256-0cRngH9BFuBbEu7007Xqr5zVJSBUowni7jxaMxGwnzU=";
        };
      })
    ];

    plugins = {
      lsp.servers.omnisharp = {
        enable = true;
        filetypes = [
          "cs"
        ];

        settings = {
          # handlers = {
          #        ["textDocument/definition"] = function(...)
          #          return require("omnisharp_extended").handler(...)
          #        end,
          #      },
          #      keys = {
          #        {
          #          "gd",
          #          LazyVim.has("telescope.nvim") and function()
          #            require("omnisharp_extended").telescope_lsp_definitions()
          #          end or function()
          #            require("omnisharp_extended").lsp_definitions()
          #          end,
          #          desc = "Goto Definition",
          #        },
          #      },
          enable_roslyn_analyzers = true;
          organize_imports_on_format = true;
          enable_import_completion = true;
        };
      };

      treesitter = {
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          c_sharp
        ];
      };

      conform-nvim = {
        settings.formatters_by_ft.cs = ["csharpier"];
      };

      neotest = {
        adapters.dotnet = {
          enable = true;
        };
      };
    };
  };
}
