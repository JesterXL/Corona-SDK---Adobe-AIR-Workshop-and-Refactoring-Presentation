player = display.newImage("player.png")
player.x = 40
player.y = 40

bullet = display.newImage("player_bullet.png")
bullet.x = 60
bullet.y = 40

enemy = display.newImage("enemy.png")
enemy.x = 80
enemy.y = 40

function onTouch(event)
	player.x = event.x
	player.y = event.y - 60
end

Runtime:addEventListener("touch", onTouch)