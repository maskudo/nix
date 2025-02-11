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

  # nix.gc = {
  #   automatic = true;
  #   dates = "weekly";
  #   options = "--delete-older-than 14d";
  # };

  networking = {
    resolvconf.enable = false;
    dhcpcd.extraConfig = "nohook resolv.conf";
    hostName = "${username}-nixos"; # Define your hostname.
    wireless.enable = false; # Enables wireless support via wpa_supplicant.
    networkmanager = {
      enable = true;
      insertNameservers = ["1.1.1.1" "9.9.9.9"];
      dns = "none";
    };
    nameservers = ["1.1.1.1" "9.9.9.9"];
  };
  services.resolved.enable = false;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  systemd = {
    enableEmergencyMode = false;
    extraConfig = "DefaultTimeoutStopSec=10s";
  };

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      ${username} = {
        isNormalUser = true;
        description = "${username}";
        shell = pkgs.zsh;
        extraGroups = ["networkmanager" "wheel" "video" "audio" "docker" "vboxusers" "input" "uinput"];
        packages = [
        ];
      };
    };
    groups.video = {
      members = [username];
    };
  };

  system.stateVersion = "23.05";
}
