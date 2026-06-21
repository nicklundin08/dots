{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  doCheck = false;
  pname = "neotest-vstest";
  version = "8588c3c988c7ed49879dddf937b42681cfa7ce30";
  src = pkgs.fetchFromGitHub {
    owner = "Nsidorenco";
    repo = "neotest-vstest";
    rev = "8588c3c988c7ed49879dddf937b42681cfa7ce30";
    hash = "sha256-Bqs3yK5OGkOJUv7lJKpUPyIH74x3SudflEIEbWb8i0o=";
  };
}
