{ pkgs, ... }:

{
	programs.rofi = {
		enable = true;
		package = pkgs.rofi;
		plugins = with pkgs; [
			rofi-calc
			rofi-emoji
#			rofi-obsidian
			rofi-top
#			rofi-rbw
#			rofi-systemd
#			rofi-bluetooth
#			rofi-screenshot
			rofi-power-menu
#			rofi-pulse-select
#			rofi-file-browser
#			rofi-network-manager
		];
		# obsidian:rofi-obsidian
		extraConfig = {
			modi = "combi,calc,drun,keys,emoji,top,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
			show-icons = true;
			disable-history = true;
			sidebar-mode = true;
			auto-select = false;
			matching = "glob"; /*normal regex glob fuzzy prefix*/
			scroll-method = 1;
		};
	};
}