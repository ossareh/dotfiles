{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.zedEditor;
in {
  options.${namespace}.programs.zedEditor = {
    enable = lib.mkEnableOption "zed editor";
  };

  config = lib.mkIf cfg.enable {
    programs.zed-edtiro = {
      enable = true;
      extensions = [
        "mcp-server-context7"
        "git-firefly"
        "nix"
        "org"
        "r"
        "toml"
        "zig"
        # themes
        "catppuccin"
        "catppuccin-icons"
      ];

      settings = {
        auto_update = false;
        vim_mode = true;
        load_direnv = "shell_hook";

        buffer_font_family = "Cascadia Code NF";
        buffer_font_size = 14;

        theme = "Catppuccin Frappé";
        icon_theme = "Catppuccin Frappé";

        assistant = {
          enabled = true;
          version = "2";
          default_model = {
            provider = "google";
            model = "gemini-2.5-pro-preview-03-25";
          };
          inline_assistant_model = {
            provider = "google";
            model = "gemini-2.5-flash-preview-04-17";
          };
          commit_message_model = {
            provider = "google";
            model = "gemini-2.5-flash-preview-04-17";
          };
          thread_summary_model = {
            provider = "google";
            model = "gemini-2.5-flash-preview-04-17";
          };
        };

        journal = {
          hour_format = "hour24";
          path = "~/dev/src/github.com/ossareh/org"; # Home Manager handles tilde expansion
        };

        languages = {
          Markdown = {
            format_on_save = "on";
          };
          Nix = {
            formatter = {
              external = {
                command = "alejandra";
              };
            };
          };
          R = {
            tab_size = 2;
          };
        };
      };
    };
  };
}
