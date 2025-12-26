{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./wayland.nix
    ./hyprland.nix
    ./fonts.nix
    ./stylix.nix
    ./niri.nix
  ];

  home.packages = with pkgs; [

  ];
}
