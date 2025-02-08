{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
    #defaultShell = "bash";
    prefix = "C-t";
    #shell = "${pkgs.bash}/bin/bash";
    terminal = "tmux-256color";
    extraConfig = ''
      set -g mouse on
      set -gu default-command
      set -g default-shell ~/.nix-profile/bin/bash
      set -ag terminal-overrides ",xterm-256color:Tc"
      #set -g default-terminal "screen-256color"
      set-option -g status-position top

      set -g status-style "bg=default"
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""

      ## Popup stuff
      # https://willhbr.net/2023/02/07/dismissable-popup-shell-in-tmux/
      unbind-key p
      bind-key p display-popup -E -h 90% -w 90% show-tmux-popup.sh
      bind-key g display-popup -E -h 90% -w 90% 'lazygit'
      bind-key -T popup M-q detach

      #This lets us do scrollback and search within the popup
      bind-key  -T popup C-[ copy-mode


      bind-key -n M-h select-pane -L
      bind-key -n M-j select-pane -D
      bind-key -n M-k select-pane -U
      bind-key -n M-l select-pane -R
      bind-key -n M-p previous-window
      bind-key -n M-n next-window

      bind-key x kill-pane
    '';
    plugins = with pkgs; [
      ## More here
      {
        plugin = tmuxPlugins.sensible;
        extraConfig = ''
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          #set -g @catppuccin_window_status_style "rounded"
          #set -g @catppuccin_current_window_status_style "rounded"

          # set -g @catppuccin_window_status_style "basic"
          # set -g @catppuccin_current_window_status_style "basic"
          # set -g @ctp_bg "#24273a"
          # set -g @ctp_surface_1 "#494d64"
          # set -g @ctp_fg "#cad3f5"
          # set -g @ctp_mauve "#c6a0f6"
          # set -g @ctp_crust "#181926"
          # set -g @catppuccin_window_right_separator " "
          # set -g @catppuccin_window_middle_separator " █"

          # set -g @catppuccin_window_number_position "right"
          # set -g @catppuccin_window_default_fill "number"
          # set -g @catppuccin_window_default_text "#W"

          #set -g @catppuccin_status_left_separator  " "
          #set -g @catppuccin_status_right_separator ""
          #set -g @catppuccin_status_fill "icon"
          #set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_window_text "#W"

          set -g status-right "#{E:@catppuccin_status_directory}"
          set -agF status-right "#{E:@catppuccin_status_user}"
          set -ag status-right "#{E:@catppuccin_status_host}"
          set -ag status-right "#{E:@catppuccin_status_session}"

          # set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
    ];
  };
}
