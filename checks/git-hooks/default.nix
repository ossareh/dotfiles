{
  inputs,
  pkgs,
  ...
}:
inputs.git-hooks-nix.lib.${pkgs.system}.run {
  src = ../..;
  hooks = {
    alejandra.enable = true;
    markdownlint = {
      enable = true;
      args = ["--fix"];
      settings.configuration = {
        MD013 = {
          line_length = 100;
        };
      };
    };
  };
}
