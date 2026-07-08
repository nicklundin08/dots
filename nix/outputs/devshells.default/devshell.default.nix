{pkgs, ...}: {
  packages = with pkgs; [
    cowsay
  ];
  shellHook = ''
    echo "Hello from shell hook!"
  '';
}
