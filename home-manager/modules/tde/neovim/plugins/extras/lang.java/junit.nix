let
  vimDataPath = ".local/share/nvim";
  version = "1.10.1";
  file = "junit-platform-console-standalone-${version}.jar";
  myFile = builtins.fetchurl {
    url = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/${version}/${file}";
    sha256 = "sha256:0pvj435x95kfpii44pzrv8v9xbm6483ji2zvnmyx2xims59slbml";
  };
in
{
  home.file."${vimDataPath}/neotest-java/${file}".source = myFile;
}
