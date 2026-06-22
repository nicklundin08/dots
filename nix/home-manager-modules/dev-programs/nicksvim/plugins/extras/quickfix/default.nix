{...}: {
  programs.nixvim = {
    extraFiles = {
      "after/ftplugin/qf.lua".source = ./qf.lua;
    };

    keymaps = [
      #####################################
      # Quickfix
      #####################################
      {
        key = "<leader>qe";
        action = "<cmd>lua vim.diagnostic.setqflist({severity = vim.diagnostic.severity.ERROR})<CR>";
        mode = "n";
        options.desc = "[Q]heck [e]rrors";
      }
    ];
  };
}
