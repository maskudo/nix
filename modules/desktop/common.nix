{ ... }:
{
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      middleEmulation = false;
      disableWhileTyping = true;
    };
    mouse = {
      naturalScrolling = false;
      middleEmulation = false;
    };
  };
}
