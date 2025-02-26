{ pkgs, ... }:
{
  imports = [ ../sddm-avatar.nix ];
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
  environment.xfce.excludePackages = with pkgs.xfce; [
    mousepad
    parole
    xfce4-appfinder
    xfce4-notifyd
    xfce4-screensaver
    xfce4-screenshooter
    xfce4-session
    xfce4-taskmanager
    xfce4-terminal
    xfce4-volumed-pulse
    xfwm4
    pkgs.lightdm
  ];

  services = {
    xserver = {
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
          enableScreensaver = false;
        };
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

    displayManager = {
      sddm.enable = true;
      sddm.theme = "${import ../../modules/sddm-theme.nix { inherit pkgs; }}";
      # defaultSession = "none+i3";
      defaultSession = "xfce+i3";
    };

    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        naturalScrolling = true;
        middleEmulation = false;
        disableWhileTyping = true;
      };
      mouse = {
        naturalScrolling = false;
        middleEmulation = false;
      };
    };
  };
}
