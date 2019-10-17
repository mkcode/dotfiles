
-- hs.application.find('iTerm'):mainWindow():focusTab(2)


hs.logger.defaultLogLevel="info"

hyper = {"cmd","ctrl"}

-- Keybindings for launching apps
appKeys = {
  b = "Brave Browser",
  c = "Google Chrome",
  e = "Emacs",
  f = "Finder",
  p = "Postman",
  s = "Safari",
  x = "xCode"
}

-- Bind 1 through x key to focus individual tabs in iTerm
highTabNumber = 5

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall


Install:andUse("BingDaily")

Install:andUse("Caffeine",
               {
                 hotkeys = {
                   toggle = { hyper, "\\" } },
                 start = true
               }
)

-- Disable window size transition animations
hs.window.animationDuration = 0.0

-- Add simple screen window movement commands

hs.hotkey.bind(hyper, "i", function() hs.window.focusedWindow():moveOneScreenWest() end)
hs.hotkey.bind(hyper, "o", function() hs.window.focusedWindow():moveOneScreenEast() end)

Install:andUse("MiroWindowsManager",
               {
                 hotkeys = {
                   up = {hyper, "k"},
                   right = {hyper, "l"},
                   down = {hyper, "j"},
                   left = {hyper, "h"},
                   fullscreen = {hyper, "m"}
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

-- App switching
-- Bind appKeys
for key, app in pairs(appKeys)
do
  hs.hotkey.bind(hyper, key, function()
                   hs.application.launchOrFocus(app)
  end)
end

-- Switch directly to individual tabs in iTerm
for i = 1,5
do
  hs.hotkey.bind(hyper, tostring(i), function()
                   hs.application.launchOrFocus("iTerm")
                   hs.application.find("iTerm"):mainWindow():focusTab(i)
  end)
end

-- FadeLogo is last to ensure that it confirms hammerspoon has fully loaded successfully
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
