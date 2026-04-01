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
in {
  # security.acme.defaults.email = "nick@moontower.net";
  # security.acme.acceptTerms = true;
  # https://github.com/juanfont/headscale/issues/2210
  services = {
    headscale = {
      enable = true;
      address = "0.0.0.0";
      port = 8080;
      settings = {
        server_url = "https://nicklundin.com";
        logtail.enabled = false;
        dns = {
          override_local_dns = true;
          base_domain = "ts.nicklundin.com";
          magic_dns = true;
          domains = ["${domain}"];
          nameservers.global = ["9.9.9.9"];
        };
      };
    };

    #   nginx.virtualHosts.${domain} = {
    #     forceSSL = true;
    #     enableACME = true;
    #     locations."/" = {
    #       proxyPass = "http://localhost:${toString config.services.headscale.port}";
    #       proxyWebsockets = true;
    #     };
    #   };
  };

  # DERP port (https://tailscale.com/kb/1082/firewall-ports)
  networking.firewall.allowedTCPPorts = [8080 3478];
  environment.systemPackages = [config.services.headscale.package];
}
