{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet \
      -t -r --remember-user-session --user-menu --asterisks";
    };
  };
}
