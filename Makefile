default:
	cat Makefile

aspireh:
	nix run nixpkgs#home-manager -- build --flake .#x86_64-linux
	nix run nixpkgs#home-manager -- switch --flake .#x86_64-linux

nixos:
	sudo nixos-rebuild switch --flake .#aspire

aspire:
	sudo nixos-rebuild switch --flake .#aspire


omen:
	sudo nixos-rebuild switch --flake .#omen

omenh:
	nix run nixpkgs#home-manager -- build --flake .#omen
	nix run nixpkgs#home-manager -- switch --flake .#omen

