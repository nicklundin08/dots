{
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.yamlfmt
  ];
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        yaml = ["yamlfmt"];
        # Conform will run multiple formatters sequentially
        # python = ["isort" "black"];
        # # Use stop_after_first to run only the first available formatter
        # javascript = {
        #   __unkeyed-1 = "prettierd";
        #   __unkeyed-2 = "prettier";
        #   stop_after_first = true;
        # };
        # Use the "*" filetype to run formatters on all filetypes.
        "*" = ["codespell"];
        # Use the "_" filetype to run formatters on filetypes that don't
        # have other formatters configured.
        "_" = ["trim_whitespace"];
      };
    };
  };
  programs.nixvim.keymaps = [
    {
      key = "<leader>cf";
      #action = lib.generators.mkLuaInline "function() require('conform').format({ formatters = { 'injected' }, timeout_ms = 3000 }) end";
      action = lib.generators.mkLuaInline "function() require('conform').format() end";
      mode = "n";
      options.desc = "format";
    }
  ];
}
