{ home-manager, pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.ossareh = {
    name = "ossareh";
    home = "/Users/ossareh";
  };

  home-manager.users.ossareh = { lib, ...}: {
    home.stateVersion = "24.11";

    home.packages = with pkgs; [
      # bins
      dogdns
      duf
      dust
      procs
      shellcheck
      signal-desktop
      #starship

      # gui's
      iterm2
      signal-desktop
      slack
      telegram-desktop
      whatsapp-for-mac
      zoom-us

      # fonts
      cascadia-code
      font-awesome
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    programs.zsh.enable = true;

    programs.git = {
      enable = true;
      delta.enable = true;
    };

    programs.bat.enable = true;
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
 
        if wezterm.config_builder then
          config = wezterm.config_builder()
        end
 
        config.color_scheme = 'Nord (Gogh)'
        config.font = wezterm.font('Cascadia Code')
        config.font_size = 14.0
        config.front_end = "WebGpu"

        return config
      '';
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
