{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    tmux.enable = lib.mkEnableOption "Enables tmux";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      #defaultShell = "bash";
      prefix = "C-t";
      #shell = "${pkgs.bash}/bin/bash";
      terminal = "tmux-256color";
      extraConfig = builtins.readFile ./tmux.conf;
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.sensible;
        }
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = builtins.readFile ./plugins.catppuccin.conf;
        }
      ];
    };

    xdg.configFile."tmuxp/".source = ./xdg-config-tmuxp;
  };
}
