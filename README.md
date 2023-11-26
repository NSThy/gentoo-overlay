# PREPARE
git clone this repo to a local place
for example: 
```
git clone https://github.com/NSThy/gentoo-overlay.git /tmp/nsthy-overlay
```

install a tool
```
su

echo '#!/bin/bash

# Function to process directories recursively
process_directory() {
  local current_dir="$1"

  # Change to the current directory
  cd "$current_dir" || exit

  # Execute the command
  pkgdev manifest
  echo "Running pkgdev manifest in $current_dir"

  # Process subdirectories
  for dir in */; do
    if [ -d "$dir" ]; then
      process_directory "$dir"
    fi
  done

  # Move back to the parent directory
  cd ..
}

# Start processing from the current directory
process_directory "$(pwd)"' > /usr/bin/pkgdevsubmanifest && chmod 777 /usr/bin/pkgdevsubmanifest
```

# INSTALL
```
su

eselect repository create nsthy
mv /tmp/nsthy-overlay/* /var/db/repos/nsthy/
chown -R portage:portage /var/db/repos/nsthy
cd /var/db/repos/nsthy
pkgdevsubmanifest

exit
```
