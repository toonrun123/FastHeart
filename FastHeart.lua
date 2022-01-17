--[[
	module:Connect(<function> func) --Like heartbeat
	return <number> deltatime
	
	module:Wait(<number> time) --Default wait.
	return <number> deltatime
	
	module:Sleep(<number> time) --Freeze game and wait untill time over.
	return <number> deltatime
	
	More information: https://github.com/toonrun123/FastHeart
]]

local module = {}
local Functions = {}

local RS = game:GetService("RunService")
local oldtime = workspace:GetServerTimeNow()

function module:Connect(func)
	assert(typeof(func) == "function","func Is not Function.")
	table.insert(Functions,func)
	function self:Disconnect()
		table.remove(Functions,table.find(Functions,func))
	end
	return self
end

function module:Wait(t)
	t = t or 0
	local c = 0
	local oldt = tick()

	while true do
		if c < t then
			if tick() ~= oldt then
				c += (tick()-oldt) * 10000 * 2
			else
				RS.Stepped:Wait() --Protect game Crash.
			end
			print(c)
			oldt = tick()
		else
			break
		end
	end
	return c
end

function module:Sleep(t)
	t = t or 0
	local s = tick()
	while (tick()-s) < t do end
	return (tick()-s)
end

coroutine.wrap(function()
	local used = RS.Heartbeat
	while true do
		local t = tick()
		if t ~= oldtime then
			local difftime = (t-oldtime)
			for i,v in ipairs(Functions) do
				coroutine.wrap(function()
					v(difftime)
				end)()
			end
		else
			used:Wait() --Protect game Crash.
		end
		oldtime = tick()
	end
end)()

return module
