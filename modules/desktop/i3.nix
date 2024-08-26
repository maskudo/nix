{pkgs, ...}: {
  imports = [../../overlays/picomOverlay.nix];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      rofi = pkgs.rofi.override {
        plugins = [pkgs.rofi-emoji pkgs.rofi-calc];
      };
    };
  };

  services = {
    xserver = {
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
      sddm.theme = "${import ../../modules/sddm-theme.nix {inherit pkgs;}}";
      defaultSession = "none+i3";
    };

    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        naturalScrolling = true;
        middleEmulation = false;
      };
      mouse = {
        naturalScrolling = false;
        middleEmulation = false;
      };
    };
  };

  # nixpkgs.config = {
  #   packageOverrides = pkgs: {
  #     polybar = pkgs.polybar.override {
  #       i3Support = true;
  #       pulseSupport = true;
  #     };
  #   };
  # };
}
