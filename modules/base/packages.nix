{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    git
    git-lfs
    gnugrep
    vim
    zsh
  ];

}
