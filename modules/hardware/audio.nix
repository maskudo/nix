{ ... }:
{
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig."99-disable-suspend" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                {
                  "node.name" = "~alsa_input.*";
                }
                {
                  "node.name" = "~alsa_output.*";
                }
              ];
              actions = {
                update-props = {
                  "session.suspend-timeout-seconds" = 0;
                };
              };
            }
          ];
        };
      };
      extraConfig = {
        pipewire = {
          "monitor.alsa.rules" = [
            {
              matches = [
                { "node.name" = "~alsa_input.*"; }
                { "node.name" = "~alsa_output.*"; }
              ];
              actions = {
                "update-props" = {
                  "session.suspend-timeout-seconds" = 0;
                };
              };
            }
          ];
          "monitor.bluez.rules" = [
            {
              matches = [
                { "node.name" = "~bluez_input.*"; }
                { "node.name" = "~bluez_output.*"; }
              ];
              actions = {
                "update-props" = {
                  "session.suspend-timeout-seconds" = 0;
                };
              };
            }
          ];
          "clock-rate" = {
            "context.properties" = {
              "default.clock.rate" = 48000;
            };
          };
        };
      };
    };
  };
}
