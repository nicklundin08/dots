{
  description = "Homelab";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # unstable Nixpkgs

  outputs = {self, ...} @ inputs: let
    javaVersion = 21; # Change this value to update the whole stack
    inherit (inputs.nixpkgs) lib;
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
    ];

    forEachSupportedSystem = f:
      lib.genAttrs supportedSystems (
        system:
          f {
            inherit system;
            pkgs = import inputs.nixpkgs {inherit system;};
          }
      );
    # supportedSystems = [
    #   "x86_64-linux"
    #   "aarch64-linux"
    #   "aarch64-darwin"
    # ];
    #
    # forEachSupportedSystem = f:
    #   lib.genAttrs supportedSystems (
    #     system:
    #       f {
    #         inherit system;
    #         pkgs = import inputs.nixpkgs {inherit system;};
    #       }
    #   );
  in {
    overlays.default = final: prev: let
      jdk = prev."jdk${toString javaVersion}";
      nodejs = prev.nodejs;
      yarn = prev.yarn.override {inherit nodejs;};
    in {
      inherit jdk;
      maven = prev.maven.override {jdk_headless = jdk;};
      gradle = prev.gradle.override {java = jdk;};
      lombok = prev.lombok.override {inherit jdk;};
    };
    devShells = forEachSupportedSystem (
      {
        pkgs,
        system,
      }: let
        #
      in {
        default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            # Java
            jdt-language-server
            jdk
            lombok
            gradle

            # Node/TS/etc
            nodejs
            pnpm
            yarn

            # CLIs
            redocly
            openapi-changes
            openapi-generator-cli
            plantuml
            tbls

            # Tools
            postgresql
            liquibase
          ];
          shellHook = let
            LOMBOK_PATH = "${pkgs.lombok}/share/java/lombok.jar";
            JDTLS_PATH = "${pkgs.jdt-language-server}";
          in ''
            export LOMBOK_PATH="${LOMBOK_PATH}"
            export JDTLS_PATH="${JDTLS_PATH}"
          '';
        };
      }
    );
  };
}
