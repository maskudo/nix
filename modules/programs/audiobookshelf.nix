{ lib, config, ... }:
let
  service = "audiobookshelf";
  cfg = config.homelab.services.${service};
in
{
  options = {
    homelab.services.${service} = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable audiobookshelf";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    services.audiobookshelf = {
      enable = true;
      openFirewall = true;
      port = 8113;
      host = "0.0.0.0";
    };
  };
}
