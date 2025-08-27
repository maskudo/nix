{ pkgs, ... }:
{
  home.packages = with pkgs; [
    eslint
    biome
    prettier
    nodePackages.pnpm
    typescript-language-server
    nixd
    uv
    nixfmt-rfc-style

    go
    lua5_1
    rustup
    python311

  ];
}
