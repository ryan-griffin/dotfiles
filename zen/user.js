/****************************************************************************
 * BetterZen                                                                *
 * "Ex nihilo nihil fit"                                                    *
 * version: 148                                                             *
 * url: https://github.com/yokoffing/Betterfox                              *
 ****************************************************************************/

/****************************************************************************
 * SECTION: SECUREFOX                                                       *
 ****************************************************************************/

// /** TRACKING PROTECTION ***/
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.download.start_downloads_in_tmp_dir", true);
user_pref("browser.uitour.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true);

/** OCSP & CERTS / HPKP ***/
user_pref("security.OCSP.enabled", 0);
user_pref("privacy.antitracking.isolateContentScriptResources", true);
user_pref("security.csp.reporting.enabled", false);

/** SSL / TLS ***/
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("security.tls.enable_0rtt_data", false);

/** DISK AVOIDANCE ***/
user_pref("browser.cache.disk.enable", false);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536);
user_pref("browser.sessionstore.interval", 60000);

// /** SHUTDOWN & SANITIZING ***/
user_pref("privacy.history.custom", true);

/** SPECULATIVE LOADING ***/
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.places.speculativeConnect.enabled", false);
user_pref("network.prefetch-next", false);

/** SEARCH / URL BAR ***/
user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
user_pref("network.IDN_show_punycode", true);

/** HTTPS-ONLY MODE ***/
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

/** DNS OVER HTTPS */
user_pref("network.trr.mode", 2);
user_pref("network.trr.uri", "https://dns.adguard-dns.com/dns-query");

/** PASSWORDS ***/
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.privateBrowsingCapture.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("signon.autofillForms", false);
user_pref("network.auth.subresource-http-auth-allow", 1);
user_pref("editor.truncate_user_pastes", false);

/** ADDRESSES + CREDIT CARDS */
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

/** HEADERS / REFERERS ***/
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

/** SAFE BROWSING ***/
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

/** MOZILLA ***/
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
user_pref("browser.search.update", false);
user_pref("permissions.manager.defaultsUrl", "");
user_pref("extensions.getAddons.cache.enabled", false);

/** TELEMETRY ***/
user_pref("datareporting.usage.uploadEnabled", false);

/** CRASH REPORTS ***/
user_pref("breakpad.reportURL", "");

/****************************************************************************
 * SECTION: PESKYFOX                                                        *
 ****************************************************************************/

/** MOZILLA UI ***/
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.aboutConfig.showWarning", false);

/** THEME ADJUSTMENTS ***/
user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS

/** URL BAR ***/
user_pref("browser.search.suggest.enabled", true);
user_pref("zen.urlbar.behavior", "float");

/** NEW TAB PAGE ***/
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);

/** PDF ***/
user_pref("browser.download.open_pdf_attachments_inline", true);

/** TAB BEHAVIOR ***/
user_pref("browser.bookmarks.openInTabClosesMenu", false);
user_pref("browser.menu.showViewImageInfo", true);
user_pref("browser.tabs.fadeOutUnloadedTabs", true);
user_pref("browser.startup.page", 1);
user_pref("findbar.highlightAll", true);
user_pref("zen.view.compact.toolbar-flash-popup", true);
user_pref("zen.tabs.ctrl-tab.ignore-pending-tabs", true);
user_pref("zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url", true);

/** XDG-DESKTOP-PORTAL ***/
user_pref("widget.use-xdg-desktop-portal.file-picker", 1); // LINUX

/****************************************************************************
 * SECTION: SMOOTHFOX                                                       *
 ****************************************************************************/

user_pref("general.smoothScroll.currentVelocityWeighting", "0.25");
user_pref("general.smoothScroll.stopDecelerationWeighting", "0.4");
user_pref("mousewheel.min_line_scroll_amount", 5);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 50);
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 120);
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 1250);
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 1000);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 12);
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 2000);
user_pref("mousewheel.default.delta_multiplier_y", 100);

user_pref("apz.gtk.pangesture.delta_mode", 2);
user_pref("apz.gtk.pangesture.pixel_delta_mode_multiplier", 25);

/****************************************************************************
 * END: BETTERFOX                                                           *
 ****************************************************************************/
