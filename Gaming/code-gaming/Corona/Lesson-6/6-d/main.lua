require "physics"
require "sprite"
physics.start()
physics.setDrawMode( "normal" )
physics.setGravity( 0, 0 )

stage = display.getCurrentStage()

playerSpriteSheet = sprite.newSpriteSheet("player.png", 22, 17)
playerSpriteSet = sprite.newSpriteSet(playerSpriteSheet, 1, 2)
sprite.add(playerSpriteSet, "planeFly", 1, 2, 50, 0)
player = sprite.newSprite(playerSpriteSet)
player:prepare("planeFly")
player:play()
player.name = "Player"
player.x = 40
player.y = 40
physics.addBody( player, { density = 1.0, friction = 0.3, bounce = 0.2, 
							bodyType = "kinematic", 
							isBullet = true, isSensor = true, isFixedRotation = true,
							filter = { categoryBits = 1, maskBits = 6 }
						})

function newEnemy()
	local enemy = display.newImage("enemy.png")
	enemy.name = "Enemy"
	enemy.y = 40
	enemy.x = math.random() * stage.width
	
	function enemy:enterFrame(event)
		self.y = self.y + 3
		if self.y > stage.height then
			self:destroy()
		end
	end
	
	function enemy:destroy(showDeath)
		Runtime:removeEventListener("enterFrame", self)
		self.isVisible = false
		local t = {}
		t.enemy = self
		function t:timer(event)
			self.enemy:removeSelf()
		end 
		timer.performWithDelay(300, t)
		
		if showDeath == true then
			local death = newEnemyDeath()
			death.x = self.x
			death.y = self.y
		end
	end
	
	Runtime:addEventListener("enterFrame", enemy)
	physics.addBody( enemy, { density = 1.0, friction = 0.3, bounce = 0.2, 
								bodyType = "kinematic", 
								isBullet = true, isSensor = true, isFixedRotation = true,
								filter = { categoryBits = 4, maskBits = 3 }
							})
	return enemy
end

function newEnemyDeath()
	if enemyDeathSheet == nil then
		enemyDeathSheet = sprite.newSpriteSheet("enemy_death_sheet.png", 24, 24)
		enemyDeathSet = sprite.newSpriteSet(enemyDeathSheet, 1, 5)
		sprite.add(enemyDeathSet, "smallShipDeath", 1, 5, 300, 1)
	end
	local enemyDeath = sprite.newSprite(enemyDeathSet)
	function enemyDeath:sprite(event)
		if event.phase == "end" then
			self:removeEventListener("sprite", self)
			self:removeSelf()
		end
	end
	enemyDeath:addEventListener("sprite", enemyDeath)
	enemyDeath:prepare("smallShipDeath")
	enemyDeath:play()
	return enemyDeath
end

function newBullet()
	print("newBullet")
	local bullet = display.newImage("player_bullet.png")
	bullet.name = "Bullet"
	bullet.x = player.x
	bullet.y = player.y
	
	function bullet:enterFrame(event)
		self.y = self.y - 6
		if self.y < 0 then
			self:destroy()
		end
	end
	
	function bullet:collision(event)
		print("collision")
		event.other:destroy(true)
		self:destroy()
	end
	
	function bullet:destroy()
		Runtime:removeEventListener("enterFrame", self)
		self.isVisible = false
		local t = {}
		t.bullet = self
		function t:timer(event)
			self.bullet:removeSelf()
		end 
		timer.performWithDelay(300, t)
	end
		
	bullet:addEventListener("collision", bullet)
	Runtime:addEventListener("enterFrame", bullet)
	physics.addBody( bullet, { density = 1.0, friction = 0.3, bounce = 0.2, 
								bodyType = "kinematic", 
								isBullet = true, isSensor = true, isFixedRotation = true,
								filter = { categoryBits = 2, maskBits = 4 }
							})
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

