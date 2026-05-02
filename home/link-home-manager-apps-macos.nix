{ lib, pkgs, ... }:
{
  home.activation.linkMacosApps =
    lib.optionals pkgs.stdenv.hostPlatform.isDarwin lib.hm.dag.entryAfter [ "writeBoundary" ]
      (builtins.readFile ./link-home-manager-apps-macos.nix);
}
