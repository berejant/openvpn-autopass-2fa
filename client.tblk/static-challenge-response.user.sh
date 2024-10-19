#!/usr/bin/env sh
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

if [[ $SCRIPT_DIR = */Users/*  ]]; then
  USER=$(echo $SCRIPT_DIR | grep -o "Users/[^\/]*/"  | cut -d / -f 2); 
else
  USER=$(ls -d /Users | grep -v Shared | head -n 1);
fi

if [ -f "/opt/homebrew/bin/totp-keychain" ]; then
  TOTP="/opt/homebrew/bin/totp-keychain"
elif [ -f "/usr/local/bin/totp-keychain" ]; then
  TOTP="/usr/local/bin/totp-keychain"
else
  TOTP="totp-keychain";
fi

sudo -u "${USER}" "${TOTP}" get my-openvpn || exit 3
