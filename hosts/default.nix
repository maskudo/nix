{
  inputs,
  nixpkgs,
}: let
  system = "x86_64-linux";
in {
  aspire = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {inherit inputs system;};
    # > Our main nixos configuration file <
    modules = [./aspire];
  };
  # more hosts here
}
