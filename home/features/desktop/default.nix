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
  ];

  home.packages = with pkgs; [

  ];
}
