#!/bin/bash

cd $(dirname $0)

mkdir ./debs

pushd ./debs
  apt-get download \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    wget \
    gconf-service-backend \
    gconf2-common \
    libasound2-data \
    libdbus-glib-1-2 \
    libdbusmenu-glib4 \
    libdbusmenu-gtk4 \
    libindicator7 \
    libnss3-nssdb \
    ;
popd

mkdir ./fs
for deb in ./debs/*.deb; do
  dpkg -x $deb ./fs/
done

mkdir ./libs
cp --recursive --dereference ./fs/usr/lib/x86_64-linux-gnu/* libs/
