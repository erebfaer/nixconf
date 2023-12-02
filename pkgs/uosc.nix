{ stdenvNoCC, lib, fetchFromGitHub, makeFontsConf }:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "uosc";
  version = "5.1.1";

  src = fetchFromGitHub {
    owner = "tomasklaen";
    repo = "uosc";
    rev = finalAttrs.version;
    hash = "sha256-h08z2jy57038id71ax5ar1pvqg55qdhl53r3m5dbq9p4pbi7kr2gv";
  };

  postPatch = ''
    substituteInPlace scripts/uosc.lua \
      --replace "mp.find_config_file('scripts')" "\"$out/share/mpv/scripts\""
  '';

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/mpv/
    cp -r scripts $out/share/mpv
    cp -r fonts $out/share

    runHook postInstall
  '';

  passthru.scriptName = "uosc.lua";
  # the script uses custom "texture" fonts as the background for ui elements.
  # In order for mpv to find them, we need to adjust the fontconfig search path.
  passthru.extraWrapperArgs = [
    "--set"
    "FONTCONFIG_FILE"
    (toString (makeFontsConf {
      fontDirectories = [ "${finalAttrs.finalPackage}/share/fonts" ];
    }))
  ];

  meta = with lib; {
    description = "Feature-rich minimalist proximity-based UI for MPV player";
    homepage = "https://github.com/tomasklaen/uosc";
    license = licenses.gpl3Only;
    maintainers = with lib.maintainers; [ apfelkuchen6 ];
  };
})
