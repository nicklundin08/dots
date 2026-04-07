{
  lib,
  config,
  ...
}: {
  options = {
    bash.enable = lib.mkEnableOption "enables bash and some QOL integration such as FZF/Direnv/etc";
  };

  config = lib.mkIf config.bash.enable {
    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = config.bash.enable;
        nix-direnv.enable = true;
      };

      fzf = {
        enable = true;
        enableBashIntegration = true;
      };
      bash = {
        enable = true;
        enableCompletion = true;
      };

      oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        #useTheme = "atomic";
        settings = builtins.fromJSON (builtins.readFile ./omp.json);
      };
    };
  };
}
