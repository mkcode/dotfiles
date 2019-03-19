
-- hs.application.find('iTerm'):mainWindow():focusTab(2)


hs.logger.defaultLogLevel="info"

hyper = {"cmd","ctrl"}

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall


Install:andUse("BingDaily")

Install:andUse("Caffeine",
               {
                 hotkeys = {
                   toggle = { hyper, "c" } },
                 start = true
               }
)

-- Disable window size transition animations
hs.window.animationDuration = 0.0
Install:andUse("MiroWindowsManager",
               {
                 hotkeys = {
                   up = {hyper, "k"},
                   right = {hyper, "l"},
                   down = {hyper, "j"},
                   left = {hyper, "h"},
                   fullscreen = {hyper, "f"}
                 }
               }
)

Install:andUse("TextClipboardHistory",
               {
                 config = {
                   show_in_menubar = false
                 },
                 hotkeys = {
                   toggle_clipboard = { hyper, "v" } },
                 start = true
               }
)

Install:andUse("ReloadConfiguration",
               {
                 config = {
                   watch_paths = {
                     hs.fs.pathToAbsolute(hs.configdir.."/init.lua") }
                    -- hs.configdir }
                 },
                 hotkeys = {
                   reloadConfiguration = { hyper, "=" } },
                 start = true
               }
)

Install:andUse("FadeLogo",
               {
                 config = {
                   fade_in_time = 0,
                   run_time = 0,
                   fade_out_time = 0.4
                 },
                 start = true
               }
)
