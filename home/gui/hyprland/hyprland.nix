{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    # ../anyrun.nix
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
    wofi

    libsForQt5.qt5.qtwayland
    qt6.qtwayland

    wl-clipboard
  ];

  wayland.windowManager.hyprland.extraConfig = let
    mod = "SUPER";
  in
    concatStrings [
      ''
        monitor=,preferred,auto,auto

        $terminal = wezterm
        $fileManager = nautilus
        $menu = wofi --show drun

        # Some default env vars.
        env = XCURSOR_SIZE,24
        env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that

        # launch daemons
        exec-once = swaync # notification daemon
        exec-once = ${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1

        # run a thing binds
        bind = ${mod},SPACE,exec,$menu
        bind = ${mod},GRAVE,exec,$terminal
        bind = ${mod},E,exec,$fileManager

        # window binds
        bind = ${mod}, F, fullscreen, 1 # 0 full, 1 max w/gaps, 2 full w/o window state
        bind = ${mod}, V, togglefloating,

        ## focus
        bind = ${mod}, left, movefocus, l
        bind = ${mod}, right, movefocus, r
        bind = ${mod}, up, movefocus, u
        bind = ${mod}, down, movefocus, d

        ## move
        bind = ${mod}_SHIFT, left, movewindow, l
        bind = ${mod}_SHIFT, right, movewindow, r
        bind = ${mod}_SHIFT, up, movewindow, u
        bind = ${mod}_SHIFT, down, movewindow, d

        ## swap
        bind = ${mod}_CTRL, left, swapwindow, l
        bind = ${mod}_CTRL, right, swapwindow, r
        bind = ${mod}_CTRL, up, swapwindow, u
        bind = ${mod}_CTRL, down, swapwindow, d

      ''
    ];
}
