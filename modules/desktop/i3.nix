{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [ ../sddm-avatar.nix ];
  options = {
    desktop.i3.enable = lib.mkEnableOption "Enables i3wm";
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
