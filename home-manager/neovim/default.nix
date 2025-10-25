{inputs, ...}: {
  # Import all your configuration modules here
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./lazyvim-plugins
    ./extra-plugins
  ];

  home.file.".config/nvim/lua/customlua".source = ./customlua;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    viAlias = true;
    vimAlias = true;
  };
}
