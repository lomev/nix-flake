{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";

      settings = {
        # Change startup page to blank
        "browser.startup.homepage" = "https://lukesmith.xyz";
        "browser.newtabpage.enabled" = false;

        # Change UI
        "browser.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "browser.compactmode.show" = true;
        "browser.uidensity" = "1";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Enable HTTPS-Only Mode
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;

        # Privacy settings
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;
        
        # Disable all sorts of telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        
        # As well as Firefox 'experiments'
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;
        
        # Disable Pocket Integration
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
      };

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        clearurls
        decentraleyes
        bypass-paywalls-clean
        istilldontcareaboutcookies
        libredirect 
        search-by-image
        web-archives
        vimium
        sponsorblock
        darkreader
      ];

      search = {
        force = true;
        default = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "NixOS Wiki" = {
            urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@nw" ];
          };
          "Wikipedia (en)".metaData.alias = "@wiki";
          "Google".metaData.hidden = true;
          "Amazon.com".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;
        };
      };

      userChrome = ''
        tab .tab-icon, .tab-icon-image {
          filter: grayscale(1) brightness(0.5) contrast(1) invert(1); /* Remove invert(1) to make it dark */
        }

        [uidensity="compact"]:root {
          --tab-min-height: 22px !important;
          --newtab-margin: -3px 0 -3px -3px !important;
        }
        
        :root[uidensity="compact"] #tabbrowser-tabs {
          --tab-min-height: var(--tab-min-height) !important;
        }
        
        .tabbrowser-tab {
          max-height: var(--tab-min-height) !important;
        }
        
        .tabs-newtab-button {
          margin: var(--newtab-margin) !important;
        }
      '';
      userContent = ''
      '';
    };
  };
}
