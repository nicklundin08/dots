{
  inputs,
  secrets,
  ...
}: {
  imports = [
    inputs.sopswarden.nixosModules.sopswarden
  ];
  services.sopswarden = {
    enable = true;

    secrets = {
      # test-secret = "test_secret";
    };
  };
  # environment.sessionVariables = {
  #   TEST_VAR = secrets.test-secret;
  # };
}
