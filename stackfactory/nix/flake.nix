{
  description = "A Nix-flake-based Java development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  outputs = {
    self,
    nixpkgs,
  }: let
    javaVersion = 23; # Change this value to update the whole stack

    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {
            inherit system;
            overlays = [self.overlays.default];
          };
        });
  in {
    overlays.default = final: prev: let
      jdk = prev."jdk${toString javaVersion}";
    in {
      inherit jdk;
      maven = prev.maven.override {jdk_headless = jdk;};
      gradle = prev.gradle.override {java = jdk;};
      lombok = prev.lombok.override {inherit jdk;};
    };

    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          plantuml
          postgresql
          liquibase
          tbls
          rlwrap
          gcc
          gradle
          jdk
          lombok
          jdt-language-server
          maven
          ncurses
          patchelf
          zlib
          openapi-changes
          openapi-generator-cli
          spring-boot-cli
          redocly
          nodePackages.prettier
          vtsls
        ];

        shellHook = let
          LOMBOK_PATH = "${pkgs.lombok}/share/java/lombok.jar";
          JDTLS_PATH = "${pkgs.jdt-language-server}";
        in ''
          export LOMBOK_PATH="${LOMBOK_PATH}"
          export JDTLS_PATH="${JDTLS_PATH}"
        '';
      };
    });
  };
}
