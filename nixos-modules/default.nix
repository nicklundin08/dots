# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  ssh = import ./ssh;
  gaming = import ./gaming;
  media-server = import ./media-server;
  desktop-apps = import ./desktop-app;
}
