  { pkgs, ... }:
  {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ##########
    # XDG
    xdg-user-dirs
    ##########
    # GUI (requires a display server)
    audacious
    font-manager
    bitwarden
    librewolf
    firefox
    floorp

    proton-pass
    protonvpn-gui
    #protonvpn-cli
    protonmail-desktop
    #hydroxide
    #electron-mail # community fork of protonmail-desktop

    kdiskmark
    nano
    feh
    vlc
    mpv
    nemo-with-extensions
    ghostty
    wezterm
    alacritty
    vscodium
    rofi
    discord
    obsidian
    steam
    pavucontrol	#audio
#   noisetorch	#audio #enabled in programs
	easyeffects	#audio

    osu-lazer-bin

    davinci-resolve
    blender
    gimp3
    audacity
    krita
    libreoffice-fresh
    ##########
    # CLI (command line interface)
    btop
    yazi
    lf
    tuifimanager
    ##########
    # Terminal
    eza
    wget
    skim
    bat
    maim
    xclip
    slop
    libnotify # notify-send
    fastfetch
    pfetch-rs
    git
    killall
    ##########
    # Shells
    fish
    ##########
    # Daemons
    dunst
    polkit
    lxde.lxsession
    polkit_gnome
    soteria
    ffmpegthumbnailer
#    home-manager
    #themes
#    sleek-grub-theme
  ];
  fonts.packages = with pkgs; [
  #nerd-fonts
  #nerdfonts
  nerd-fonts.symbols-only
  noto-fonts
  noto-fonts-emoji
  noto-fonts-monochrome-emoji
  noto-fonts-cjk-sans
  noto-fonts-cjk-serif
  openmoji-color
  openmoji-black
  twitter-color-emoji
  twemoji-color-font
  #whatsapp-emoji-font #bugged
  emojione
  unicode-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  ipafont
  ipaexfont
  weather-icons
#  noto-fonts
#  noto-fonts-lgc-plus
#  noto-fonts-cjk-sans
#  noto-fonts-cjk-serif
#  noto-fonts-color-emoji
#  noto-fonts-emoji-blob-bin
#  noto-fonts-monochrome-emoji
#  nerd-fonts.symbols-only
  ];
}