{
  config,
  inputs,
  ...
}: {
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/desktop
    ./dotfiles
    inputs.nix-monitor.homeManagerModules.default
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
      fonts.enable = true;
      stylix.enable = true;
      niri.enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
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
  programs.nix-monitor = {
    enable = true;
    rebuildCommand = [
      "bash"
      "-c"
      "cd ~/projects/nixcfg && sudo nixos-rebuild switch --flake .#LShadow"
    ];
  };
}
