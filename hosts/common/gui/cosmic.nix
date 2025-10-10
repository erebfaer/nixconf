{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [];

  services.desktopManager.cosmic = {
    enable = true;
    xwayland.enable = true;
  };

  # TODO once these options hit stable
  # environment.cosmic.excludePackages
  # services.desktopManager.cosmic.showExcludedPkgsWarning = true;
}
