#!/bin/bash

cd "$(dirname "$0")" >/dev/null
if [[ ! -d "build" ]]; then mkdir "build"; fi
cd build
rm -r -f * .*

/ucrt64/qt5-static/bin/qmake.exe .. \
    USE_SDL_GAMEPAD=1 \
    SDL_LIBS="`pkg-config --libs --static sdl2 | sed 's/\s*-lSDL2main\b//g'` -Wl,--no-undefined" \
    SDL_INCLUDES="`pkg-config --cflags-only-I --static sdl2 | sed 's/s*-I//g'`" \
    INSTALLDIR="$PWD/dist"

if [ $? -eq 0 ]; then make -j; fi
if [ $? -eq 0 ]; then make install; fi
cd ..
exit $?

