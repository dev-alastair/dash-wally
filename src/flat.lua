--[[
	Flattens the input array by a single level.

	Outputs a new Array of elements merged from the _input_ Array arguments in left-to-right order.
]]
local Dash = script.Parent
local Types = require(Dash.Types)
local append = require(Dash.append)
local forEach = require(Dash.forEach)

-- TODO Luau: Support function generics
local function flat(input: Types.Array<Types.Array<any>>): Types.Array<any>
	local result = {}
	forEach(input, function(childArray: Types.Array<any>)
		append(result, childArray)
	end)
	return result
end

return flat
