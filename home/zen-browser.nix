{
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  config = lib.mkIf config.home.guiApps.enable {
    programs.zen-browser = {
      enable = true;

      profiles.default = {
        id = 0;
        isDefault = true;
        settings = {
          "zen.urlbar.replace-newtab" = false;
          "zen.tabs.vertical.right-side" = true;
          "zen.view.compact.enable-at-startup" = true;
          "zen.view.show-newtab-button-top" = false;
          "browser.tabs.insertAfterCurrent" = true;
        };
        mods = [
          "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
        ];
        search = {
          force = true;
          engines = {
            github = {
              name = "GitHub Search";
              urls = [
                {
                  template = "https://github.com/search?q={searchTerms}";
                }
              ];
              definedAliases = [ "@gh" ];
            };
            youtube = {
              name = "YouTube";
              urls = [
                {
                  template = "https://www.youtube.com/results?search_query={searchTerms}";
                }
              ];
              definedAliases = [
                "@yt"
                "@youtube"
              ];
            };
            nixpkgs = {
              name = "Nix Packages";
              urls = [
                {
                  template = "https://search.nixos.org/packages?query={searchTerms}";
                }
              ];
              definedAliases = [ "@np" ];
            };
            maps = {
              name = "Google Maps";
              urls = [
                {
                  template = "https://www.google.com/maps/search/{searchTerms}";
                }
              ];
              definedAliases = [ "@map" ];
            };
          };
        };
      };
    };
  };
}
