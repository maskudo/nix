{
  homeDirectory,
  username,
}: {...}: {
  imports = [./cli.nix ./gui.nix ./services.nix];

  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;

  home = {
    inherit homeDirectory;
    inherit username;
    stateVersion = "23.11";
  };
}
