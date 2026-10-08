
#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Link dotfiles directory
ln -sfn "$DIR" "$HOME/.dotfiles"

# Enable required Nix experimental features
# for nix-darwin and Home Manager.
exec sudo env \
  NIX_CONFIG="experimental-features = nix-command flakes" \
  darwin-rebuild switch --flake "$DIR#mac"

