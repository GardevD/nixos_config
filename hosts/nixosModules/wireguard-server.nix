{ pkgs, ... }:
{
  networking.nat.enable = true;
  networking.nat.externalInterface = "end0";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.1/24" ];
      listenPort = 51820;

      # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o end0 -j MASQUERADE
      '';

      # This undoes the above command
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o end0 -j MASQUERADE
      '';

     privateKeyFile = "/etc/wireguard/private";

      peers = [
        # List of allowed peers.
        { # Feel free to give a meaningful name
          # Phone
          publicKey = "UKhEGem6JRWY+DODqj0dl+Nmi8FPKiDX5sjEnlZTXn4=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          allowedIPs = [ "10.100.0.2/32" ];
        }
        {
          # Phone
          publicKey = "1gsLvKsb7YeGh2kCSFczCi/RpPExTbLZBpPPkGCOSU4=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          allowedIPs = [ "10.100.0.3/32" ];
        }
      ];
    };
  };
}
