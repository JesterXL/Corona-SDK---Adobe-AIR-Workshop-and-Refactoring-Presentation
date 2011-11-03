
function init()
	return "global init"
end

local function init()
	return "local init"
end

print("init: ", init())
print("_G.init: ", _G.init())

value = 6
function showScores(value)
	print("value: ", value)
	print("_G.value: ", _G.value)
	
	if value == 10 then
		local value = 3
		print("value: ", value)
	end
	
	print("value: ", value)
end

showScores(10)
