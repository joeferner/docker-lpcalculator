#!/bin/bash

echo "You may need to run 'xhost local:root'"
echo "On first run:"
echo "  wine32 wineboot -i"
echo "  /bin/winetricks dotnet20"
echo "  /bin/winetricks gdiplus"
echo "  wine32 /local/PCBM_LP_Calculator_V2010.exe"
echo "  /lpcalculator.sh"

docker start -i lpcalculator
if [ $? -ne 0 ]; then
  docker run -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v `pwd`:/local \
    -h lpcalculator \
    --name=lpcalculator \
    lpcalculator \
    "$@"
fi
