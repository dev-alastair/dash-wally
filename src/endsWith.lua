--[[
	Checks if _input_ ends with the string _suffix_.
	@example endsWith("Fun Roblox Games", "Games") --> true
	@example endsWith("Bad Roblox Memes", "Games") --> false
]]
--[=[

	```lua
	endsWith(input: string, suffix: string): boolean
	```
	
	Checks if _input_ ends with the string _suffix_.
	
	**Examples**
	
	```lua
	endsWith("Fun Roblox Games", "Games") --> true
	```
	
	```lua
	endsWith("Bad Roblox Memes", "Games") --> false
	```

]=]

local function endsWith(input: string, suffix: string)
	return input:sub(-suffix:len()) == suffix
end

return endsWith
