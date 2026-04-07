{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  services.nginx.virtualHosts."10.0.0.134" = {
    locations."/test" = {
      return = "200 '<html><body>Hello from 10.0.0.134!</body></html>'";
      extraConfig = ''
        default_type text/html;
      '';
    };
  };
}
