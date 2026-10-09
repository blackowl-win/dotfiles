{ user, ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = user;
  users.users.${user} = {
    home = "/Users/${user}";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      _HIHideMenuBar = true;  # auto-hide the menu bar
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";  # list view by default
    finder.CreateDesktop = false;          # clean desktop
    trackpad.Clicking = true;              # tap to click
  };
  nix-homebrew = {
    enable = true;
    inherit user;
  };
  homebrew = {
    enable = true;
    onActivation.cleanup = "none";  # zap remove anything not listed here
    onActivation.autoUpdate = false; # true default
    onActivation.extraFlags = [ "--force" ];
    brews = [
      "herdr"
      # Development
    "git"
    "gh"
#    "node"
#    "graphify"
    "graphviz"
    "pnpm"
    "python@3.13"
    "uv"

    # AWS / Infrastructure
    "awscli"
    "opentofu"
    "terraform"
    "helm"
    #"automic-vault"
    # Kubernetes
    "kubernetes-cli"
    "kubectx"
    #"k9s"
    "kubeseal"
    #"flux"
    "fluxcd/tap/flux"
    "pluto"

    # Database
    "mongosh"
    "mongodb-database-tools"
    "redis"
    "redpanda"
    "redpanda-data/tap/redpanda"
    # CI/CD and security
    "act"
    "actionlint"
    "shellcheck"
#    "snyk"

    # Testing
    "k6"
    "hey"

    # Terminal utilities
    "ripgrep"
    "fd"
    "fzf"
    "yq"
    "yamllint"
    "wget"
    "watch"
    "pandoc"
    "terraform"
    {
    name = "hashicorp/tap/terraform";
    link = true;
  }
    ];
    casks = [
      "wezterm"
      "claude-code"
      "codex"
      "baby-menu"
      "automic-vault/isotopes/automic-vault"
    ];
    taps = [
    "mongodb/brew"
    "hashicorp/tap"
    "redpanda-data/tap"
 #   "snyk/tap"
    "fluxcd/tap"
    "kunchenguid/tap"
    "automic-vault/isotopes"
    ];
  };
}
