--grid-manager.lua
--handles window tiling, full screen and minimize
local InputManager = require "lib.input-manager"
local WindowManager = require "lib.window-manager"

local GridManager = {}

function GridManager.moveRight(window)
	if window then
		hs.grid.pushWindowRight(window)
	end
end

function GridManager.moveLeft(window)
	if window then
		hs.grid.pushWindowLeft(window)
	end
end

function GridManager.moveUp(window)
	if window then
		hs.grid.pushWindowUp(window)
	end
end

function GridManager.moveDown(window)
	if window then
	   hs.grid.pushWindowDown(window)
	end
end

function GridManager.guiSelect()
		hs.grid.toggleShow()
end

function GridManager.maximize(window)
	if window then
		hs.grid.maximizeWindow(window)
	end
end

function GridManager.minimize(window)
	if window then
		window:setFrame()
	end
end

function GridManager.increaseWidth(window)
  if window then
    hs.grid.resizeWindowWider(window)
  end
end

function GridManager.decreaseWidth(window)
  if window then
    hs.grid.resizeWindowThinner(window)
  end
end

function GridManager.increaseHeight(window)
  if window then
    hs.grid.resizeWindowTaller(window)
  end
end

function GridManager.decreaseHeight(window)
  if window then
    hs.grid.resizeWindowShorter(window)
  end
end

function GridManager:setKeyBindings()
	local me = self

	--window right half of screen--
	-- hs.hotkey.bind(InputManager.CMD_ALT, "Right", function()
	-- 	me.moveRight(hs.window.focusedWindow())
	-- end)
  --
	-- --window left half of screen--
	-- hs.hotkey.bind(InputManager.CMD_ALT, "Left", function()
	-- 	me.moveLeft(hs.window.focusedWindow())
	-- end)
  --
	-- --window top half of screen--
	-- hs.hotkey.bind(InputManager.CMD_ALT, "Up", function()
	-- 	me.moveUp(hs.window.focusedWindow())
	-- end)
  --
	-- --window bottom half of screen--
	-- hs.hotkey.bind(InputManager.CMD_ALT, "down", function()
	-- 	me.moveDown(hs.window.focusedWindow())
	-- end)
  --
	--window full screen--
	hs.hotkey.bind(InputManager.CMD_ALT, "f", function()
		me.maximize(hs.window.focusedWindow())
	end)

	--toggle grid view--
	hs.hotkey.bind(InputManager.CMD_ALT, "s", function()
		me.guiSelect()
	end)

	hs.hotkey.bind(InputManager.CMD_ALT_CTRL, "m", function()
    me.maximize(hs.window.focusedWindow())
	end)

	hs.hotkey.bind(InputManager.CMD_ALT_CTRL, "Up", function()
    WindowManager:AdjustWindow(1/2, 0, 1/2, 1/2)
	end)

	hs.hotkey.bind(InputManager.CMD_ALT_CTRL, "Down", function()
    WindowManager:AdjustWindow(1/2, 1/2, 1/2, 1/2)
	end)

	hs.hotkey.bind(InputManager.CMD_ALT_CTRL, "Right", function()
    WindowManager:AdjustWindow(1/2, 0, 1/2, 1)
	end)

	hs.hotkey.bind(InputManager.CMD_ALT_CTRL, "Left", function()
		-- me.decreaseWidth(hs.window.focusedWindow())
    WindowManager:AdjustWindow(0, 0, 1/2, 1)
	end)
end

function GridManager:init()

	--no window animations
	hs.window.animationDuration = 0

	--no margins between windows
  hs.grid.setMargins(hs.geometry(0, 0))

	--init 2 by 2 grid for each screen
  for i, screen in ipairs(hs.screen.allScreens()) do
    hs.grid.setGrid('3x3', screen)
  end

	self:setKeyBindings()
end

return GridManager
