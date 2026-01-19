{pkgs, ...}: {
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

  xdg.configFile."tmuxp/default.yaml".source = ./tmuxp.default.yaml;

  home.shellAliases = {
    "tux.dots" = "TUX_SESSION_NAME=dots TUX_START_DIR=~/dots tmuxp load default";
  };
}
