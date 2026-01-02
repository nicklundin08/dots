{config, ...}: {
  # TODO: I just manually symlinked this for now. Should find a more pure way to do this? IDK...
  #home.file.".config/nicksvim/".source = config.lib.file.mkOutOfStoreSymlink ./lua;
  # look into https://search.nixos.org/options?channel=unstable&show=system.activationScripts&query=system.activation
  home.shellAliases."nicksvim" = "NVIM_APPNAME=nicksvim nvim";
}
