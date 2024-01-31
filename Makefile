build:
	nix run nixpkgs#home-manager -- build --flake .#x86_64-linux
	nix run nixpkgs#home-manager -- switch --flake .#x86_64-linux
