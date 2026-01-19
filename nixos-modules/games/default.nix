{lib, ...}: {
  imports = [
    ./steam
  ];

  # Custom options
  steam.enable = lib.mkDefault true;
}
