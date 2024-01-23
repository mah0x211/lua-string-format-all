require('luacov')
local assert = require('assert')
local format = require('string.format.all')

local function test_format_all()
    -- test that format() returns a string
    local s = format('hello world')
    assert.equal(s, 'hello world')

    -- test that unused arguments are concatenated to the end of the string
    s = format('hello %s', 'world', 'foo', nil, 'bar', nil, 'baz', nil)
    assert.equal(s, 'hello world foo nil bar nil baz nil')
end

test_format_all()
