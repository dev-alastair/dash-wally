--[[
	Creates a shallow clone of the _source_ Map, and copies the values from the _delta_ Map
	by key, like the join utility.

	However, if any of the values are tables themselves, the joinDeep function is called
	recursively to produce a new table at the specified key.

	The purpose of this function is to merge nested immutable data using as few table
	creation operations as possible, making it appropriate for updating state in a reducer.

	The None symbol can be used to remove an existing value.
]]
local Dash = script.Parent
local None = require(Dash.None)
local Types = require(Dash.Types)
local forEach = require(Dash.forEach)
local copy = require(Dash.copy)

-- TODO Luau: Support typing varargs
-- TODO Luau: Support function generics
--[=[

	```lua
	joinDeep(source: Types.Map<any, any>, delta: Types.Map<any, any>): Types.Map<any, any>
	```
	
	Creates a shallow clone of the _source_ Map, and copies the values from the _delta_ Map
	by key, like the join utility.
	
	However, if any of the values are tables themselves, the joinDeep function is called
	recursively to produce a new table at the specified key.
	
	The purpose of this function is to merge nested immutable data using as few table
	creation operations as possible, making it appropriate for updating state in a reducer.
	
	**Usage**
	
	- The [None](#none) symbol can be used to remove an existing value.
	
	**Example**
	
	```lua
	local source = {
		name = "car",
		lights = {
			front = 2,
			back = 2,
			indicators = {
				color = "orange"
			},
			brake = {
				color = "red"
			}
		},
		tyres = 4
	}
	local delta = {
		name = "bike",
		lights = {
			front = 3,
			indicators = {
				rate = 20
			}
		},
		tyres = None
	}
	local output = joinDeep(source, delta)
	[[
	Output: {
		lights = {
			back = 2,
			brake = {
				color = "red"
			},
			front = 3,
			indicators = {
				color = "orange",
				rate = 20
			}
		},
		name = "bike"
	}
	]]
	```

]=]

local function joinDeep(source: Types.Table, delta: Types.Table): Types.Table
	local result = copy(source)
	-- Iterate through each key of the input and assign to target at the same key
	forEach(delta, function(value, key)
		if typeof(source[key]) == "table" and typeof(value) == "table" then
			-- Only merge tables
			result[key] = joinDeep(source[key], value)
		elseif value == None then
			-- Remove none values
			result[key] = nil
		else
			result[key] = value
		end
	end)
	return result
end

return joinDeep
