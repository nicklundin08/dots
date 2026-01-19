{lib, ...}: let
  LUA_DIR = "~/dots/home-manager/modules/nicksvim/lua";
in {
  home.activation = {
    symlinkNvimDots = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo linking ${LUA_DIR}
      run ln -sfn ${LUA_DIR} ~/.config/nicksvim
    '';
  };

  home.shellAliases = {
    "nv" = "NVIM_APPNAME=nicksvim nvim";

    "nv.add_plugin" = ''
           echo "> Please enter the REPO_URL"
           read REPO_URL

           # e.g. https://github.com/folke/which-key.nvim
           REGEX=".*\.com\/([^\/]+)\/(.*)"
      VENDOR=""
      NAME=""
           if [[ "$REPO_URL" =~ $REGEX ]]; then
          VENDOR=''${BASH_REMATCH[1]}
          NAME=''${BASH_REMATCH[2]}
          echo "    VENDOR: $VENDOR"
          echo "    NAME: $NAME"
           else
                 echo "Unable to parse repo"
          exit 1
           fi

           echo "> Is the plugin start (y) or opt (n)?"
           read LOAD_STRATEGY

           if [[ "$LOAD_STRATEGY" != "y" ]]; then
             LOAD_STRATEGY="opt"
           else
             LOAD_STRATEGY="start"
           fi

           SUBMODULE_PATH="${LUA_DIR}/lua/pack/$VENDOR/$LOAD_STRATEGY/$NAME"
           echo "git submodule add $REPO_URL $SUBMODULE_PATH"
           git submodule add $REPO_URL $SUBMODULE_PATH
    '';
  };
}
