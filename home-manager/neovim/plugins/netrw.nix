{pkgs, ...}: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "netrw.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "prichrd";
        repo = "netrw.nvim";
        rev = "90501c62b9b816ed3ed1e912ae9db9af5671a1b2";
        hash = "sha256-tEO+omzlaC0uFkIHebeqnGtiPbDelRTBJONEnTy0F9U=";
      };
    })
  ];

  programs.nixvim.extraConfigLua = ''
         require("netrw").setup({})

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'netrw',
      desc = 'Remap create file in netrw',
      callback = function()
        vim.keymap.set('n', 'n', '%', { remap = true, buffer = true })
      end,
    })
  '';
}
