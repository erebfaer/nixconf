{
  boost,
  cmake,
  fetchFromGitHub,
  lib,
  libGLU,
  libGL,
  openssl,
  pkg-config,
  SDL,
  SDL_image,
  SDL_mixer,
  SDL_gfx,
  stdenv,
  yaml-cpp,
  zlib,
}:
stdenv.mkDerivation {
  pname = "openxcom-extended";
  version = "1.0.0.2026.04.26";

  src = fetchFromGitHub {
    owner = "MeridianOXC";
    repo = "OpenXcom";
    rev = "3e722e09b655ab67acfb59fc8585dc70b583826c";
    hash = "sha256-ZvKj6cmTFE9GTMFBVEFoe4NOUxw+8EJIK/2iQ1K0TAE=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    boost
    libGL
    libGLU
    SDL
    SDL_gfx
    SDL_image
    SDL_mixer
    yaml-cpp
    openssl
    zlib
  ];

  meta = {
    description = "Open source clone of UFO: Enemy Unknown";
    homepage = "https://openxcom.org";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [cpages];
    platforms = lib.platforms.linux;
  };
}
