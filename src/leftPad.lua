--[[
	Makes a string of `length` from `input` by repeating characters from `prefix` at the start of the string.
	@example leftPad("toast", 6) --> " toast"
	@example leftPad("2", 2, "0") --> "02"
	@example leftPad("toast", 10, ":)") --> ":):):toast"
	@param prefix (default = `" "`)
]]
--[=[

	```lua
	leftPad(input: string, length: number, prefix: string?): string
	```
	
	Makes a string of `length` from `input` by repeating characters from `prefix` at the start of the string.
	
	**Params**
	
	- `prefix` - default = `""`
	
	**Examples**
	
	```lua
	leftPad("toast", 6) --> " toast"
	```
	
	```lua
	leftPad("2", 2, "0") --> "02"
	```
	
	```lua
	leftPad("toast", 10, ":)") --> ":):):toast"
	```

]=]

local function leftPad(input: string, length: number, prefix: string?): string
	local definedPrefix = prefix or " "

	local padLength = length - input:len()
	local remainder = padLength % definedPrefix:len()
	local repetitions = (padLength - remainder) / definedPrefix:len()
	return string.rep(definedPrefix or " ", repetitions) .. definedPrefix:sub(1, remainder) .. input
end

return leftPad
