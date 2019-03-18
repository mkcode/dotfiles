
-- hs.application.find('iTerm'):mainWindow():focusTab(2)


hs.logger.defaultLogLevel="info"

hyper = {"cmd","ctrl"}

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

Install=spoon.SpoonInstall

Install:andUse("TextClipboardHistory",
               {
                 config = {
                   show_in_menubar = false,
                 },
                 hotkeys = {
                   toggle_clipboard = { hyper, "v" } },
                 start = true
               }
)

Install:andUse("ReloadConfiguration",
               {
                 hotkeys = {
                   reloadConfiguration = { hyper, "=" } },
                 start = true
               }
)
