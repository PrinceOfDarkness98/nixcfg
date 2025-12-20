{ pkgs, ... }:
{
  programs.zoxide = {
    enable = true;
  };
  programs.eza = {
    enable = true;
    extraOptions = [
      "-l"
      "--icons"
      "--git"
      "-a"
    ];
  };
  programs.bat.enable = true;

  home.packges = with pkgs; [
    coreutils
    fd
    btop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip
  ];
}
