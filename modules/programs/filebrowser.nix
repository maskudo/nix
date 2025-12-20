{ lib, config, ... }:
let
  service = "filebrowser";
  cfg = config.homelab.services.${service};
in
{
  options = {
    homelab.services.${service} = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable filebrowser";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    services.filebrowser = {
      enable = true;
      openFirewall = true;
      settings = {
        port = 8114;
        address = "0.0.0.0";
        root = "/mnt";
      };
    };
  };
}
