{
  homeDirectory,
  username,
  ...
}:
{
  imports = [
    ./cli.nix
    ./gui.nix
    ./languages.nix
    ./systemd
    ./services
  ];

  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;
  xdg.enable = true;

  home = {
    inherit homeDirectory;
    inherit username;
    stateVersion = "23.11";
  };
}
