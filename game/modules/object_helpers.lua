-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
local M = {}

local left_screen_border_x = -64
local right_screen_border_x = tonumber(sys.get_config("display.width")) + 64

function M.destroy_if_offscreen(self, pos)
	if pos.x > right_screen_border_x or pos.x < left_screen_border_x then
		go.delete()
	end
end

return M