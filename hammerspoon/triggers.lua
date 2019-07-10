local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"
local battery = require "hs.battery"
-- local wifi_control = require "wifi_control"
-- local bluetooth_control = require "bluetooth_control"

function applicationRunning(name)
  apps = application.runningApplications()
  found = false
  for i = 1, #apps do
    app = apps[i]
    if app:title() == name and (#app:allWindows() > 0 or app:mainWindow()) then
      found = true
    end
  end

  return found
end

local mash = {"cmd", "alt", "ctrl"}

hotkey.bind(mash, "R", function() hs.reload() end)
hotkey.bind(mash, "C", function() hs.openConsole() end)
hotkey.bind(mash, "A", function() application.launchOrFocus("Activity Monitor") end)
hotkey.bind(mash, "L", function() hs.caffeinate.startScreensaver() end)


hotkey.bind({"cmd", "alt", "ctrl"}, ";", function()
  hs.caffeinate.systemSleep()
end)

hotkey.bind({"ctrl"}, "1", function()
  application.launchOrFocus("iTerm")
end)
hotkey.bind({"alt"}, "1", function()
  application.launchOrFocus("iTunes")
end)

hotkey.bind({"ctrl"}, "2", function()
  if applicationRunning("MacVim") then
    application.launchOrFocus("MacVim")
  else
    alert.show("MacVim not running")
    application.launchOrFocus("iTerm")
  end
end)
hotkey.bind({"alt"}, "2", function()
  application.launchOrFocus("Atom")
end)

hotkey.bind({"ctrl"}, "3", function()
  application.launchOrFocus("Google Chrome")
end)
hotkey.bind({"alt"}, "3", function()
  application.launchOrFocus("Sublime Text 2")
end)

hotkey.bind({"ctrl"}, "4", function()
  application.launchOrFocus("Opera")
end)
hotkey.bind({"alt"}, "4", function()
  application.launchOrFocus("Safari")
end)

hotkey.bind({"alt"}, "6", function()
  application.launchOrFocus("Adobe Photoshop CC 2015")
end)

hotkey.bind({"ctrl"}, "8", function()
  application.launchOrFocus("Tweetbot")
end)
hotkey.bind({"alt"}, "8", function()
  application.launchOrFocus("Telegram")
end)

hotkey.bind({"alt"}, "9", function()
  application.launchOrFocus("Skype")
end)

hotkey.bind({"ctrl"}, "0", function()
  application.launchOrFocus("Airmail 2")
end)
hotkey.bind({"alt"}, "0", function()
  application.launchOrFocus("Slack")
end)

hotkey.bind({"ctrl"}, "-", function()
  application.launchOrFocus("Calendar")
end)

hotkey.bind({"ctrl"}, "=", function()
  application.launchOrFocus("iA Writer Pro")
end)
hotkey.bind({"alt"}, "=", function()
  application.launchOrFocus("LibreOffice")
end)

hotkey.bind({"ctrl"}, "Tab", function()
  application.launchOrFocus("Finder")
end)
hotkey.bind({"cmd", "shift"}, "E", function()
  application.launchOrFocus("Dash")
end)

hotkey.bind({"ctrl"}, "§", function()
  application.launchOrFocus("1Password 5")
end)
