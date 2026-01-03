{
  lib,
  config,
  ...
}: let
  SYMLINK_TARGET = "~/dots/home-manager/modules/nicksvim/lua";
in {
  # TODO: I just manually symlinked this for now. Should find a more pure way to do this? IDK...
  #home.file.".config/nicksvim/".source = config.lib.file.mkOutOfStoreSymlink ./lua;
  # look into https://search.nixos.org/options?channel=unstable&show=system.activationScripts&query=system.activation
  home.shellAliases."nicksvim" = "NVIM_APPNAME=nicksvim nvim";
  home.activation = {
    symlinkNvimDots = lib.hm.dag.entryAfter ["writeBoundary"] ''
             echo linking ${SYMLINK_TARGET}
      run ln -sfn ${SYMLINK_TARGET} ~/.config/nicksvim
    '';
  };
}
