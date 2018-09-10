-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}
local right_side_screen_spawn_x = tonumber(sys.get_config("display.width") + 64)
local top_screen_spawn_y = tonumber(sys.get_config("display.height") - 128)
local bottom_screen_spawn_y = 81
local left_side_screen_spawn_x = -64
local x_start_positions = { left_side_screen_spawn_x, right_side_screen_spawn_x } -- could start from left or right screen side

local set_random_pos_and_dir = function()
	math.randomseed(os.clock() * 100000000000)
	local x_direction
	local x_start_position = x_start_positions[math.random(1, 2)]
	if x_start_position == left_side_screen_spawn_x then
		x_direction = 1
	else
		x_direction = -1
	end
	local pos = vmath.vector3(x_start_position, bottom_screen_spawn_y, 1)
	local dir = vmath.vector3(x_direction, 0, 0)

	return pos, dir
end

local create_crab = function()
	local pos, dir = set_random_pos_and_dir()
	local props = { dir = dir, speed = 25 }
	factory.create("#crab_factory", pos, nil, props)
end

local create_fish = function()
	local pos, dir = set_random_pos_and_dir()
	pos.y = math.random(bottom_screen_spawn_y, top_screen_spawn_y)
	local speed = math.random(30, 70)
	local props = { dir = dir, speed = speed }
	factory.create("#fish_factory", pos, nil, props)
end

function M.spawn_crab()
	timer.delay(math.random(5, 15), false, create_crab)
end

function M.spawn_fish()
	timer.delay(math.random(3, 8), false, create_fish)
end

return M