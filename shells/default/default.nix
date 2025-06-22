{
  inputs,
  pkgs,
  mkShell,
  system,
  ...
}: let
  gitHooks = inputs.self.checks.${system}.git-hooks;
in
  mkShell {
    packages = with pkgs; [
      nil
      nixd

      # via overlay; provides flake command: https://github.com/snowfallorg/flake?tab=readme-ov-file#usage
      snowfallorg.flake

      # pkgs included via checks
      gitHooks.enabledPackages
    ];

    shellHook = gitHooks.shellHook;
  }
