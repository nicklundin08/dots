{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      # initExtra = ''
      #   eval "$(${config.programs.oh-my-posh.package}/bin/oh-my-posh init bash --config ${config.xdg.configHome}/oh-my-posh/config.json)"
      # '';
    };
  };
}
