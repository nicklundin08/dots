{config, ...}: {
  # DERP port (https://tailscale.com/kb/1082/firewall-ports)
  networking.firewall.allowedTCPPorts = [8080 3478];
  environment.systemPackages = [config.services.headscale.package];
  # https://github.com/juanfont/headscale/issues/2210
  services = {
    headscale = {
      enable = true;
      address = "0.0.0.0";
      port = 8080;
      settings = {
        # This is the base url that clients should point to when registering
        server_url = "https://headscale.nicklundin.com";
        logtail.enabled = false;
        dns = {
          override_local_dns = true;
          base_domain = "clients.nicklundin.com";
          magic_dns = true;
          domains = ["nicklundin.com"];
          nameservers.global = ["9.9.9.9"];
        };
      };
    };

    nginx.virtualHosts."headscale.nicklundin.com" = {
      forceSSL = true;
      enableACME = false;
      sslCertificate = /lab/ssl-certs/localhost.pem;
      sslCertificateKey = /lab/ssl-certs/localhost-key.pem;
      locations."/" = {
        proxyPass = "http://localhost:${toString config.services.headscale.port}";
        proxyWebsockets = true;
      };
    };
  };
}
