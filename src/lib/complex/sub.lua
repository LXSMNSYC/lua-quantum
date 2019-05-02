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

local is_number = require "lua-quantum.src.util.is-number"

local assert = require "lua-quantum.src.util.error.assert"

return function (a, b)
  local ca = is(a)
  local cb = is(b)
  assert(ca or is_number(a), "bad argument #1 for complex.sub (complex or number expected)")
  assert(cb or is_number(b), "bad argument #2 for complex.sub (complex or number expected)")
  if (ca) then 
    if (cb) then
      return new(a.re - b.re, a.im - b.im)
    end
    return new(a.re - b, a.im)
  end
  return new(a - b.re, b.im)
end