{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      x = {fraction = 0.5;};
      y = {absolute = 0;};
      width = {absolute = 800;};
      height = {absolute = 0;};
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = true;
      showResultsImmediately = false;
      maxEntries = null;
      plugins = [];
    };
  };
}
