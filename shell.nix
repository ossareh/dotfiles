# save this as shell.nix
{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    alejandra
    nil
    nix
  ];
}
