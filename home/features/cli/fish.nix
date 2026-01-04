{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.features.cli.fish;
in
{
  options.features.cli.fish.enable = mkEnableOption "enable extended fish configuration";

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      loginShellInit = ''
        set -x NIX_PATH nixpkgs=channel:nixos-unstable
        set -x NIX_LOG info
        set -x TERMINAL alacritty

        if test (tty) = "/dev/tty1"
        exec Hyprland &> /dev/null
        # exec niri &> /dev/null
        end
      '';
      interactiveShellInit = ''
        set -gx EDITOR nvim
        fastfetch
      '';
      shellAbbrs = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "ls" = "eza";
        "grep" = "rg";
        "ps" = "procs";
        "c" = "clear";
      };
    };
  };
}
