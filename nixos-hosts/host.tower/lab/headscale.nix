# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  inputs,
  outputs,
  pkgs,
  ...
}: let
  domain = "nicklundin.com";
  # This is the base url that the dashboard gets served from (I think)
  server_fqdn = "headscale.${domain}";
  # This is the domain that clients get suffixed with
  # e.g.
  # - tower.clients.nicklundin.com
  # - msi.clients.nicklundin.com
  client_suffix = "clients.${domain}";
in {
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
        server_url = "https://${server_fqdn}";
        logtail.enabled = false;
        dns = {
          override_local_dns = true;
          base_domain = client_suffix;
          magic_dns = true;
          domains = ["${domain}"];
          nameservers.global = ["9.9.9.9"];
        };
      };
    };

    nginx.virtualHosts.${server_fqdn} = {
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
