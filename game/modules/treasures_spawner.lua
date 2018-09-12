-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local utils = require "game.modules.utils"

local M = {}

local sprite_width = 64
local display_width = tonumber(sys.get_config("display.width"))
local left_side_screen_spawn_x = sprite_width
local right_side_screen_spawn_x =  display_width - sprite_width
local spawn_area_size = display_width / 3
local spawn_area1 = {start_point = sprite_width, end_point = spawn_area_size }
local spawn_area2 = {start_point = spawn_area1.end_point, end_point = spawn_area_size * 2 }
local spawn_area3 = {start_point = spawn_area2.end_point, end_point = display_width - sprite_width }
local spawn_areas = { spawn_area1, spawn_area2, spawn_area3 }
local y_spawn = 87
local grail_y_spawn = y_spawn

local create_chest = function(spawn_area)
	local x = math.random(spawn_area.start_point, spawn_area.end_point)
	local pos = vmath.vector3(x, y_spawn, 1)
	return factory.create("#chest_factory", pos)	
end

local create_gold = function(spawn_area)
	local x = math.random(spawn_area.start_point, spawn_area.end_point)
	local pos = vmath.vector3(x, y_spawn, 1)
	return factory.create("#gold_factory", pos)
end

local create_grail = function(spawn_area)
	local x = math.random(spawn_area.start_point, spawn_area.end_point)
	local pos = vmath.vector3(x, grail_y_spawn, 1)
	return factory.create("#grail_factory", pos)
end

function M.spawn_treasures()
	math.randomseed(os.clock() * 100000000000)
	local shuffled_spawn_areas = utils.shuffle(spawn_areas)
	local new_chest_id = create_chest(shuffled_spawn_areas[1])
	local new_gold_id = create_gold(shuffled_spawn_areas[2])
	local new_grail_id = create_grail(shuffled_spawn_areas[3])	
	msg.post("main:/game_manager", "treasure_locations", {chest =  go.get_position(new_chest_id), gold = go.get_position(new_gold_id), grail = go.get_position(new_grail_id)})
end

function M.spawn_treasures_on_pos(treasure_locations)
	for k, pos in pairs(treasure_locations) do
		if k == "chest" then factory.create("level:/map#chest_factory", pos) end
		if k == "grail" then factory.create("level:/map#grail_factory", pos) end
		if k == "gold" then factory.create("level:/map#gold_factory", pos) end
	end	
end

return M