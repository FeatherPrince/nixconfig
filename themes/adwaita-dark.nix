{ config, pkgs, ... }:

{
  #dconf.settings = {
  #  "org/gnome/desktop/background" = {
  #    picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
  #  };
  #  "org/gnome/desktop/interface" = {
  #    color-scheme = "prefer-dark";
  #  };
  #};

  gtk = { 
    enable = true;
  #  font = {
  #    name = "Noto Sans";
  #		package = "";
  #    size = 12;
  #  };
  #  iconTheme = {
  #    name = "";
  #    package
  #  };
    theme = {
  		name = "Adwaita-dark";
  		package = pkgs.gnome-themes-extra;
  	};
  #	gtk3.extraConfig = {
  #		gtk-application-prefer-dark-theme = true; #gtk-application-prefer-dark-theme=1
  #	};
  #  cursorTheme = {
  #    name = "Vanilla-DMZ";
  #    package = pkgs.vanilla-dmz;
  #  };
  };

  qt = {
    enable = true;
    style = {
  		package = pkgs.gnome-themes-extra;
  		name = "adwaita-dark";
  	};
  };

  fonts.fontconfig = {
  	enable = true;
  	defaultFonts = {
  		emoji = [
  			"Noto Emoji"
  		];
  		monospace = [
  			"Noto Sans Mono"
  			"Noto Sans Mono CJK"
  		];
  		sansSerif = [
  			"Noto Sans"
  			"Noto Sans CJK"
  		];
  		serif = [
  			"Noto Serif"
  			"Noto Serif CJK"
  		];
  	};
  };
}
