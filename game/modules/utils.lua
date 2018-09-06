-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local M = {}

-- shuffle table
function M.shuffle(t)
	local rand = math.random 
	assert(t, "table.shuffle() expected a table, got nil")
	local iterations = #t
	local j

	for i = iterations, 2, -1 do
		j = rand(i)
		t[i], t[j] = t[j], t[i]
	end
	return t
end

function M.scale_object(url, scale_x, scale_y)
	local yscale = go.get(url, "scale.y")
	local xscale = go.get(url, "scale.x")
	go.set(url, "scale.y", yscale * scale_y)
	go.set(url, "scale.x", xscale * scale_x)
end

return M