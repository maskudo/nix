{
  homeDirectory,
  username,
}: {...}: {
  imports = [../overlays/postmanOverlay.nix ./cli.nix ./gui.nix];

  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;

  home = {
    inherit homeDirectory;
    inherit username;
    stateVersion = "23.11";
  };
}
