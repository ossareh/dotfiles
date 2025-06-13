{
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) disabled;
in {
  networking = {
    computerName = "Ossareh's M2 Macbook Air";
    hostName = "plinth";
    wakeOnLan = disabled;
  };

  system = {
    primaryUser = "ossareh";
    stateVersion = 6;
  };
}
