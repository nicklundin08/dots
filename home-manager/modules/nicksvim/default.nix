{lib, ...}: let
  SYMLINK_TARGET = "~/dots/home-manager/modules/nicksvim/lua";
in {
  home.shellAliases."nicksvim" = "NVIM_APPNAME=nicksvim nvim";
  home.activation = {
    symlinkNvimDots = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo linking ${SYMLINK_TARGET}
      run ln -sfn ${SYMLINK_TARGET} ~/.config/nicksvim
    '';
  };
}
