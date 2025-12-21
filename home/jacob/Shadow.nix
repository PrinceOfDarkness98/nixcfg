{ config, ... }:
{
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/desktop
  ];

  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
      fastfetch.enable = true;
    };
    desktop = {
      wayland.enable = true;
      hyprland.enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-1,1920x1080@74,0x0,1"
        "HDMI-A-1,1920x1080,2560x0,1.25"
      ];
      workspace = [
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
      ];
      cursor = {
        no_hardware_cursors = true;
        no_warps = false;
      };
    };
  };
}
