{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wine
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
        wineWowPackages.full
      ];
    })
  ];
}
