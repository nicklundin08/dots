{config, ...}: {
  home.shellAliases = {
    "stackbuilder.add_vite_app" = ''
      npm create vite@latest src.app -- --template react-ts
    '';
  };
}
