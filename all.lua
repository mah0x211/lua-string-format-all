--
-- Copyright (C) 2024 Masatoshi Fukunaga
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--- assign to local
local select = select
local type = type
local tostring = tostring
local concat = table.concat
local getmetatable = debug.getmetatable or getmetatable
local format = require('string.format')
local dump = require('dump')

--- all formats arguments and returns a string.
--- @param ... any
--- @return string
local function all(...)
    local s, unused, n = format(...)
    if unused == nil then
        return s
    end

    -- convert remaining arguments to string
    for i = 1, n do
        local v = unused[i]
        local t = type(v)
        if t == 'table' then
            local mt = getmetatable(v)
            if type(mt) ~= 'table' or not mt.__tostring then
                unused[i] = dump(v, 0)
            else
                unused[i] = tostring(v)
            end
        elseif t ~= 'string' then
            unused[i] = tostring(v)
        end
    end

    -- append unused arguments to the result string
    if type(select(1, ...)) == 'string' then
        return s .. ' ' .. concat(unused, ' ')
    end

    -- ignore the result string if fmt is not a string
    return concat(unused, ' ')
end

return all
