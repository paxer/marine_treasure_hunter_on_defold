-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

function spawn_crab()
	-- self.right_side_border_x = tonumber(sys.get_config("display.width") - 32)
	local x_start_positions = { 67, 228 }
	local x_start_pos = (x_start_positions[math.random(#x_start_positions)])
	factory.create("#crab_factory", vmath.vector3(x_start_positions[math.random(1,2)], 80, 1))
end