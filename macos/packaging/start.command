#!/bin/zsh

app_path="/Applications/SkiVPN.app"

if [[ ! -d "$app_path" ]]; then
  osascript -e 'display alert "SkiVPN is not installed" message "Drag SkiVPN.app to Applications before starting it."'
  exit 1
fi

xattr -cr "$app_path" 2>/dev/null || true
open "$app_path"