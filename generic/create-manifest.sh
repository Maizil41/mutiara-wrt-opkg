#!/bin/bash

# Direktori repositori
repo_dir=$1

if [ -z "$repo_dir" ] || [ ! -d "$repo_dir" ]; then
  echo "Usage: $0 <repo_directory>" >&2
  exit 1
fi

manifest_file="$repo_dir/Packages.manifest"

# Buat atau kosongkan file manifest
> "$manifest_file"

# Tambahkan header
echo "Repository: My Custom Repo" >> "$manifest_file"
echo "Date: $(date)" >> "$manifest_file"
echo "" >> "$manifest_file"

# Daftar paket
for pkg in $(find "$repo_dir" -name '*.ipk' | sort); do
  name=$(basename "$pkg" | cut -d'_' -f1)
  version=$(basename "$pkg" | cut -d'_' -f2 | cut -d'-' -f1)
  echo "Package: $name" >> "$manifest_file"
  echo "Version: $version" >> "$manifest_file"
  echo "Filename: $(basename "$pkg")" >> "$manifest_file"
  echo "Size: $(stat -c%s "$pkg")" >> "$manifest_file"
  echo "" >> "$manifest_file"
done

echo "Manifest created at $manifest_file"

