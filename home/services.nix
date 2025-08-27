{
  username,
  ...
}:
{
  systemd.user.enable = true;

  imports = [ ./systemd ];

  services.copyq.enable = true;
  # services.emacs.enable = true;
  # services.emacs.package =
  #   with pkgs;
  #   ((emacsPackagesFor emacs-pgtk).emacsWithPackages (epkgs: [ epkgs.vterm ]));

  services.mpd = {
    enable = true;
    musicDirectory = "/home/${username}/Music";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "PipeWire via PulseAudio"
        mixer_type "software"
      }
    '';
  };

  services.syncthing = {
    enable = true;
  };

}
