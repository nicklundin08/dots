{...}: {
  virtualisation.oci-containers.containers.headscale-ui = {
    image = "ghcr.io/gurucomputing/headscale-ui:latest";
    ports = ["8081:8080" "8443:8443"];
    autoStart = true;
  };
}
