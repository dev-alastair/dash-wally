-- ROBLOX upstream: https://github.com/facebook/jest/blob/v28.0.0/packages/jest-snapshot/src/types.ts
-- /**
--  * Copyright (c) Facebook, Inc. and its affiliates. All Rights Reserved.
--  *
--  * This source code is licensed under the MIT license found in the
--  * LICENSE file in the root directory of this source tree.
--  */
local LuauPolyfill = require(script.Parent.Parent:WaitForChild('luau-polyfill'))
type Object = LuauPolyfill.Object

-- ROBLOX TODO: upstream is `MatcherState &`, which is from `expect` package, but would result in a circular rotriever dependency
export type Context = Object

export type MatchSnapshotConfig = {
	context: Context,
	hint: string?,
	inlineSnapshot: string?,
	isInline: boolean,
	matcherName: string,
	properties: Object?,
	received: any
}

export type SnapshotData = { [string]: string }

-- copied from `expect` - should be shared
export type ExpectationResult = {
	pass: boolean,
	message: () -> string
}

return {}
