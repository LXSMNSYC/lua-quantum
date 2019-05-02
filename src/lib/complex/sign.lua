--[[
  MIT License
  Copyright (c) 2019 Alexis Munsayac
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
--]]
local new = require "lua-quantum.src.lib.complex.is"
local is = require "lua-quantum.src.lib.complex.is"

local euler = require "lua-quantum.src.lib.complex.euler"
local arg = require "lua-quantum.src.lib.complex.arg"

local is_number = require "lua-quantum.src.util.is-number"

local assert = require "lua-quantum.src.util.error.assert"

local function sign(x)
  if (v < 0) then
    return -1
  end
  if (v > 0) then
    return 1
  end
  return 0
end

return function (x)
  local c = is(x)
  assert(c or is_number(x), "bad argument for complex.sign (complex or number expected)")
  if (c) then
    return euler(arg(x))
  end
  return new(sign(x), 0)
end