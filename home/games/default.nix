{pkgs, ...}: {
  home.packages = with pkgs.unstable; [
    starsector
    fallout-ce
    fallout2-ce
    openmw

    # roguelikes
    brogue-ce
    crawlTiles # DCSS
    infra-arcana
  ];
}
