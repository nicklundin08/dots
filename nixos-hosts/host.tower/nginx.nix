# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  services.nginx = {
    enable = true;
    # https://login.tailscale.com/admin/machines
    virtualHosts."tower.tail3394a4.ts.net" = {
      # Use Tailscale certs (if enabled in Tailscale admin panel)
      # enableACME = true;
      # forceSSL = true;

      # Alternatively, bind only to tailscale0 for security
      # listen = [
      #   {
      #     addr = "100.x.y.z";
      #     port = 80;
      #   } # Replace with your Tailscale IP
      # ];

      locations."/test" = {
        return = "200 '<html><body>It works!!</body></html>'";
        extraConfig = ''
          default_type text/html;
        '';
      };
    };
    virtualHosts.localhost = {
      locations."/" = {
        return = "200 '<html><body>It works</body></html>'";
        extraConfig = ''
          default_type text/html;
        '';
      };
    };
  };
}
