{
  unstablePkgs,
  lib,
  config,
  ...
}:
{
  options = {
    gaming.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable gaming";
    };
  };

  config = lib.mkIf config.gaming.enable {
    hardware.xone.enable = true; # xbox controller

    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamescope.enable = true;
    programs.gamemode.enable = true;
    environment.systemPackages = with unstablePkgs; [
      mangohud
      lutris
      protonup
      bottles
      (heroic.override {
        extraPkgs = pkgs: [
          pkgs.gamescope
        ];
      })
    ];
  };
}
