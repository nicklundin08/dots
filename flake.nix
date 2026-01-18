{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    xremap.url = "github:xremap/nix-flake";
    xremap.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      #"aarch64-linux"
      #"i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      #"x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;

    # Helper function to transform an array of attr sets into a single attr set
    reduceAttrsList = builtins.foldl' (a: b: a // b) {};

    # Helper function that makes a home manager hosts from the toml entry
    mkHomeHost = host: {
      ${host.name} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${host.system};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [(./. + builtins.toPath host.module)];
      };
    };

    mkNixosHost = host: {
      ${host.name} = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [(./. + builtins.toPath host.module)];
      };
    };

    homeHosts = (builtins.fromTOML (builtins.readFile ./home-manager/hosts.toml)).hosts;
    nixosHosts = (builtins.fromTOML (builtins.readFile ./nixos/hosts.toml)).hosts;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    # Reusable nixos/homemanager modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./nixos/modules;
    homeModules = import ./home-manager/modules;

    # Final configuration
    homeConfigurations = reduceAttrsList (builtins.map mkHomeHost homeHosts);
    nixosConfigurations = reduceAttrsList (builtins.map mkNixosHost nixosHosts);
  };
}
