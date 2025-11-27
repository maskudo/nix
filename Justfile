default:
	which bat >/dev/null && bat Justfile || cat Justfile

aspire:
	sudo nixos-rebuild switch --flake .#aspire
aspireb:
	sudo nixos-rebuild boot --flake .#aspire

omen:
	sudo nixos-rebuild switch --flake .#omen
omenb:
	sudo nixos-rebuild boot --flake .#omen

omenh:
	nix run nixpkgs#home-manager -- build --flake .#omen
	nix run nixpkgs#home-manager -- switch --flake .#omen

aspireh:
	nix run nixpkgs#home-manager -- build --flake .#aspire
	nix run nixpkgs#home-manager -- switch --flake .#aspire

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
