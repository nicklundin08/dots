{
  programs = {
    oh-my-posh = {
      enable = true;
      enableBashIntegration = true;
      #useTheme = "atomic";
      settings = builtins.fromJSON (builtins.readFile ./omp.json);
    };
  };
}
