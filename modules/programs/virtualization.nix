{ pkgs, username, ... }:
{
  programs.virt-manager.enable = true;

  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        metrics-addr = "0.0.0.0:9323";
        experimental = true;
      };
    };

    incus = {
      enable = true;
      ui.enable = true;
    };

    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    # waydroid.enable = true;
    # virtualbox = {
    #   host.enable = true;
    #   # guest.enable = true; # causes long switch times
    #   # guest.x11 = true;
    #   host.enableHardening = false;
    # };
  };
  networking.firewall.interfaces = {
    docker0 = {
      allowedTCPPorts = [
        80
        443
        9323
      ];
    };
  };
  users.extraGroups.vboxusers.members = [ "kv" ];
  nixpkgs.config = {
    virtualbox.host.enableExtensionPack = true;
  };
  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  users = {
    groups = {
      libvirtd.members = [ username ];
    };
    users = {
      ${username} = {
        extraGroups = [
          "docker"
          "incus"
          "incus-admin"
        ];
      };
    };
  };

}
