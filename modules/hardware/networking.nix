{ username, ... }:
{
  environment.etc.hosts.mode = "0644";
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
    extraHosts = ''
      127.0.0.1 reddit.com
      127.0.0.1 www.reddit.com
      127.0.0.1 old.reddit.com

      127.0.0.1 instagram.com
      127.0.0.1 www.instagram.com

      127.0.0.1 linkedin.com
      127.0.0.1 www.linkedin.com

      127.0.0.1 youtube.com
      127.0.0.1 www.youtube.com

      127.0.0.1 twitch.tv
      127.0.0.1 www.twitch.tv
    '';
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
