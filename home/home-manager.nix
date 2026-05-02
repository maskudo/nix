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
  ]
  ++ (
    if isDarwin then
      [ ]
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
