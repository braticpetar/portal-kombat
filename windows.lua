local w = {}

local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()
local margin = 5


w.enemy_window = {
  x = 0,
  y = 0,
  width = (screen_width / 3), -- margin,
  height = (screen_height / 5) * 3
}

w.player_window = {
  x = w.enemy_window.x + w.enemy_window.width, -- + margin,
  y = 0,
  width = (screen_width / 3),
  height = (screen_height / 5) * 3
}

w.options_window = {
  x = w.player_window.x + w.player_window.width, --+ margin,
  y = 0,
  width = (screen_width / 3), -- - margin,
  height = screen_height
}

w.log_window = {
  x = 0,
  y = w.enemy_window.y + w.enemy_window.height,
  width = screen_width - w.options_window.width,
  height = screen_height - w.enemy_window.height
}

return w
