{
  username,
  ...
}:
{
  systemd.user.enable = true;

  imports = [ ./systemd ];

  services.copyq.enable = true;

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
