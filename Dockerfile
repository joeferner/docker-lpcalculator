FROM debian

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y wget fping gdebi p7zip-full 
RUN apt-get install -y libqtgui4 libqt4-network libqt4-xml libqt4-xmlpatterns libqt4-script
RUN apt-get install -y lib32z1 lib32ncurses5 lib32stdc++6
RUN apt-get install -y wine32 cabextract
RUN apt-get install -y mono-complete
RUN wget -O /bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && chmod a+x /bin/winetricks
RUN apt-get install -y samba

ENV QT_GRAPHICSSYSTEM native
ENV WINEARCH win32
ENV WINE wine32
ADD lpcalculator.sh /lpcalculator.sh
