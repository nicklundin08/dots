{...}: {
  # # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [22];
  # # networking.firewall.allowedUDPPorts = [ ... ];
  # # Or disable the firewall altogether.
  # # networking.firewall.enable = false;
  #
  # programs.ssh.startAgent = true;
  # services.openssh.enable = true;
  # services.openssh.permitRootLogin = "no";
  # services.openssh.passwordAuthentication = false;
  # # services.openssh.port = 22;
  # # services.openssh.protocol = "2";
}
