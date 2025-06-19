{
  config,
  namespace,
  lib,
  ...
}: let
  cfg = config.${namespace}.ux.dock;
in {
  options.${namespace}.ux.dock = {
    autohide = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Automatically hide the dock when not in use";
    };
    largeTileSize = lib.mkOption {
      type = lib.types.int;
      default = 96;
      description = "The size of the dock when it is in large mode";
    };
    smallTileSize = lib.mkOption {
      type = lib.types.int;
      default = 16;
      description = "The size of the dock when it is in small mode";
    };
  };

  config = {
    system.defaults = {
      dock = {
        autohide = cfg.autohide;
        largesize = cfg.largeTileSize;
        magnification = true;
        tilesize = cfg.smallTileSize;
        minimize-to-application = true;
        wvous-tr-corner = 2;
        wvous-tl-corner = 5;
      };
    };
  };
}
