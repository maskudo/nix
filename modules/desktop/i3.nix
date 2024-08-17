{pkgs, ...}: {
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
        middleEmulation = true;
        naturalScrolling = true;
      };
      mouse = {
        naturalScrolling = false;
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
