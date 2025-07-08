{ config, pkgs, ... }:

	let
		lock-false = {
			Value = false;
			Status = "locked";
		};
		lock-true = {
			Value = true;
			Status = "locked";
		};
	in
{
	programs = {
		firefox = {
			enable = true;
			languagePacks = [ "en-US" "pl" "jp"];

			/* ---- POLICIES ---- */
			# Check about:policies#documentation for options.
			policies = {
				DisableTelemetry = true;					# true | false
				DisableFirefoxStudies = true;			# true | false
#				PasswordManagerEnabled = false;		# true | false
				OfferToSaveLogins = false;				# true | false
				PrimaryPassword = false;					# true | false
#				EnableTrackingProtection = {
#					Value= true;
#					Locked = true;
#					Cryptomining = true;
#					Fingerprinting = true;
#				};
#				DisablePocket = true;
#				DisableFirefoxAccounts = true;
#				DisableAccounts = true;
#				DisableFirefoxScreenshots = true;
#				OverrideFirstRunPage = "";
#				OverridePostUpdatePage = "";
#				DontCheckDefaultBrowser = true;
#				DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
#				DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
#				SearchBar = "unified"; # alternative: "separate"

				/* ---- EXTENSIONS ---- */
				# Check about:support for extension/add-on ID strings.
				# Valid strings for installation_mode are "allowed", "blocked",
				# "force_installed" and "normal_installed".
				ExtensionSettings = {
					"*".installation_mode = "allowed"; # blocks all addons except the ones specified below
					# uBlock Origin:
###################### TEMPLATE
#					"<addonId>" = {
#						install_url = "https://addons.mozilla.org/firefox/downloads/latest/<nameOfTheAddon>/latest.xpi";
#						installation_mode = "normal_installed";
#					};
######################
					"uBlock0@raymondhill.net" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
						installation_mode = "normal_installed";
					};
					"{21f1ba12-47e1-4a9b-ad4e-3a0260bbeb26}" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/remove-youtube-s-suggestions/latest.xpi";
						installation_mode = "normal_installed";
					};
					"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
						installation_mode = "normal_installed";
					};
					"{6b733b82-9261-47ee-a595-2dda294a4d08}" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/yomitan/latest.xpi";
						installation_mode = "normal_installed";
					};
				};
	
				/* ---- PREFERENCES ---- */
				# Check about:config for options.
#				Preferences = { 
#					"browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
#					"extensions.pocket.enabled" = lock-false;
#					"extensions.screenshots.disabled" = lock-true;
#					"browser.topsites.contile.enabled" = lock-false;
#					"browser.formfill.enable" = lock-false;
#					"browser.search.suggest.enabled" = lock-false;
#					"browser.search.suggest.enabled.private" = lock-false;
#					"browser.urlbar.suggest.searches" = lock-false;
#					"browser.urlbar.showSearchSuggestionsFirst" = lock-false;
#					"browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
#					"browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
#					"browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
#					"browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
#					"browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
#					"browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
#					"browser.newtabpage.activity-stream.showSponsored" = lock-false;
#					"browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
#					"browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
#				};
			};
		};
	};
}