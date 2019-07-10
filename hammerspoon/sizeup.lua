local Utility = require("Utility")

print('')
print('>> Loading Window Tiling for:')
print('   mash + Y,U,I and 4 arrow keys')

--------------------------------------------------
-- Window Tiling
--------------------------------------------------
hs.window.animationDuration = 0

local Tiling = {}

-- Alternatively, use the grid function
	-- docs » hs.grid http://www.hammerspoon.org/docs/hs.grid.html
function Tiling.MoveWindow ( WidthOffset, HeightOffset, WidthModifier, HeightModifier, win )
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	-- TESTING
	-- local a = tostring(win:size().h/max.h)
	-- local b = tostring(win:size().w/max.w)
	-- hs.alert.show(a..' '..b)
	-- local v = tostring(f.x)
	-- hs.alert.show(v)

	-- Determine start coordinates
	if (WidthOffset == 0) then
		f.x = max.x
	elseif Utility.isEmpty(WidthOffset) then
		f.x = f.x
	else
		f.x = max.x + (max.w * WidthOffset)
	end
	if (HeightOffset == 0) then
		f.y = max.y
	elseif Utility.isEmpty(HeightOffset) then
		f.y = f.y
	else
		f.y = max.y + (max.h * HeightOffset)
	end

	-- Determine width/height coordinates
	if Utility.isEmpty(WidthModifier) then
		f.w = f.w
	else
		f.w = max.w * WidthModifier
	end
	if Utility.isEmpty(HeightModifier) then
		f.h = f.h
	else
		f.h = max.h * HeightModifier
	end

	-- Set New Window Location
	win:setFrame(f)
end

function AdjustWindow( WidthOffset, HeightOffset, WidthModifier, HeightModifier )
  if hs.window.focusedWindow() then
		local win = hs.window.focusedWindow()
		Tiling.MoveWindow ( WidthOffset, HeightOffset, WidthModifier, HeightModifier, win )
	else
		hs.alert.show("No active window")
  end
end

--
-- Alfred-Based Tool
--
-- Using a 12 point grid
function Tiling.processWinTile( raw, scenario )
	hs.alert.show(raw)
	local input = tonumber(raw)
	if input > 12 then
		hs.alert.show(input..' is not less than 12')
	else
		if scenario == 1 then
 			AdjustWindow(0, nil, input/12, nil)
		elseif scenario == 2 then
 			AdjustWindow(input/12, nil, (12-input)/12, nil)
		elseif scenario == 3 then
 			AdjustWindow(nil, 0, nil, input/12)
		elseif scenario == 4 then
 			AdjustWindow(nil, (12-input)/12, nil, input/12)
 		else
			hs.alert.show(scenario..' is not a known use case')
		end
	end
end

-- Function for Alfred to directly call
function wintile(raw)
	if raw then
		local count = 0
		local Lraw = string.match(raw, '[lL](%d+)')
		local Rraw = string.match(raw, '[rR](%d+)')
		if Lraw then
			Tiling.processWinTile( Lraw, 1 )
		elseif Rraw then
			Tiling.processWinTile( Rraw, 2 )
		else
			count = count + 1
		end
		local Traw = string.match(raw, '[tT](%d+)')
		local Braw = string.match(raw, '[bB](%d+)')
		if Traw then
			Tiling.processWinTile( Traw, 3 )
		elseif Braw then
			Tiling.processWinTile( Braw, 4 )
		else
			count = count + 1
		end
		if count == 2 then
	    hs.alert.show("Incorrect value: combine any of [t,b,l,r] with a number less than 12")
	  end
	else
	  hs.alert.show("Need value: combine any of [t,b,l,r] with a number less than 12")
	  hs.alert.show("for example: l6 t12")
	end
end

--
-- Common Window Movements
--
-- Arrow Key Options for Quad-Grid ("Tri")
hs.hotkey.bind(Utility.mash, "Left", function()
 AdjustWindow(0, 0, 1/2, 1)
end)
hs.hotkey.bind(Utility.mash, "Right", function()
 AdjustWindow(1/2, 0, 1/2, 1)
end)
-- Mini Window Layout:
hs.hotkey.bind(Utility.mash, "Up", function()
 AdjustWindow(1/2, 0, 1/2, 1/2)
end)
hs.hotkey.bind(Utility.mash, "Down", function()
 AdjustWindow(1/2, 1/2, 1/2, 1/2)
end)

-- Legacy Mjolnir Commands
hs.hotkey.bind(Utility.mash, "y", function()
 AdjustWindow(0, 0, 11/12, 1)
end)
hs.hotkey.bind(Utility.mash, "u", function()
 AdjustWindow(0, 0, 1, 1)
end)
hs.hotkey.bind(Utility.mash, "i", function()
 AdjustWindow(2/12, 0, 10/12, 1)
end)

return Tiling
