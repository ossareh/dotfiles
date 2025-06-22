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

      # git-hook packages
      gitHooks.enabledPackages
    ];

    shellHook = ''
      ${gitHooks.shellHook}
    '';
  }
