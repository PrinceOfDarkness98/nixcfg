{
  config,
  pkgs,
  inputs,
  ...
}:
{
  users.users.jacob = {
    initialHashedPassword = "$y$j9T$kYdo.MkcKZE4LR3QLQn7M1$MZTiTD22aakR4c9m5iToFWVMrW2b59Akl5P5JB/O001";
    isNormalUser = true;
    description = "jacob";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    packages = [ inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };
  home-manager.users.jacob = import ../../../home/jacob/${config.networking.hostName}.nix;
}
