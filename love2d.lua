particle = {}
particle.__index = particle
ActiveParticle = {}

function love.load()
 for i = 1, 20000 do
 particle.new()
 end
end

function love.update(dt)
 particle.updateAll(dt)
end

function love.draw()
 particle.drawAll()
end

function particle.new()
 instance = setmetatable({}, particle)
 instance.x = math.random(4,love.graphics.getWidth() )
 instance.y = math.random(4,love.graphics.getHeight() )
 instance.xVel = math.random(-150, 150)
 instance.yVel = math.random(-150, 150)
 instance.width = 4
 instance.height = 4
 table.insert(ActiveParticle, instance)
end

function particle:draw()
 love.graphics.rectangle("fill", self.x , self.y, self.width ,
self.height)
end

function particle:update(dt)
 self:outOfScreen(dt)
62
 self:move(dt)
end

function particle:outOfScreen(dt)
 if self.x + self.width / 2 > love.graphics.getWidth() then
 self.xVel = -self.xVel
 end
 if self.x - self.width / 2 < 0 then
 self.xVel = self.xVel * -1
 end
 if self.y + self.height / 2 > love.graphics.getHeight() then
 self.yVel = -self.yVel
 end
 if self.y - self.height / 2 < 0 then
 self.yVel = self.yVel * -1
 end
end

function particle:move(dt)
 self.x = self.x + self.xVel * dt
 self.y = self.y + self.yVel * dt
end

function particle.updateAll(dt)
 for i,instance in ipairs(ActiveParticle) do
 instance:update(dt)
 end
end

function particle.drawAll()
 for i,instance in ipairs(ActiveParticle) do
 instance:draw()
 end
end 
