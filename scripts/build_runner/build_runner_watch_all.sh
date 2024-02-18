#!/bin/bash

# Proje dizini
project_dir="/Users/mehmetfiskindal/project/fiadisyon"

# Modül dizini
module_dir="/Users/mehmetfiskindal/project/fiadisyon/packages/gen"

# Proje için build_runner çalıştırma fonksiyonu
run_build_runner_in_project() {
  local dir="$1"
  # Proje dizininde build_runner çalıştırma işlemleri burada gerçekleştirilir
  cd "$dir"
  flutter pub run build_runner watch --delete-conflicting-outputs
}

# Modül için build_runner çalıştırma fonksiyonu
run_build_runner_in_module() {
  local dir="$1"
  # Check if the directory contains a pubspec.yaml file
  if [ ! -f "$dir/pubspec.yaml" ]; then
    echo "Error: No pubspec.yaml file found in $dir"
    return 1
  fi

  # Run build_runner in the directory
  cd "$dir"
  flutter pub run build_runner watch --delete-conflicting-outputs
}
# Modül için build_runner çalıştır
run_build_runner_in_module "$module_dir" &
# Proje için build_runner çalıştır
run_build_runner_in_project "$project_dir" &

