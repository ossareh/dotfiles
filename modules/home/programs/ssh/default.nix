{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.ssh;
in {
  options.${namespace}.programs.ssh = {
    enable = lib.mkEnableOption "ssh";
  };

  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
      matchBlocks."*".extraOptions = {
        IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
      };
      matchBlocks."github.com".extraOptions = {
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
