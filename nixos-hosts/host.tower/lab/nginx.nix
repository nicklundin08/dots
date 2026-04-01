{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [80 443 3000];

  services.nginx = {
    enable = true;
    virtualHosts."10.0.0.134" = {
      locations."/test" = {
        return = "200 '<html><body>It works!!</body></html>'";
        extraConfig = ''
          default_type text/html;
        '';
      };
      forceSSL = true;
      enableACME = false;
      sslCertificate = /lab/ssl-certs/localhost.pem;
      sslCertificateKey = /lab/ssl-certs/localhost-key.pem;
    };
  };
}
