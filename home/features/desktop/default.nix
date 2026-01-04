{
  pkgs,
  inputs,
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
    wezterm
    tmux
    zellij
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
  ];
}
