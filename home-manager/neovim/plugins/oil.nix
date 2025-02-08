{
  programs.nixvim.plugins = {
    oil = {
      enable = true;
      settings.view_options.show_hidden = true;
      settings.skip_confirm_for_simple_edits = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "-";
      options.silent = true;
      action = "<CMD>Oil<CR>";
    }
  ];
}
