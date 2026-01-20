{lib, ...}: {
  imports = [
    ./steam
    ./sunshine
  ];

  # Custom options
  steam.enable = lib.mkDefault true;
}
