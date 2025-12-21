{
  inputs,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.features.desktop.stylix;
in
{
  options.features.desktop.stylix.enable = mkEnableOption "enable stylix";

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      image = ../../../../../wallpapers/Mokka-tree.jpg;
    };
  };
}
