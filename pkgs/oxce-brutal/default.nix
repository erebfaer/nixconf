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
  pname = "oxce-brutal";
  version = "9.2.7";

  src = fetchFromGitHub {
    owner = "Xilmi";
    repo = "OpenXcom";
    rev = "7643ad2a8072c2ddc8a050c35816b0ee3613ec43";
    hash = "sha256-AOj+PD0MQZr1dAZYBdw3FQ0zSMOdvcYiTzrk6UEjJbE=";
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
    description = "OXCE Brutal-AI fork";
    mainProgram = "oxce-brutal";
    homepage = "https://github.com/Xilmi/OpenXcom";
    license = lib.licenses.gpl3;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
