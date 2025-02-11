default:
	which bat >/dev/null && bat Justfile || cat Justfile

aspire:
	sudo nixos-rebuild switch --flake .#aspire

omen:
	sudo nixos-rebuild switch --flake .#omen

omenh:
	nix run nixpkgs#home-manager -- build --flake .#omen
	nix run nixpkgs#home-manager -- switch --flake .#omen

aspireh:
	nix run nixpkgs#home-manager -- build --flake .#x86_64-linux
	nix run nixpkgs#home-manager -- switch --flake .#x86_64-linux
check: 
  nix flake check
clean: 
  nh clean all 
update-home:
  nix flake update home-manager unstable
update-proxmox:
  nix flake update proxmox-nixos
update-all:
  nix flake update
