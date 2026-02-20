{}: let
  serverIp = "10.0.0.134";
in {
  networking.wg-quick.interfaces = {
    wg0 = {
      address = ["10.0.0.2/24" "fdc9:281f:04d7:9ee9::2/64"];
      dns = ["10.0.0.1" "fdc9:281f:04d7:9ee9::1"];
      privateKeyFile = "/etc/wireguard.bak/privatekey";

      peers = [
        {
          publicKey = "qBjFoL2UntqsdeMegz461Wog+U3CsJ90J61UzN3KnRY=";
          presharedKeyFile = "/etc/wireguard.bak/privatekey";
          allowedIPs = ["0.0.0.0/0" "::/0"];
          endpoint = "${serverIp}:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
