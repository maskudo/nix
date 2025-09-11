{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    powerModule.enable = lib.mkEnableOption "Enables intel undervolt and auto-cpufreq";
  };

  config = lib.mkIf config.powerModule.enable {
    environment.systemPackages = with pkgs; [
      undervolt
      auto-cpufreq
    ];
    systemd.services = {
      undervolt = {
        description = "Undervolt intel CPUs";
        after = [
          "suspend.target"
          "hibernate.target"
          "hybrid-sleep.target"
        ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.undervolt}/bin/undervolt -v --core -72 --cache -72 --gpu -72";
        };
        wantedBy = [
          "multi-user.target"
          "suspend.target"
          "hibernate.target"
          "hybrid-sleep.target"
        ];
      };
    };
    services.thermald.enable = true;
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "powersave";
        turbo = "never";
      };
    };
  };
}
