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

    -- test that dump a table if it has no __tostring metamethod
    local t = {
        foo = 'bar',
        baz = 'qux',
        quux = 'corge',
    }
    s = format('hello %s', 'foo', t)
    assert.equal(s, 'hello foo { baz = "qux", foo = "bar", quux = "corge" }')

    -- test that convert a table to string if it has __tostring metamethod
    setmetatable(t, {
        __tostring = function(self)
            return self.foo
        end,
    })
    s = format('hello %s', 'foo', t)
    assert.equal(s, 'hello foo bar')
end

test_format_all()
