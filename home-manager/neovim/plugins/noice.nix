{
  programs.nixvim.plugins = {
    noice = {
      enable = true;
      autoLoad = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>sh";
      options.silent = true;
      action = "require('noice').cmd('history')";
    }
  ];

  plugins.which-key.settings = {
    delay = 0;
    spec = [
      # j{
      # j  __unkeyed-1 = "<leader>s";
      # j  group = "[S]earch";
      # j}
      # j{
      # j  __unkeyed-1 = "<leader>t";
      # j  group = "[T]oggle";
      # j}
      # j{
      # j  __unkeyed-1 = "<leader>h";
      # j  group = "Git [H]unk";
      # j  mode = [
      # j    "n"
      # j    "v"
      # j    "o"
      # j    "x"
      # j  ];
      # j}
    ];
  };
}
