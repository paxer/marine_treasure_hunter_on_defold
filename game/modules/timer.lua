-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local M = {}

local function delay(seconds, fn)
	go.animate("dummy", "position.z", go.PLAYBACK_ONCE_FORWARD, 0, go.EASING_LINEAR, seconds, 0, fn)
end

M.delay = delay
return M