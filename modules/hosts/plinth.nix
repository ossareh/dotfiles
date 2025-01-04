{pkgs, ...}: {
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.ossareh = {
    name = "ossareh";
    home = "/Users/ossareh";
  };

  home-manager.users.ossareh = {lib, ...}: {
    home.stateVersion = "24.11";

    home.packages = with pkgs; [
      # bins
      alejandra
      dogdns
      duf
      dust
      nil
      nixd
      procs
      shellcheck
      signal-desktop
      #starship

      # gui's
      signal-desktop
      slack
      telegram-desktop
      whatsapp-for-mac
      zoom-us

      # fonts
      cascadia-code
      font-awesome
    ];

    programs.zsh.enable = true;

    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = "P. Michael Ossareh";
      userEmail = "ossareh@gmail.com";
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOT2uG//X9GOpAEW2buUGrvGsuqym8ekXWGlEbIRvP9";
      };
      extraConfig = {
        merge = {
          conflictsytle = "zdiff3";
        };
      };
      delta = {
        enable = true;
        options = {
          navigate = true;
          side-by-side = true;
          hyperlinks = true;

          commit-decoration-style = "blue ol";
          commit-style = "raw";
          file-style = "omit";
          hunk-header-decoration-style = "blue box";
          hunk-header-file-style = "red";
          hunk-header-line-number-style = "#067a00";
          hunk-header-style = "file line-number syntax";
        };
      };
    };

    programs.bat = {
      enable = true;
      config = {
        theme = "Nord";
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
      ];
    };
    programs.btop.enable = true;
    programs.eza.enable = true;
    programs.fd.enable = true;
    programs.fzf.enable = true;
    programs.gh.enable = true;
    programs.jq.enable = true;
    programs.ripgrep.enable = true;
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''
        local config = {}

        config.color_scheme = "nord"
        config.font = wezterm.font("Cascadia Code")
        config.font_size = 12.0
        config.front_end = "WebGpu"
        config.hide_tab_bar_if_only_one_tab = true

        config.hyperlink_rules = wezterm.default_hyperlink_rules()

        return config
      '';
    };
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "nil"
      ];
      userSettings = {
        auto_update = false;
        vim_mode = true;

        buffer_font_family = "Cascadia Code";
        buffer_font_size = 14;

        languages = {
          Nix = {
            formatter = {
              external = {
                command = "alejandra";
              };
            };
          };
        };
      };
    };
    programs.zellij.enable = true;
    programs.zoxide.enable = true;

    fonts.fontconfig.enable = true;

    home.activation = {
      # use the hm DAG hook to write these _after_ everything has been created
      # https://github.com/LnL7/nix-darwin/issues/214#issuecomment-2525273333
      trampolineCreation = lib.hm.dag.entryAfter ["writeBoundary"] ''
        apps_source="$HOME/Applications/Home Manager Apps"
        moniker="Nix Trampolines"
        app_target_base="$HOME/Applications"
        app_target="$app_target_base/$moniker"
        mkdir -p "$app_target"
        ${pkgs.rsync}/bin/rsync --archive --checksum --chmod=-w --copy-unsafe-links --delete "$apps_source/" "$app_target"
      '';
    };
  };
}
