{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    desktop.sway.enable = lib.mkOption {
      description = "Enables sway";
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.desktop.sway.enable {
    programs.sway = {
      enable = true;
      xwayland.enable = true;
      extraOptions = [ "--unsupported-gpu" ];
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        waybar
        hyprlock
        rofi
        foot
        bemoji
        swww
        wl-clipboard
        wl-clipboard-x11
        wlr-randr
        dunst
      ];
    };

  };
}
