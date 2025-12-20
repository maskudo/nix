default:
	which bat >/dev/null && bat Justfile || cat Justfile

mk489:
	sudo nixos-rebuild switch --flake .#mk489
mk489b:
	sudo nixos-rebuild boot --flake .#mk489
mk489r:
  nixos-rebuild switch \
  --flake .#mk489 \
  --target-host mk489@192.168.1.67 \
  --ask-sudo-password

omen:
	sudo nixos-rebuild switch --flake .#omen
omenb:
	sudo nixos-rebuild boot --flake .#omen

omenh:
	nix run nixpkgs#home-manager -- build --flake .#omen
	nix run nixpkgs#home-manager -- switch --flake .#omen

mk489h:
	nix run nixpkgs#home-manager -- build --flake .#mk489
	nix run nixpkgs#home-manager -- switch --flake .#mk489

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
