{ inputs, ... }:
let
  helpers = import ./helpers.nix {
    inherit inputs;
  };
in
{
  inherit (helpers) mkHost mkHome;
}
