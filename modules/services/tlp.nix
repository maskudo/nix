{ lib, config, ... }:
{

  options = {
    tlpModule.enable = lib.mkOption {
      description = "Enables Tlp";
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf config.tlpModule.enable {
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT = "ondemand";
        CPU_SCALING_GOVERNOR_ON_AC = "ondemand";
        CPU_SCALING_MIN_FREQ_ON_AC = 0;
        CPU_SCALING_MAX_FREQ_ON_AC = 9999999;
        CPU_SCALING_MIN_FREQ_ON_BAT = 0;
        CPU_SCALING_MAX_FREQ_ON_BAT = 2400000;
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 75;
        CPU_BOOST_ON_AC = 0;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 0;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        NMI_WATCHDOG = 0;

        DEVICES_TO_DISABLE_ON_STARTUP = "wwan"; # wwan means stuff like 3G, 4G/LTE

        USB_AUTOSUSPEND = 0;
        RUNTIME_PM_ENABLE = "01:00.0";
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";
        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 1;

        #Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
    };
  };
}
