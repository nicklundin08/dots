# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  nicksvim = import ./nicksvim;
  tmux = import ./tmux;
  stackbuilder = import ./stackbuilder;
  bundle-dev = import ./bundle-dev;
}
