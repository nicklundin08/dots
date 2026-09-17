{pkgs, ...}: {
  ############################################################
  # Global settings
  ############################################################
  # System settings -> keyboard -> shortcuts -> modifier keys
  # caps -> cmd
  # control -> caps
  # option -> ctrl
  # cmd -> option

  ############################################################
  # Iterm2 settings
  ############################################################
  # Settings -> profiles -> keys ->
  # left/right option key -> dropdown -> escape+

  # Settings -> Keys -> Remap modifiers
  # Left/right control -> cmd
  # Left/right cmd -> control

  home.packages = with pkgs; [iterm2];
}
