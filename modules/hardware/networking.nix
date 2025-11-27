{ username, ... }:
{
  environment.etc.hosts.mode = "0700";
  networking = {
    resolvconf.enable = false;
    dhcpcd.extraConfig = "nohook resolv.conf";
    hostName = "${username}"; # Define your hostname.
    wireless.enable = false; # Enables wireless support via wpa_supplicant.
    networkmanager = {
      enable = true;
      wifi.powersave = false;
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

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      ChallengeResponseAuthentication = false;
      Macs = [ "hmac-sha2-256" ];
    };
    extraConfig = ''
      HostBasedAuthentication no
      PubkeyAuthentication yes
    '';

  };

  networking.firewall = {
    enable = false;
    # for NFSv3; view with `rpcinfo -p`
    allowedTCPPorts = [
      22
      80
      443
    ];
  };
}
