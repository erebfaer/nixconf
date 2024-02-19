{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./anyrun.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
  };

  home.packages = with pkgs; [
    swaynotificationcenter
    libsForQt5.polkit-kde-agent
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ];

  wayland.windowManager.hyprland.extraConfig = let
    mod = "SUPER";
  in
    concatStrings [
      ''
        monitor=,preferred,auto,auto

        $terminal = wezterm
        $fileManager = nautilus
        $menu = anyrun

        exec-once = swaync # notification daemon
        exec-once = ${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1

        bind = ${mod},SPACE,exec,$menu
        bind = ${mod},GRAVE,exec,$terminal
      ''
    ];
}
