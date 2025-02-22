{ username, ... }:
{
  networking = {
    resolvconf.enable = false;
    dhcpcd.extraConfig = "nohook resolv.conf";
    hostName = "${username}-nixos"; # Define your hostname.
    wireless.enable = false; # Enables wireless support via wpa_supplicant.
    networkmanager = {
      enable = true;
      insertNameservers = [
        "1.1.1.1"
        "9.9.9.9"
      ];
      dns = "none";
    };
    nameservers = [
      "1.1.1.1"
      "9.9.9.9"
    ];
  };
  services.resolved.enable = false;
  networking.firewall = {
    enable = true;
    # for NFSv3; view with `rpcinfo -p`
    allowedTCPPorts = [
      22
      80
      443
    ];
  };
}
