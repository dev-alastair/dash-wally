--[[
	Return a portion of the _input_ array starting with the element at the _left_ index and ending
	with the element at the _right_ index (i.e. an inclusive range)

	If _left_ is not defined, it defaults to 1.
	If _right_ is not defined, it defaults to the length of the array (i.e. the last element)

	If _left_ is `-n`, the slice starts with the element `n` places from the last one.
	If _right_ is `-n`, the slice ends with the element `n` places from the last one.

	An empty array is returned if the slice has no or negative length.
]]
local insert = table.insert

--[=[

	```lua
	slice<T>(input: { T }, left: number?, right: number?): { T }
	```
	
	Return a portion of the _input_ array starting with the element at the _left_ index and ending
	with the element at the _right_ index (i.e. an inclusive range)
	
	If _left_ is not defined, it defaults to 1.
	If _right_ is not defined, it defaults to the length of the array (i.e. the last element)
	
	If _left_ is `-n`, the slice starts with the element `n` places from the last one.
	If _right_ is `-n`, the slice ends with the element `n` places from the last one.
	
	An empty array is returned if the slice has no or negative length.
	
	**Examples**
	```lua
	Dash.slice({1, 2, 3, 4, 5}, 2, 4)
	
	--[[
	Output: {
		[1] = 2,
		[2] = 3,
		[3] = 4
	}
	]]
	```
	
	```lua
	Dash.slice({1, 2, 3, 4, 5}, 3)
	
	--[[
	Output: {
		[1] = 3,
		[2] = 4,
		[3] = 5
	}
	]]
	```
	
	```lua
	Dash.slice({1, 2, 3, 4, 5}, nil, -1)
	
	--[[
	Output: {
		[1] = 1,
		[2] = 2,
		[3] = 3,
		[4] = 4
	}
	]]
	```

]=]

local function slice<T>(input: { T }, left: number?, right: number?): { T }
	local output: { T } = {}

	-- Default values
	local l: number = left or 1
	local r: number = right or #input

	if l < 0 then
		l = #input + l
	end
	if r and r < 0 then
		r = #input + r
	end
	for i = l, r do
		insert(output, input[i])
	end
	return output
end

return slice
