--grid-manager.lua
--handles window tiling, full screen and minimize
local InputManager = require "lib.input-manager"
local WindowManager = require "lib.window-manager"

local ScreencastingManager = {}

local screencastCfg = {
  ["width"] = 2560,
  ["height"] = 1448
}
function ScreencastingManager:setKeyBindings ()
  hs.hotkey.bind(InputManager.CMD_ALT_CTRL_SHIFT, "c", function()
    WindowManager:SetWindow(screencastCfg["width"]/2, screencastCfg["height"]/2)
  end)

  hs.hotkey.bind(InputManager.CMD_ALT_CTRL_SHIFT, "Left", function()
    WindowManager:SetWindow(screencastCfg["width"]/4, screencastCfg["height"]/2, -1/2)
  end)

  hs.hotkey.bind(InputManager.CMD_ALT_CTRL_SHIFT, "Right", function()
    WindowManager:SetWindow(screencastCfg["width"]/4, screencastCfg["height"]/2, 1/2)
  end)

end

function ScreencastingManager:init()
	--no window animations
	hs.window.animationDuration = 0

	--no margins between windows
  hs.grid.setMargins(hs.geometry(0, 0))

  self:setKeyBindings()
	--init 2 by 2 grid for each screen
  -- for i, screen in ipairs(hs.screen.allScreens()) do
  --   hs.grid.setGrid('3x3', screen)
  -- end

end

return ScreencastingManager
