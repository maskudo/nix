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
  };

  imports = [
    ../../modules/services/tailscale.nix
    ./brew.nix
    ./kanata.nix
    ./touchId.nix
    ./system.nix
  ];

  services.openssh.enable = true;
  programs.nix-index.enable = true;

  networking = {
    knownNetworkServices = [
      "Wi-Fi"
      "Ethernet Adaptor"
    ];
    dns = [
      "1.1.1.1"
      "9.9.9.9"
    ];
  };

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
    # Necessary for using flakes on this system.
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs = {
    config.allowUnfreePredicate = true;
    hostPlatform = "aarch64-darwin";
  };

  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
    primaryUser = username;
  };
}
