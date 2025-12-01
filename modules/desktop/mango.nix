{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    desktop.mango.enable = lib.mkOption {
      description = "Enables mango";
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.desktop.mango.enable {
    programs.mango = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      waybar
      hyprlock
      swappy
      foot
      rofi
      bemoji
      swww
      hyprshot
      wl-clipboard
      wl-clipboard-x11
      wlr-randr
      dunst
    ];
  };
}
