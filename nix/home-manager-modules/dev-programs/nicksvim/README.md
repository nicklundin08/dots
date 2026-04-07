# Nicksvim (nixvim?)

A lazyvim inspired neovim setup

:warning: this is a work in progress :warning:

Much of the lazyvim functionality is not yet implemented.

Its being iterated on

# Notable changes

- Oil instead of a file tree

# Try it yourself!

Test drive
```
home-manager switch --flake github:nicklundin08/dots#nick@MSI

```

Import it into your flake (depends on your flake structure)


```
# flake.nix
# IDK probably somewhere near the top


inputs = {
    # Some stuff
    nicksdots.url = "github:nicklundin08/dots";
    nicksdots.inputs.nixpkgs.follows = "nixpkgs";
    # Some other stuff
};

```
```
# flake.nix
# IDK probably somewhere in the middle

outputs = {
 self,
 nixpkgs,
 home-manager,
 nicksdots,              ### Add this!!
 ...
};
```
```
# home.nix (or similar)

{outputs, ...}:{
  imports = [
    # Choose which module you want to import
    outputs.nicksdots.homeManagerModules.nicksvim
    outputs.nicksdots.homeManagerModules.tmux

    # Bundle dev is a combination of nickvim + tmux + some other packages
    outputs.nicksdots.homeManagerModules.bundle-dev
  ];
}
```
