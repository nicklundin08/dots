{
  config,
  pkgs,
  ...
}: {
  # Had to manually move kubeconf file like this
  #cp ~/.kube/config ~/.kube/config.bak
  # sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
  # sudo chown $(id -u):$(id -g) ~/.kube/config
  networking.firewall = {
    allowedTCPPorts = [6443];
  };
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = ["--write-kubeconfig-mode 640" "--write-kubeconfig-group=k3sconfig"];
    #   extraFlags = toString [
    #     # "--debug"
    #   ];
  };
  users.groups.k3sconfig = {};

  # Add your primary user to the newly created group to avoid needing sudo for kubectl
  users.users.nick.extraGroups = ["k3sconfig"];

  # Install kubectl system-wide
  environment.systemPackages = with pkgs; [
    kubectl
    kubernetes-helm # Optional: if you plan to use Helm
  ];

  # Point the global KUBECONFIG variable to the default K3s config path
  environment.variables = {
    KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
  };
}
