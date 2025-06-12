{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cachix
    curl
    git
    git-lfs
    gnugrep
    vim
    zsh
  ];
}
