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
    packages = with pkgs;
      [
        nil
        nixd
      ]
      ++ gitHooks.enabledPackages;

    shellHook = gitHooks.shellHook;
  }
