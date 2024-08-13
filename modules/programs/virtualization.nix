{...}: {
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    waydroid.enable = true;
    virtualbox = {
      host.enable = true;
      guest.enable = true;
      # guest.x11 = true;
      host.enableHardening = false;
    };
  };
  users.extraGroups.vboxusers.members = ["kv"];
  nixpkgs.config = {
    virtualbox.host.enableExtensionPack = true;
  };
}
