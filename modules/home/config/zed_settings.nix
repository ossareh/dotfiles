{
  auto_install_extensions = {
    "git-firefly" = true;
    "lua" = true;
    "mcp-server-context7" = true;
    "nix" = true;
    "org" = true;
    "r" = true;
    "toml" = true;
    "zig" = false;

    # themes
    "catppuccin" = true;
    "catppuccin-icons" = true;
  };
  vim_mode = true;
  load_direnv = "shell_hook";

  buffer_font_family = "Cascadia Code NF";
  buffer_font_size = 14;
  theme = "Catppuccin Frappé";
  icon_theme = "Catppuccin Frappé";

  agent = {
    enabled = true;
    default_model = {
      provider = "google";
      model = "gemini-2.5-pro";
    };
    inline_assistant_model = {
      provider = "google";
      model = "gemini-2.5-flash";
    };
    commit_message_model = {
      provider = "google";
      model = "gemini-2.5-flash";
    };
    thread_summary_model = {
      provider = "google";
      model = "gemini-2.5-flash";
    };
  };

  edit_predictions = {
    mode = "subtle";
  };

  journal = {
    hour_format = "hour24";
    path = "~/dev/src/github.com/ossareh/org";
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
}
