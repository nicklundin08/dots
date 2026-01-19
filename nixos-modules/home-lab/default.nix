{lib, ...}: {
  imports = [
    ./plex
    ./ssh
  ];

  # Custom options
  # plex.enable = lib.mkDefault true;
  # ssh.enable = lib.mkDefault true;
}
