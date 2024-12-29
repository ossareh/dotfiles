{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.vim
  ];
}
