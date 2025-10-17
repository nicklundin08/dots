{pkgs, ...}: {
  # https://nix-community.github.io/nixvim/plugins/lsp/servers/jdtls/index.html
  # Not this plugin but helpful
  # https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations
  programs.nixvim.plugins.lsp.servers.jdtls = {
    enable = true;
    # Optional: Configure JDTLS specific settings
    # For example, custom VM arguments or workspace directory
    extraOptions = {
      cmd = [
        os.getenv('JDTLS_PATH') # "${pkgs.jdtls}/bin/jdtls"
        os.getenv('JDTLS_LOMBOK_ARGS')
      ];
      # settings = {
      #   java = {
      #     # Example Java settings
      #     configuration = {
      #       updateBuildConfiguration = "interactive";
      #     };
      #   };
      # };
    };
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
