-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}
local right_side_screen_spawn_x = tonumber(sys.get_config("display.width") + 64)
local left_side_screen_spawn_x = -64
local x_start_positions = { left_side_screen_spawn_x, right_side_screen_spawn_x } -- could start from left or right screen side
local x_direction

local create_crab = function()
	local x_start_position = x_start_positions[math.random(1, 2)]
	if x_start_position == left_side_screen_spawn_x then
		x_direction = 1
	else
		x_direction = -1
	end
	local pos = vmath.vector3(x_start_position, 80, 1)
	local dir = vmath.vector3(x_direction, 0, 0)
	local speed = math.random(20, 50)
	local props = { dir = dir, speed = speed }
	factory.create("#crab_factory", pos, nil, props)
end

function M.spawn_crab()
	math.randomseed(os.clock() * 100000000000)
	local seconds_delay = math.random(3, 8)
	timer.delay(seconds_delay, false, create_crab)
end

return M