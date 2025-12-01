{
  pkgs,
  username,
  ...
}:
{
  programs = {
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  security.rtkit.enable = true;
  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  systemd = {
    enableEmergencyMode = false;
    settings.Manager = {
      DefaultTimeoutStopSec = "10s";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      ${username} = {
        isNormalUser = true;
        linger = true;
        description = "${username}";
        shell = pkgs.zsh;
        extraGroups = [
          "networkmanager"
          "wheel"
          "video"
          "audio"
          "vboxusers"
          "input"
          "uinput"
          "render"
        ];
      };
    };
    groups.video = {
      members = [ username ];
    };
  };

  # symlink bash to /bin/bash
  system.activationScripts.createBashSymlink = ''
    mkdir -p /bin
    ln -sf ${pkgs.bash}/bin/bash /bin/bash
  '';

  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  programs.nano.enable = false;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      username
    ];
  };
  nix.optimise.automatic = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${username}/nix";
  };

  programs.command-not-found.enable = true;

  programs.zsh.enable = true;

  # for commands such as npm link to work
  programs.npm.enable = true;

  environment.systemPackages = with pkgs; [
    alsa-utils
    findutils
    gcc
    git
    gnumake
    killall
    libcxx
    libgcc
    libnotify
    lsof
    nettools
    networkmanagerapplet
    nix-prefetch-git
    nmap
    plocate
    polkit
    powertop
    pulseaudioFull
    pavucontrol
    pciutils
    pkg-config
    psmisc
    unrar
    unzip
    usbutils
    wget
    xdotool
    xorg.xkill
    vim
    zip
  ];
  environment.variables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };
}
