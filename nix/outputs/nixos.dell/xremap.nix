{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.xremap.nixosModules.default
  ];
  services.xremap = {
    enable = true;
    /*
    NOTE: since this sample configuration does not have any DE, xremap needs to be started manually by systemctl --user start xremap
    */
    serviceMode = "user";
    userName = "nick";
  };
  # Modmap for single key rebinds
  services.xremap.config.modmap = [
    {
      name = "Global";
      remap = {"CapsLock" = "Ctrl_R";};
    }
  ];
}
