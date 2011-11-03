stage = display.getCurrentStage()
player = display.newImage("player.png")
player.x = 40
player.y = 40

bullet = display.newImage("player_bullet.png")
bullet.x = 60
bullet.y = 40

function newEnemy()
	local enemy = display.newImage("enemy.png")
	enemy.y = 40
	enemy.x = math.random() * stage.width
	return enemy
end

function onTouch(event)
	player.x = event.x
	player.y = event.y - 60
end

function onTimer(event)
	newEnemy()
end

Runtime:addEventListener("touch", onTouch)
timer.performWithDelay(1000, onTimer, 0)

