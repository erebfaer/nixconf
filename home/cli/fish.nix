{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.fish = {
    enable = true;
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ]
  };
}
