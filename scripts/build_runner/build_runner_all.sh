#!/bin/bash

# Proje dizini
project_dir="/Users/mehmetfiskindal/Developer/fiadisyon"

# Modül dizini
module_dir="/Users/mehmetfiskindal/Developer/fiadisyon/packages/gen"

# Proje için build_runner çalıştırma fonksiyonu
run_build_runner_in_project() {
  local dir=$1

  # Proje dizininde build_runner çalıştırma işlemleri burada gerçekleştirilir
  cd "$dir"
  flutter pub run build_runner build --delete-conflicting-outputs
}

# Modül için build_runner çalıştırma fonksiyonu
run_build_runner_in_module() {
  local dir=$1

  # Modül dizininde build_runner çalıştırma işlemleri burada gerçekleştirilir
  cd "$dir"
  flutter pub run build_runner build --delete-conflicting-outputs
}

# Modül için build_runner çalıştır
run_build_runner_in_module "$module_dir" &
# Proje için build_runner çalıştır
run_build_runner_in_project "$project_dir" &
