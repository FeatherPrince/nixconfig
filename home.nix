{ config, pkgs, programs, osConfig, ... }:

{
  imports =
    [
      ./fcitx.nix
			./themes/adwaita-dark.nix
			./rofi.nix
			./firefox.nix
    ];

	home = {
	username = "feather";
	homeDirectory = "/home/feather";
	stateVersion = "24.11";
	};
programs.fish.enable = true;
programs.fish.shellAliases = {
	ls="eza --icons=always -X -F=always";
	nrs="sudo nixos-rebuild switch";
};

programs.bash = {
	enable = true;
	bashrcExtra = ''
#bashrcExtra commands executed in non all shells including non interactive ones
'';
	shellAliases = {
		ls = "eza --icons=always -X -F=always";
		nrs = "sudo nixos-rebuild switch";
	};
	
	initExtra = ''
#initExtra commands executed in interactive shells
#export PS1='┌[\u@\H][\t]\n└[\w][\$]'
#export PS1='\[\e[91;2m\]┌[\[\e[0m\]\u@\H\[\e[91;2m\]][\[\e[0m\]\t\[\e[91;2m\]]\n└[\[\e[0m\]\w\[\e[91;2m\]][\[\e[0m\]\$\[\e[91;2m\]]\[\e[0m\]'
export PS1='\[\e[91m\]┌\[\e[91m\][\[\e[0m\]\u@\H\[\e[91m\]]\[\e[91m\][\[\e[0m\]\t\[\e[91m\]]\n\[\e[91m\]└\[\e[91m\][\[\e[0m\]\w\[\e[91m\]]\[\e[91m\][\[\e[0m\]\$\[\e[91m\]]\[\e[0m\]'
exec fish
'';
};

programs.firefox = {
	enable = true;
};
#xsession.windowManager.i3 = {
#	enable = true;
#	config.focus = { popup_during_fullscreen = smart };
#};



#		home.packages = with pkgs; [
#		];

#xsession = {
#	enable = true;
#	initExtra = ''
#lxsession &'';
#};
}
