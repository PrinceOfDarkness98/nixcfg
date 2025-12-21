{ pkgs, lib, ... }:
{
  imports = [
    ./fish.nix
    ./fzf.nix
    ./fastfetch.nix
  ];
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
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };
      opener = {
        edit = [
          {
            run = ''nvim "$@"'';
            desc = "$EDITOR";
            block = true;
            for = "unix";
          }
          {
            run = "code %*";
            orphan = true;
            desc = "code";
            for = "windows";
          }
          {
            run = "code -w %*";
            block = true;
            desc = "code (block)";
            for = "windows";
          }
        ];
        open = [
          {
            run = ''xdg-open "$1"'';
            desc = "Open";
            for = "linux";
          }
          {
            run = ''open "$@"'';
            desc = "Open";
            for = "macos";
          }
          {
            run = ''start "" "%1"'';
            orphan = true;
            desc = "Open";
            for = "windows";
          }
          {
            run = ''termux-open "$1"'';
            desc = "Open";
            for = "android";
          }
        ];
        reveal = [
          {
            run = ''xdg-open "$(dirname "$1")"'';
            desc = "Reveal";
            for = "linux";
          }
          {
            run = ''open -R "$1"'';
            desc = "Reveal";
            for = "macos";
          }
          {
            run = ''explorer /select,"%1"'';
            orphan = true;
            desc = "Reveal";
            for = "windows";
          }
          {
            run = ''termux-open "$(dirname "$1")"'';
            desc = "Reveal";
            for = "android";
          }
          {
            run = ''exiftool "$1"; echo "Press enter to exit"; read _'';
            block = true;
            desc = "Show EXIF";
            for = "unix";
          }
        ];
        extract = [
          {
            run = ''ya pub extract --list "$@"'';
            desc = "Extract here";
            for = "unix";
          }
          {
            run = "ya pub extract --list %*";
            desc = "Extract here";
            for = "windows";
          }
        ];
        play = [
          {
            run = ''mpv --force-window "$@"'';
            orphan = true;
            for = "unix";
          }
          {
            run = "mpv --force-window %*";
            orphan = true;
            for = "windows";
          }
          {
            run = ''mediainfo "$1"; echo "Press enter to exit"; read _'';
            block = true;
            desc = "Show media info";
            for = "unix";
          }
        ];
      };
      open = {
        rules = [
          {
            name = "*/";
            use = [
              "edit"
              "open"
              "reveal"
            ];
          }
          {
            mime = "text/*";
            use = [
              "edit"
              "reveal"
            ];
          }
          {
            mime = "image/*";
            use = [
              "open"
              "reveal"
            ];
          }
          {
            mime = "{audio,video}/*";
            use = [
              "play"
              "reveal"
            ];
          }
          {
            mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
            use = [
              "extract"
              "reveal"
            ];
          }
          {
            mime = "application/{json,ndjson}";
            use = [
              "edit"
              "reveal"
            ];
          }
          {
            mime = "*/javascript";
            use = [
              "edit"
              "reveal"
            ];
          }
          {
            mime = "inode/empty";
            use = [
              "edit"
              "reveal"
            ];
          }
          {
            name = "*";
            use = [
              "open"
              "reveal"
            ];
          }
        ];
      };
    };
  };
  programs.bat.enable = true;

  home.packages = with pkgs; [
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
