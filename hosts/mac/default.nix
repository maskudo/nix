{
  pkgs,
  username,
  inputs,
  ...
}:
{
  environment = {
    systemPackages = with pkgs; [
      vim
    ];
    # touch id for tmux
    etc."pam.d/sudo_local".text = ''
      # Managed by Nix Darwin
      auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
      auth       sufficient     pam_tid.so
    '';
  };

  imports = [
    ./kanata.nix
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
  system.primaryUser = username;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  services.openssh.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  nix = {
    gc = {
      automatic = true;
      interval = {
        Hour = 3;
        Minute = 15;
        Weekday = 7;
      };
      options = "--delete-older-than 14d";
    };
    optimise.automatic = true;
  };
  nixpkgs.config.allowUnfreePredicate = true;

  homebrew = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "zap";
    };
    brews = [
      "nvm"
      "yt-dlp"
    ];
    casks = [
      "docker-desktop"
      "google-chrome"
      "obs"
      "protonvpn"
      "scroll-reverser"
      "heroic"
      "readest"
      "steam"
    ];
  };

}
