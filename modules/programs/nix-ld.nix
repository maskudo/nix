{ pkgs, ... }:
{
  programs = {
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      acl
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      attr
      bzip2
      cairo
      cups
      curl
      dbus
      expat
      fontconfig
      freetype
      fuse3
      gdk-pixbuf
      glib
      gtk3
      icu
      libGL
      libappindicator-gtk3
      libdrm
      libgit2
      libglvnd
      libnotify
      libpulseaudio
      libsodium
      libssh
      libunwind
      libusb1
      libuuid
      libxkbcommon
      libxml2
      mesa
      nspr
      nss
      openssl
      pango
      pipewire
      stdenv.cc.cc
      systemd
      util-linux
      vulkan-loader
      #xorg
      libX11
      libXScrnSaver
      libXcomposite
      libXcursor
      libXdamage
      libXext
      libXfixes
      libXi
      libXrandr
      libXrender
      libXtst
      libxcb
      libxkbfile
      libxshmfence

      zlib
      zstd
    ];
  };
  environment.variables = {
    LIBGIT2_PATH = "${pkgs.libgit2}/lib";
  };
}
