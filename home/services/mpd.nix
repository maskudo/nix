{ username, ... }:
{

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
}
