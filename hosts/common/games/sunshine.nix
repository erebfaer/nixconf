# Game streaming server
{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  services.sunshine = {
    enable = false; # TODO: broken for some reason
    autoStart = true;
    capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
    openFirewall = true;
  };
}
