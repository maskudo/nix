{username, ...}: {
  services = {
    syncthing.enable = true;
    syncthing.openDefaultPorts = true;
  };
  # syncthing.user = "${username}";
  systemd = {
    services.syncthing.serviceConfig.UMask = "0007";
    tmpfiles.rules = [
      "d /home/${username} 0750 ${username} syncthing"
    ];
  };
  users = {
    users = {
      syncthing.extraGroups = ["users"];
      ${username}.extraGroups = ["syncthing"];
    };
  };
}
