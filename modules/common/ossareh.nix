{
  pkgs,
  lib,
  userOptions ? {},
  ...
}: let
  opts =
    lib.recursiveUpdate {
      ssh = {
        signingKey = null;
      };
    }
    userOptions;
in {
  home.stateVersion = "24.11";

  home.file = {
    ".config/nixpkgs/config.nix" = {
      text = ''
        {
          packageOverrides = pkgs: {
            nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
              inherit pkgs;
            };
          };
        }
      '';
    };
  };

  home.packages = with pkgs; [
    # bins
    _1password-cli
    devenv
    dogdns
    duf
    dust
    procs
    # inactive until https://github.com/LnL7/nix-darwin/pull/972 is merged
    # ollama

    # fonts
    cascadia-code
    font-awesome
  ];

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
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "P. Michael Ossareh";
    userEmail = "ossareh@gmail.com";
    signing = {
      key =
        if opts.ssh.signingKey == null
        then builtins.throw "Please set userOptions.ssh.signingKey"
        else opts.ssh.signingKey;
      signByDefault = true;
    };
    extraConfig = {
      gpg = {
        format = "ssh";
        ssh = {
          # 1Password is installed via homebrew until this is remedied:
          # https://github.com/NixOS/nixpkgs/issues/254944
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
      };
      init = {
        defaultBranch = "main";
      };
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
  programs.jq.enable = true;
  programs.ripgrep.enable = true;
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
  # maybe not useful after switch to fish?
  programs.starship.enable = true;
  programs.wezterm = {
    enable = true;
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
      "git-firefly"
      "nix"
      "org"
      "r"
      "toml"
    ];
    userSettings = {
      auto_update = false;
      vim_mode = true;
      load_direnv = "shell_hook";

      buffer_font_family = "Cascadia Code NF";
      buffer_font_size = 14;

      assistant = {
        enabled = true;
        version = "2";
        default_model = {
          provider = "copilot_chat";
          model = "gpt-4o";
        };
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
    };
  };
  programs.zellij.enable = true;
  programs.zoxide.enable = true;
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    history.extended = true;
    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  fonts.fontconfig.enable = true;

  home.activation = {
    # use the hm DAG hook to write these _after_ everything has been created
    # https://github.com/LnL7/nix-darwin/issues/214#issuecomment-2525273333
    #
    # Consider replacing with: https://github.com/hraban/mac-app-util
    trampolineCreation = lib.hm.dag.entryAfter ["writeBoundary"] ''
      apps_source="$HOME/Applications/Home Manager Apps"
      moniker="Nix Trampolines"
      app_target_base="$HOME/Applications"
      app_target="$app_target_base/$moniker"
      mkdir -p "$app_target"
      ${pkgs.rsync}/bin/rsync --archive --checksum --chmod=-w --copy-unsafe-links --delete "$apps_source/" "$app_target"
    '';
  };
}
