#!/bin/bash

/ucrt64/qt5-static/bin/qmake.exe .. \
USE_SDL_GAMEPAD=1 \
SDL_LIBS="-lmingw32 -mwindows -lSDL2 -lm -lkernel32 -luser32 -lgdi32 -lwinmm -limm32 -lole32 -loleaut32 -lversion -luuid -ladvapi32 -lsetupapi -lshell32 -ldinput8 -Wl,--no-undefined" \
SDL_INCLUDES="/ucrt64/include/SDL2" \
INSTALLDIR="$PWD/dist"
