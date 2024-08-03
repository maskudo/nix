{
  pkgs,
  username,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/programs
    ../../modules/services
    ../../modules/desktop/i3.nix
    ../../modules/hardware
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  security.rtkit.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than +5";
  };

  networking = {
    hostName = "${username}-nixos"; # Define your hostname.
    wireless.enable = false; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "9.9.9.9"];
  };

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable sound with pipewire.
  systemd = {
    enableEmergencyMode = false;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      ${username} = {
        isNormalUser = true;
        description = "${username}";
        shell = pkgs.bash;
        extraGroups = ["networkmanager" "wheel" "video" "audio" "docker" "syncthing" "vboxusers"];
        packages = [
        ];
      };
    };
    groups.video = {};
  };

  system.stateVersion = "23.05";
}
