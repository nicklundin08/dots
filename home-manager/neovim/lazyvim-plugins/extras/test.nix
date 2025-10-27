{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim.plugins.neotest.enable = true;
  programs.nixvim.keymaps = [
    # keys = {
    #   {"<leader>t", "", desc = "+test"},
    #   { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to Test (Neotest)" },
    #   { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
    #   { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files (Neotest)" },
    #   { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest (Neotest)" },
    #   { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last (Neotest)" },
    #   { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
    #   { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
    #   { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
    #   { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop (Neotest)" },
    #   { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch (Neotest)" },
    # },
    {
      key = "<leader>tt";
      mode = "n";
      action = lib.generators.mkLuaInline "function() require('neotest').run.run(vim.fn.expand('%')) end";
      options.desc = "Test file";
    }
    {
      key = "<leader>tr";
      mode = "n";
      action = lib.generators.mkLuaInline "function() require('neotest').run.run() end";
      options.desc = "Test nearest";
    }
    {
      key = "<leader>tT";
      mode = "n";
      action = lib.generators.mkLuaInline "function() require('neotest').run.run(vim.uv.cwd()) end";
      options.desc = "Test all";
    }
    {
      key = "<leader>ts";
      mode = "n";
      action = lib.generators.mkLuaInline "function() require('neotest').summary.toggle() end";
      options.desc = "Test summary";
    }
    {
      key = "<leader>to";
      mode = "n";
      action = lib.generators.mkLuaInline "function() require('neotest').output.open({ enter = true, auto_close = true }) end";
      options.desc = "Show output";
    }
    {
      key = "<leader>tO";
      mode = "n";
      action = lib.generators.mkLuaInline "function() require('neotest').output_panel.toggle() end";
      options.desc = "Toggle output";
    }
  ];
}
