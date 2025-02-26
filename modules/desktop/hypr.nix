{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    desktop.hyprland.enable = lib.mkEnableOption "Enables hyprland";
  };

  config = lib.mkIf config.desktop.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      waybar
      hyprlock
      rofi-wayland
      bemoji
      swww
      # hyprshot
      wl-clipboard
      wl-clipboard-x11
      wlr-randr
      swaynotificationcenter
      pyprland
    ];
  };
}
