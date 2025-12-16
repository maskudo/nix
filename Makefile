default:
	cat Makefile

mk489h:
	nix run nixpkgs#home-manager -- build --flake .#mk489
	nix run nixpkgs#home-manager -- switch --flake .#mk489

nixos:
	sudo nixos-rebuild switch --flake .#mk489

mk489:
	sudo nixos-rebuild switch --flake .#mk489


omen:
	sudo nixos-rebuild switch --flake .#omen

omenh:
	nix run nixpkgs#home-manager -- build --flake .#omen
	nix run nixpkgs#home-manager -- switch --flake .#omen

