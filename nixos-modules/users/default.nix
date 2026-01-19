{lib, ...}: {
  imports = [
    ./nick
  ];

  nick.enable = lib.mkDefault true;
}
