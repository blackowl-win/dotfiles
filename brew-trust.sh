
#!/usr/bin/env bash
set -euo pipefail

# Explicitly approved third-party Homebrew formulae.
TRUSTED_FORMULAE=(
  "fluxcd/tap/flux"
  "hashicorp/tap/terraform"
  "mongodb/brew/mongodb-database-tools"
  "redpanda-data/tap/redpanda"
)

# Explicitly approved third-party casks.
TRUSTED_CASKS=(
  "automic-vault/isotopes/automic-vault"
)

echo "Configuring trusted Homebrew packages..."

for formula in "${TRUSTED_FORMULAE[@]}"; do
  echo "Trusting formula: $formula"
  brew trust --formula "$formula"
done

for cask in "${TRUSTED_CASKS[@]}"; do
  echo "Trusting cask: $cask"
  brew trust --cask "$cask"
done

echo "Homebrew trust configuration complete."

