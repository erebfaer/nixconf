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
  version = "2025-06-01";

  src = fetchFromGitHub {
    owner = "Xilmi";
    repo = "OpenXcom";
    rev = "2df0117ecd207b8213d8c4a8a9ca23e799f42959";
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
