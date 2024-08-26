{...}: {
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        metrics-addr = "0.0.0.0:9323";
        experimental = true;
      };
    };

    libvirtd.enable = true;
    waydroid.enable = true;
    virtualbox = {
      host.enable = true;
      guest.enable = true;
      # guest.x11 = true;
      host.enableHardening = false;
    };
  };
  networking.firewall.interfaces = {
    docker0 = {
      allowedTCPPorts = [80 443 9323];
    };
  };
  users.extraGroups.vboxusers.members = ["kv"];
  nixpkgs.config = {
    virtualbox.host.enableExtensionPack = true;
  };
}
