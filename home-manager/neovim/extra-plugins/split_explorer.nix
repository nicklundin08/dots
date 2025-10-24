{pkgs, ...}: {
  programs.nixvim = {
    #############################################
    # NetRW
    #############################################
    # extraPlugins = [
    #   (pkgs.vimUtils.buildVimPlugin {
    #     name = "netrw.nvim";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "prichrd";
    #       repo = "netrw.nvim";
    #       rev = "90501c62b9b816ed3ed1e912ae9db9af5671a1b2";
    #       hash = "sha256-tEO+omzlaC0uFkIHebeqnGtiPbDelRTBJONEnTy0F9U=";
    #     };
    #   })
    # ];

    # extraConfigLua = ''
    #   require("netrw").setup({});

    #   vim.api.nvim_create_autocmd('FileType', {
    #   	pattern = 'netrw',
    #   	desc = 'Remap create file in netrw',
    #   	callback = function()
    #   		vim.keymap.set('n', 'n', '%', { remap = true, buffer = true })
    #   	end
    #   });
    # '';

    # keymaps = [
    #   {
    #     action = ":Ex<CR>";
    #     key = "-";
    #     mode = "n";
    #   }
    # ];

    #############################################
    # Yazi
    #############################################

    # plugins = {
    #   yazi = {
    #     enable = true;
    #     settings.open_for_directories = true;
    #   };
    # };

    # keymaps = [
    #   {
    #     mode = "n";
    #     key = "-";
    #     options.silent = true;
    #     action = "<CMD>Yazi<CR>";
    #   }
    # ];

    #############################################
    # Oil
    #############################################

    plugins = {
      oil = {
        enable = true;
        settings.view_options.show_hidden = true;
        settings.skip_confirm_for_simple_edits = true;
        settings.promt_save_on_select_new_entry = true;
        settings.watch_for_changes = true;
        settings.keymaps = {
          "<C-s>" = false;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        options.silent = true;
        action = "<CMD>Oil<CR>";
      }
    ];
  };
}
