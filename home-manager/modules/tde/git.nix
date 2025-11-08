{
  programs = {
    git = {
      userName = "Nick Lundin";
      #userEmail = extraSpecialEmail;
      enable = true;
      extraConfig = {
        core.editor = "nvim";
        github.user = "nicklundin08";
        mergetool.prompt = false;
        pull.rebase = false;
        init.defaultBranch = "main";
      };
    };

    gh = {
      enable = true;

      settings = {
        git_protocol = "ssh";
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          theme = {
            activeBorderColor = [
              "blue"
              "bold"
            ];
            selectedLineBgColor = ["white"];
          };
        };
        git = {
          # Improves performance
          # https://github.com/jesseduffield/lazygit/issues/2875#issuecomment-1665376437
          log.order = "default";

          fetchAll = false;
        };
        customCommands = [
          {
            key = "<C-space>";
            context = "global";
            command = "pre-commit";
            description = "Runs pre-commit";
          }
        ];
      };
    };
  };

  home.shellAliases = {
    lg = "lazygit";
    # gfu = "git fetch upstream";
    # gfo = "git fetch origin";
    # gpc = "gh pr checkout";
    # glg = "git log --graph --abbrev-commit --decorate --date=relative --all";
    # gst = "git status";
    # gcm = "git commit -m";
    # gcmf = "git commit --amend --no-edit";
    # gpsup = "git push upstream";
    # gadd = "git add .";
    # gp = "git push";
  };
}
