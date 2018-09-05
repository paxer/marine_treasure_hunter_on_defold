-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

local left_side_screen_spawn_x = 64
local right_side_screen_spawn_x = tonumber(sys.get_config("display.width") - 64)
local y_spawn = 87

local create_chest = function()
	local x = math.random(left_side_screen_spawn_x, right_side_screen_spawn_x)
	local pos = vmath.vector3(x, y_spawn, 1)
	factory.create("#chest_factory", pos)
end

function M.spawn_treasures()
	math.randomseed(os.clock() * 100000000000)
	create_chest()
end

return M