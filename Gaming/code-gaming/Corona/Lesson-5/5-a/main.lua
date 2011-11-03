require "physics"
physics.start()
physics.setDrawMode( "hybrid" )
physics.setGravity( 0, 0 )

stage = display.getCurrentStage()
player = display.newImage("player.png")
player.x = 40
player.y = 40
physics.addBody( player, { density = 1.0, friction = 0.3, bounce = 0.2, 
							bodyType = "kinematic", 
							isBullet = true, isSensor = true, isFixedRotation = true
						})

function newEnemy()
	local enemy = display.newImage("enemy.png")
	enemy.y = 40
	enemy.x = math.random() * stage.width
	function enemy:enterFrame(event)
		self.y = self.y + 3
		if self.y > stage.height then
			Runtime:removeEventListener("enterFrame", self)
			self:removeSelf()
		end
	end
	Runtime:addEventListener("enterFrame", enemy)
	return enemy
end

function newBullet()
	print("newBullet")
	local bullet = display.newImage("player_bullet.png")
	bullet.x = player.x
	bullet.y = player.y
	function bullet:enterFrame(event)
		self.y = self.y - 6
		if self.y < 0 then
			Runtime:removeEventListener("enterFrame", self)
			self:removeSelf()
		end
	end
	Runtime:addEventListener("enterFrame", bullet)
	return bullet
end

function startBulletTimer()
	stopBulletTimer()
	bulletTimer = timer.performWithDelay(500, newBullet, 0)
end

function stopBulletTimer()
	if bulletTimer ~= nil then
		timer.cancel(bulletTimer)
		bulletTimer = nil
	end
end

function onTouch(event)
	player.x = event.x
	player.y = event.y - 60
	
	if event.phase == "began" then
		startBulletTimer()
	elseif event.phase == "ended" or event.phase == "cancelled" then
		stopBulletTimer()
	end
end

function onTimer(event)
	newEnemy()
end

Runtime:addEventListener("touch", onTouch)
timer.performWithDelay(1000, onTimer, 0)

