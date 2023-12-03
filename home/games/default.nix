{ pkgs, ... }:

{
  programs.java.enable = true;
  home.packages = [ pkgs.starsector ];
}
