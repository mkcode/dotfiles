---@diagnostic disable: undefined-global
hs.logger.defaultLogLevel = "info"

local hyper = { "cmd", "ctrl" }

-- Keybindings for launching apps
local appKeys = {
	b = "Brave Browser",
	c = "Fantastical",
	e = "VimR",
	f = "Finder",
	p = "Postman",
	s = "Safari",
	w = "Google Chrome",
	x = "xCode",
}

-- Bind 1 through x key to focus individual tabs in iTerm
local highTabNumber = 5

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

Install:andUse("BingDaily", { uhd_resolution = true })

Install:andUse("Caffeine", {
	hotkeys = {
		toggle = { hyper, "\\" },
	},
	start = true,
})

-- Disable window size transition animations
hs.window.animationDuration = 0.0

-- Add simple screen window movement commands

hs.hotkey.bind(hyper, "i", function()
	hs.window.focusedWindow():moveOneScreenWest()
end)
hs.hotkey.bind(hyper, "o", function()
	hs.window.focusedWindow():moveOneScreenEast()
end)

Install:andUse("MiroWindowsManager", {
	hotkeys = {
		up = { hyper, "k" },
		right = { hyper, "l" },
		down = { hyper, "j" },
		left = { hyper, "h" },
		fullscreen = { hyper, "m" },
	},
})

Install:andUse("TextClipboardHistory", {
	config = {
		show_in_menubar = false,
	},
	hotkeys = {
		toggle_clipboard = { hyper, "v" },
	},
	start = true,
})

Install:andUse("ReloadConfiguration", {
	config = {
		watch_paths = {
			hs.fs.pathToAbsolute(hs.configdir .. "/init.lua"),
		},
		-- hs.configdir }
	},
	hotkeys = {
		reloadConfiguration = { hyper, "=" },
	},
	start = true,
})

-- App switching
-- Bind appKeys
for key, app in pairs(appKeys) do
	hs.hotkey.bind(hyper, key, function()
		hs.application.launchOrFocus(app)
	end)
end

-- Switch directly to individual tabs in iTerm
for i = 1, highTabNumber do
	hs.hotkey.bind(hyper, tostring(i), function()
		hs.application.launchOrFocus("iTerm")
		hs.application.find("iTerm"):mainWindow():focusTab(i)
	end)
end

-- System device name for the UAD Apollo
local apolloDeviceName = "Universal Audio Thunderbolt"

-- System commands to remap to send to UAD Console app with fn and cmd modifiers.
local keyMapping = {
	MUTE = "f10",
	SOUND_DOWN = "f11",
	SOUND_UP = "f12",
}

-- This eventTap listens for sound up, sound down, and mute media key events.
-- When it encounters them, it sends the apollo console specific commands to do
-- the equivalent function. This event tap will be turned on when the apollo audio
-- device is selected and turned off when it is not selected.
local apolloEventTap = hs.eventtap.new({ hs.eventtap.event.types.systemDefined }, function(event)
	local data = event:systemKey()

	if (keyMapping[data["key"]] == nil) or (data["down"] == true and data["repeat"] == false) then
		return true, nil
	end

	hs.eventtap.event.newKeyEvent({ "fn", "cmd" }, keyMapping[data["key"]], true):post()
	hs.eventtap.event.newKeyEvent({ "fn", "cmd" }, keyMapping[data["key"]], false):post()

	return true, nil
end)

-- Setup the audio device watcher to turn on and off the keyboard intercept
hs.audiodevice.watcher.setCallback(function(event)
	if event ~= "dOut" then
		return
	end

	local currentOutputDevice = hs.audiodevice.defaultOutputDevice():name()
	if currentOutputDevice == apolloDeviceName then
		apolloEventTap:start()
	else
		apolloEventTap:stop()
	end
end)

-- The previous watcher only fires on change events. Turn it on if it is already selected.
local currentOutputDevice = hs.audiodevice.defaultOutputDevice():name()
if currentOutputDevice == apolloDeviceName then
	apolloEventTap:start()
end

-- FadeLogo is last to ensure that it confirms hammerspoon has fully loaded successfully
Install:andUse("FadeLogo", {
	config = {
		fade_in_time = 0,
		run_time = 0,
		fade_out_time = 0.4,
	},
	start = true,
})
