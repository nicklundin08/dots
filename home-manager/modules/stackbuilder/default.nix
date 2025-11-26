{pkgs, ...}: {
  imports = [
    ./add-docs
    ./add-git
    ./add-java-server
  ];
}
