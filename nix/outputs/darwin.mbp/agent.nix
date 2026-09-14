{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.openclaw
    pkgs.ollama
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "openclaw-2026.5.7"
  ];
}
