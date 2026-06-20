{ ... }:
{
  homebrew = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "zap";
    };
    brews = [
      "nvm"
      "yt-dlp"
    ];
    casks = [
      "activitywatch"
      "claude"
      "docker-desktop"
      "google-chrome"
      "gpodder"
      "macshot"
      "obs"
      "protonvpn"
      "scroll-reverser"
      "heroic"
      "readest"
      "steam"
      "ngrok"
      "libreoffice"
    ];
  };
}
