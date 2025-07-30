player = require"player"
enemy = require"enemy"
windows = require"windows"

margin = 5

log = {"Hello",
	"There",
	"test"}

options = {
  "1. Attack",
  "2. Skip",
  "3. Quit"
}

function love.update(dt)
  if enemy.health == 0 then
    table.insert(log, "Enemy died")
    goto done
  end
  if player.turn then
    handle_input()
  elseif enemy.turn then
    handle_enemy()
  end


  ::done::
end

function love.draw()
  recent_log = fetch_last_log()
  for i = 1, 3 do
    love.graphics.print(recent_log[i], windows.log_window.x + margin, windows.log_window.y + margin + 15*i)
  end

  for i,v in pairs(windows) do
    draw_window(v)
  end

   for i = 1, #windows.options_window do
  love.graphics.print(windows.options_window[i], windows.options_window.x + margin, windows.options_window.y + margin + 15*i)
 end
end

function draw_window(window)
  love.graphics.rectangle("line", window.x, window.y, window.width, window.height)
end


function fetch_last_log()
  local last_three_messages = {}

  local last = #log

  last_three_messages[1] = log[last-2]
  last_three_messages[2] = log[last-1]
  last_three_messages[3] = log[last]

  return last_three_messages
end

function handle_enemy()
  table.insert(log, "Enemy attacks for " .. enemy.attack .. "!")
  player.health = player.health - enemy.attack
  enemy.turn = false
  player.turn = true
end

function handle_input(key)
  if love.keyboard.isDown("1") then
    table.insert(log, "Player attacks the enemy for " .. player.attack .. "!")
    enemy.health = enemy.health - player.attack
    enemy.turn = true
    player.turn = false
  elseif love.keyboard.isDown("2") then
    table.insert(log, "Player skips the move")
    enemy.turn = true
    player.turn = false
  elseif love.keyboard.isDown("3") then
    love.event.quit()
  end
end
