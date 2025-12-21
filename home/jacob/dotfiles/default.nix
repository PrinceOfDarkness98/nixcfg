{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    lazygit
    tree-sitter
    curl
    gcc
  ];
}
