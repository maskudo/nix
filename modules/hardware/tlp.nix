{ lib, config, ... }:
{
  options = {
    tlpModule.enable = lib.mkEnableOption "Enables Tlp";
  };

  config = lib.mkIf config.tlpModule.enable {
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT = "ondemand";
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_MIN_FREQ_ON_AC = 400000;
        CPU_SCALING_MAX_FREQ_ON_AC = 9999999;
        CPU_SCALING_MIN_FREQ_ON_BAT = 400000;
        CPU_SCALING_MAX_FREQ_ON_BAT = 3400000;
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 1;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 1;

        NMI_WATCHDOG = 0;

        DEVICES_TO_DISABLE_ON_STARTUP = "wwan"; # wwan means stuff like 3G, 4G/LTE

        USB_AUTOSUSPEND = 0;
        RUNTIME_PM_ENABLE = "01:00.0";
        RUNTIME_PM_ON_AC = "auto";
        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 0;
      };
    };
  };
}
