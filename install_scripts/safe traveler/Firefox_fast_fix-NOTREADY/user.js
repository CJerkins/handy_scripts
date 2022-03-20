// Search for text when start typing
user_pref("accessibility.typeaheadfind", true);

// Turn on notifications to show in Windows 10 Action Center
user_pref("alerts.useSystemBackend", false);

// disable Firefox to install and run studies
user_pref("app.shield.optoutstudies.enabled", false);

// Do not show about:config warning message
user_pref("browser.aboutConfig.showWarning", false);

// Prevent bookmark menu and toolbar folder menu from closing when opening bookmark in a new tab
user_pref("browser.bookmarks.openInTabClosesMenu", false);

// Hide mobile bookmarks folder
user_pref("browser.bookmarks.showMobileBookmarks", true);

// Turn off Content Blocker notification
user_pref("browser.contentblocking.introCount", 20);

// Do not allow Firefox to make prezonalized extension recommendations
user_pref("browser.discovery.enabled", false);

// Do not auto-hide Downloads button in toolbar
user_pref("browser.download.autohideButton", false);

// Turn off counting URIs in private browsing mode
user_pref("browser.engagement.total_uri_count.pbm", false);

// Turn off Library Highlights
user_pref("browser.library.activity-stream.enabled", false);

// Do not notify about new features
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);

// Turn off recommended extensions
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);

// Do not recommend extensions as you browser
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

// Do not recommend features as you browse
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Turn off Snippets (Updates from Mozilla and Firefox)
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);

// Unpin Top Sites search shortcuts
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts", false);

// Does not offer import bookmarks, history and passwords from other browsers
user_pref("browser.newtabpage.activity-stream.migrationExpired", true);

// Show Highlights in 4 rows
user_pref("browser.newtabpage.activity-stream.section.highlights.rows", 4);

// Show Top Sites in 4 rows
user_pref("browser.newtabpage.activity-stream.topSitesRows", 4);

// Turn on "Firefox Experiments" settings page
user_pref("browser.preferences.experimental", false);

// Show search suggestions in Private Windows
user_pref("browser.search.suggest.enabled.private", true);

// Set number of saved closed tabs on 20
user_pref("browser.sessionstore.max_tabs_undo", 2);

// Set homepage and new windows on https://yandex.ru
user_pref("browser.startup.homepage", "https://duckduckgo.com/");

// Restore previous session
user_pref("browser.startup.page", 3);

// Double-сlick to close tabs feature
user_pref("browser.tabs.closeTabByDblclick", true);

// The last tab does not close the browser
user_pref("browser.tabs.closeWindowWithLastTab", false);

// Show Title Bar
user_pref("browser.tabs.drawInTitlebar", false);

// Show Drag Space
user_pref("browser.tabs.extraDragSpace", true);

// Open new tabs on the right
user_pref("browser.tabs.insertRelatedAfterCurrent", false);

// Open bookmarks in a background tab
user_pref("browser.tabs.loadBookmarksInBackground", true);

// Do not warn when attempt to close multiple tabs
user_pref("browser.tabs.warnOnClose", false);

// Show tab previews in the Windows taskbar
user_pref("browser.taskbar.previews.enable", true);

// Use touch density in toolbar
user_pref("browser.uidensity", 2);

// Decode copied URLs, containing UTF8 symbols
// https://bugzilla.mozilla.org/show_bug.cgi?id=1657526
user_pref("browser.urlbar.decodeURLsOnCopy", true);

// Do not send search term via ISP's DNS server
user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);

// Turn off "Firefox Default Browser Agent"
user_pref("default-browser-agent.enabled", false);

// Turn on lazy loading for images
user_pref("dom.dom.image-lazy-loading.enabled", true);

// Run extensions in Private browsing mode
user_pref("extensions.allowPrivateBrowsingByDefault", true);

// Turn off Extension Recommendations on the Add-ons Manager
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Turn off Pocket
user_pref("extensions.pocket.enabled", false);

// Highlight all occurrence when searching
user_pref("findbar.highlightAll", true);

// Use smooth scrolling
user_pref("general.autoScroll", false);

// Turn on AVIF support
user_pref("image.avif.enabled", true);

// Do not select when double-clicking text the space following the text
user_pref("layout.word_select.eat_space_to_next_word", false);

// Turn on media control (81)
// user_pref("media.hardwaremediakeys.enabled", true);

// Turn on MMB for openning link a new tab
user_pref("middlemouse.openNewWindow", true);

// Set automatic proxy configuration URL
user_pref("network.proxy.autoconfig_url", "https://antizapret.prostovpn.org/proxy.pac");
user_pref("network.proxy.type", 2);

// https://wiki.mozilla.org/Trusted_Recursive_Resolver
// Make DoH the browser's first choice but use regular DNS as a fallback
user_pref("network.trr.mode", 2);
// The URI for DoH server
user_pref("network.trr.uri", "https://mozilla.cloudflare-dns.com/dns-query");
// Set the IP address of the host name used in "network.trr.uri", to bypass using the system native resolver for it
user_pref("network.trr.bootstrapAddress", "1.1.1.1");

// Block new requests asking to allow notifications
user_pref("permissions.default.desktop-notification", 2);

// Send websites a "Do Not Track" signal always
user_pref("privacy.donottrackheader.enabled", true);

// Set time range to clear to "Everything"
user_pref("privacy.sanitize.timeSpan", 0);

// Prompts should be window modal by default
user_pref("prompts.defaultModalType", 3);

// Turn on UI customizations sync
user_pref("services.sync.prefs.sync.browser.uiCustomization.state", true);

// Show indicators on saved logins that are re-using those breached passwords
user_pref("signon.management.page.vulnerable-passwords.enabled", true);

// Turn on userChrome.css and userContent.css support
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Turn off Firefox starting automatically after Windows 10 restart
user_pref("toolkit.winRegisterApplicationRestart", false);

// Turn on Video Acceleration API (VA-API). For desktop environment based on Wayland
// user_pref("widget.wayland-dmabuf-vaapi.enabled", true);

// Turn on FFmpegDataDecoder. For display server based on Wayland
// user_pref("widget.wayland-dmabuf-webgl.enabled", true);