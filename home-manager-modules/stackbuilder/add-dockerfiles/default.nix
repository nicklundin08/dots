{config, ...}: {
  home.shellAliases = {
    "stackbuilder.add_dockerfiles" = ''
      mkdir -p docker.Dockerfiles/ || true

      cd docker.Dockerfiles/

      echo "FROM SCRATCH" > scratch.Dockerfile

      cd ..
    '';
  };
}
