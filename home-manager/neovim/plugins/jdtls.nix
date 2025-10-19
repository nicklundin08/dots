{pkgs, ...}: {
    # pkgs.lombok
  # https://nix-community.github.io/nixvim/plugins/lsp/servers/jdtls/index.html
  # Not this plugin but helpful
  # https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations
  programs.nixvim.plugins.lsp.servers.jdtls = {
    enable = true;
    # extraOptions = {
    #   cmd = [
    #     "${pkgs.jdtls}/bin/jdtls"
    #     "-configuration"
    #     "${pkgs.jdtls.ls_data_dir}/config_linux" # Or appropriate for your OS
    #     "-data"
    #     "/path/to/your/java/workspace/.lsp_workspace" # Customize your workspace data directory
    #   ];
    #   settings = {
    #     java = {
    #       # Example Java settings
    #       configuration = {
    #         updateBuildConfiguration = "interactive";
    #       };
    #     };
    #   };
    # };
  };
}
