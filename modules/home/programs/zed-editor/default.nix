{
  config,
  lib,
  namespace,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.${namespace}.programs.zed-editor;

  generatedConfigFile = pkgs.writeText "zed_settings.json" (builtins.toJSON cfg.config);
  writeableConfigFile = "${config.home.homeDirectory}/.config/zed/settings.json";
in {
  options.${namespace}.programs.zed-editor = {
    enable = lib.mkEnableOption "zed-editor";
    config = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "zed-editor configuration";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor.enable = false;

    home.activation.manageZedConfig = inputs.home-manager.lib.hm.dag.entryAfter ["writeBoundary"] ''
            # make sure the directory exists
            mkdir -p "$(${pkgs.coreutils}/bin/dirname "${writeableConfigFile}")"

            # write the file if its not there
            if [ ! -f "${writeableConfigFile}" ]; then
              echo "✅ Initializing config at ${writeableConfigFile}"
              ${pkgs.jq}/bin/jq < "${generatedConfigFile}" > "${writeableConfigFile}"
            fi

            # COMPARE: Check if the user's file has diverged from the Nix-managed one.
            if ! ${pkgs.nodePackages.json-diff}/bin/json-diff --sort "${generatedConfigFile}" "${writeableConfigFile}" >/dev/null; then
              cat >&2 <<EOF

      ⚠️  WARNING: Configuration has diverged for zed.
         Your local settings at:
          '${writeableConfigFile}'
         do not match the source in your Nix configuration.

         To see the diff, run:
          nix shell nixpkgs#nodePackages.json-diff --command json-diff '${generatedConfigFile}' '${writeableConfigFile}'

         Then backport the changes to the nix-expression and re-run the build

      EOF
              exit 1
            fi

    '';
  };
}
