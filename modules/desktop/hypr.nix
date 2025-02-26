{ pkgs, ... }:
{
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
}
