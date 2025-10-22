{
  programs.nixvim.plugins = {
    yazi = {
      enable = true;
      settings.open_for_directories = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "-";
      options.silent = true;
      action = "<CMD>Yazi<CR>";
    }
  ];
}
