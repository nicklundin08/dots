{
  config,
  lib,
  pkgs,
  ...
}: {
  # This installs Discord PTB only for the user "alice"
  users.users.nick.packages = with pkgs; [
    discord-ptb
    signal-desktop
  ];
}
