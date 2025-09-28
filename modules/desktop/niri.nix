{
  pkgs,
  unstablePkgs,
  lib,
  config,
  ...
}:
{
  options = {
    desktop.niri.enable = lib.mkOption {
      description = "Enables niri";
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.desktop.niri.enable {
    programs.niri = {
      enable = true;
      package = unstablePkgs.niri;
    };

    security.pam.services.hyprlock.enable = true;
    environment.systemPackages = with pkgs; [
      waybar
      hyprlock
      hyprshot
      swappy
      foot
      bemoji
      cliphist
      kanshi
      swww
      xwayland-satellite
      wl-clipboard
      wl-clipboard-x11
      wlr-randr
      wl-mirror
      unstablePkgs.wlr-which-key
      dunst
      rofi-wayland
    ];
  };
}
