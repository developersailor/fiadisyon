#!/bin/bash

# Flutter SDK'yi güncelle
echo "Flutter SDK güncelleniyor..."
flutter upgrade

# Projedeki Flutter paketlerini güncelle
echo "Projedeki Flutter paketleri güncelleniyor..."
flutter pub get

# packages klasöründeki her bir paketi güncelle
echo "packages klasöründeki paketler güncelleniyor..."
for dir in ./packages/*/
do
  dir=${dir%*/}
  echo "Paket güncelleniyor: ${dir##*/}"
  cd ${dir}
  flutter pub get
  cd -
done

echo "Tüm paketler güncellendi."