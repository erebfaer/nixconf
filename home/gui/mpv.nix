{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      mpv-playlistmanager-unstable
      mpv-thumbfast
      uosc
    ]; 
  };
}
