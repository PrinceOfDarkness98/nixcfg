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
  options.features.desktop.niri.enable = mkEnableOption "niri config";

  config = mkIf cfg.enable {
  };
}
