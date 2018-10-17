local mash = {"ctrl", "cmd", "alt"}
local mash_app = {"ctrl", "cmd", "alt", "shift"}

local hyper = {"ctrl", "alt", "cmd"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.2
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})

hs.notify.new({
    title='Hammerspoon',
    informativeText='Config loaded!'
}):send()
