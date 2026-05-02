{
  inputs,
  ...
}:
{
  mkHome =
    {
      username,
      system ? "x86_64-linux",
      enableGuiApps ? true,
      unstablePkgs ? import inputs.unstable {
        system = system;
        config.allowUnfree = true;
      },
      mods ? [ ],
      isDarwin ? unstablePkgs.stdenv.hostPlatform.isDarwin,
      ...
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        (import ../home/home-manager.nix {
          homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
          inherit
            username
            inputs
            isDarwin
            ;
        })
        inputs.nix-index-database.homeModules.nix-index
        (
          { ... }:
          {
            home.guiApps.enable = enableGuiApps;
            programs.nix-index-database.comma.enable = true;
          }
        )
      ]
      ++ mods;
      pkgs = unstablePkgs;
      extraSpecialArgs = {
        inherit
          username
          inputs
          system
          enableGuiApps
          ;
      };
    };

  mkHost =
    {
      username,
      enableGuiApps ? true,
      system ? "x86_64-linux",
      unstablePkgs ? import inputs.unstable {
        system = system;
        config.allowUnfree = true;
      },
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          system
          username
          unstablePkgs
          enableGuiApps
          ;
      };
      modules = [
        ../hosts
        inputs.grub2-themes.nixosModules.default
        inputs.flake-programs-sqlite.nixosModules.programs-sqlite
        inputs.mango.nixosModules.mango
      ];
    };
}
