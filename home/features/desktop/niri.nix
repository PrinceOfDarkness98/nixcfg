{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.niri;
in
{
  imports = [ inputs.niri.homeManagerModules.niri ];
  options.features.desktop.niri.enable = mkEnableOption "niri config";

  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
    };
  };
}
