{
  config,
  inputs,
  lib,
  ...
}:
with lib;
let
  cfg = config.features.desktop.stylix;
in
{
  imports = [ inputs.stylix.homeModules.stylix ];

  options.features.desktop.stylix.enable = mkEnableOption "enable stylix";

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      image = ./wallpapers/37.png;
      polarity = "dark";
    };
  };
}
