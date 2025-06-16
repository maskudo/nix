{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [ ../sddm-avatar.nix ];
  options = {
    desktop.i3.enable = lib.mkOption {
      description = "Enables i3wm";
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.desktop.i3.enable {
    nixpkgs.config = {
      packageOverrides = pkgs: {
        rofi = pkgs.rofi.override {
          plugins = [
            pkgs.rofi-emoji
            pkgs.rofi-calc
          ];
        };
      };
    };

    environment.sessionVariables.GTK_CSD = "0"; # disable client side window decorations
    security.pam.services.i3lock.enable = true;
    services = {
      xserver = {
        desktopManager = {
          xterm.enable = false;
        };
        excludePackages = [ pkgs.xterm ];
        enable = true;
        xkb.layout = "us";
        xkb.variant = "";
        xkb.options = "caps:escape_shifted_capslock";
        windowManager.i3 = {
          enable = true;
          extraPackages = with pkgs; [
            betterlockscreen
            dmenu
            dunst
            rofi
            picom
            polybarFull
          ];
        };
      };
    };
  };
}
