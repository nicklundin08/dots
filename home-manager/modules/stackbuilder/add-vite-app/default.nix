{config, ...}: {
  home.shellAliases = {
    "stackbuilder.add_vite_app" = ''
      mkdir -p src.app/ || true
      cd src.app/
      npm create vite@latest src.app -- --template react-ts
      cd ..
    '';
  };
}
