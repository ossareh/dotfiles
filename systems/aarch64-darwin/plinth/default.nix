{
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in {
  ossarehnix = {
    stacks = {
      comms = enabled;
    };
  };
  system.stateVersion = 6;
}
