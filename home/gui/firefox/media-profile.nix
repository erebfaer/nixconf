{pkgs, ...}: {
  isDefault = false;

  search = {
    default = "DuckDuckGo";
    force = true;
  };

  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    # important
    bitwarden
    ublock-origin
    multi-account-containers
    sidebery

    # optional
    violentmonkey
    auto-tab-discard

    # youtube stuff
    sponsorblock
    dearrow
    improved-tube
  ];

  settings = {
    "general.autoScroll" = true;
    "extensions.pocket.enabled" = false;
    "signon.rememberSignons" = false;
  };
}
