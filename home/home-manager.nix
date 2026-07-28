{
  homeDirectory,
  username,
  isDarwin,
  ...
}:
{
  imports = [
    ./cli.nix
    ./gui.nix
    ./zen-browser.nix
  ]
  ++ (
    if isDarwin then
      [
        ./systemd/commit-zt.nix
        ./services/syncthing.nix
        ./services/mpd.nix
      ]
    else
      [
        ./systemd
        ./services
      ]
  );

  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = !isDarwin;
  xdg.enable = !isDarwin;

  home = {
    inherit homeDirectory;
    inherit username;
    stateVersion = "23.11";
  };
}
