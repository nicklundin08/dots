{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  # https://login.tailscale.com/admin/machines
  services.nginx.virtualHosts."tower" = {
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

    # locations."/test" = {
    #   return = "200 '<html><body>It works!!</body></html>'";
    #   extraConfig = ''
    #     default_type text/html;
    #   '';
    # };
    # enableACME = true; # If using SSL/Let's Encrypt
    # forceSSL = false;

    locations."/test" = {
      return = "200 '<html><body>It works!!</body></html>'";
      extraConfig = ''
        default_type text/html;
      '';
    };

    locations."/jellyfin/" = {
      proxyPass = "http://127.0.0.1:8096/";
      proxyWebsockets = true; # Necessary for Jellyfin
      extraConfig = ''
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Protocol $scheme;
        proxy_set_header X-Forwarded-Host $http_host;
      '';
    };
  };
  # services.nginx.virtualHosts."tower.tail3394a4.ts.net" = {
  #   # Use Tailscale certs (if enabled in Tailscale admin panel)
  #   # enableACME = true;
  #   # forceSSL = true;
  #
  #   # Alternatively, bind only to tailscale0 for security
  #   # listen = [
  #   #   {
  #   #     addr = "100.x.y.z";
  #   #     port = 80;
  #   #   } # Replace with your Tailscale IP
  #   # ];
  #
  #   # locations."/test" = {
  #   #   return = "200 '<html><body>It works!!</body></html>'";
  #   #   extraConfig = ''
  #   #     default_type text/html;
  #   #   '';
  #   # };
  #   # enableACME = true; # If using SSL/Let's Encrypt
  #   # forceSSL = false;
  #
  #   locations."/jellyfin/" = {
  #     proxyPass = "http://127.0.0.1:8096/";
  #     proxyWebsockets = true; # Necessary for Jellyfin
  #     extraConfig = ''
  #       proxy_set_header Host $host;
  #       proxy_set_header X-Real-IP $remote_addr;
  #       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  #       proxy_set_header X-Forwarded-Proto $scheme;
  #       proxy_set_header X-Forwarded-Protocol $scheme;
  #       proxy_set_header X-Forwarded-Host $http_host;
  #     '';
  #   };
  # };
}
