--INPUTMANAGER--
local InputManager = {
  CMD_ALT = {"cmd", "alt"},
  CMD_ALT_CTRL = {"cmd", "alt", "ctrl"},
  CMD_ALT_CTRL_SHIFT = {"cmd", "alt", "ctrl", "shift"}
}

hs.hotkey.bind(InputManager.CMD_ALT, "l", function()
	hs.caffeinate.lockScreen()
end)

return InputManager
