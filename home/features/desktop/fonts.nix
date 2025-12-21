{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.fonts;
in
{
  options.features.desktop.fonts.enable = mkEnableOption "install additional fonts for desktop apps";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fira-code
      fira-code-symbols
      nerd-font.fira-code-nerdfont
      nerd-font.jetbrains-mono
      nerd-font.iosevka
      font-manager
      font-awesome_5
      noto-fonts
    ];
  };
}
