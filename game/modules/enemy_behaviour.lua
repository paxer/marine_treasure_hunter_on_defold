-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local M = {}

function M.handle_bullets_hit(message_id, message)
	if message_id == hash("trigger_response") then
		if message.enter then
			if message.other_group == hash("bullets") then
				msg.post("main:/sfx_library#enemy_hit", "play_sound")
				msg.post("game_manager", "enemy_killed")
				go.delete()
			end
		end
	end
end

function M.handle_is_paused(self, message_id)
	if message_id == hash("pause") then
		self.is_paused = true
	end
end

return M