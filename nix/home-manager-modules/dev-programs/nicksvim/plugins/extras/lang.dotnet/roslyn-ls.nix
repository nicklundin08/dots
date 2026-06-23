{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  doCheck = false;
  pname = "roslyn-nvim";
  name = "roslyn-nvim";
  src = pkgs.fetchFromGitHub {
    owner = "seblyng";
    repo = "roslyn.nvim";
    rev = "main";
    hash = "sha256-e0PNOBtjRcsCkbaJn2K2o7Tr1dSte0tOK1jQMWJ2XQ4=";
  };
}
