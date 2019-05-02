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
  local ca, na = is(a), is_number(a)
  local cb, nb = is(b), is_number(b)
  assert(ca or na, "bad argument #1 for complex.add (complex or number expected)")
  assert(cb or nb, "bad argument #2 for complex.add (complex or number expected)")
  if (ca) then 
    if (cb) then
      local ar, ai = a.re, a.im
      local br, bi = b.re, b.im
      local sq = br * br + bi * bi
      return new(
        (ar * br + ai * bi) / sq,
        (ai * br - ar * bi) / sq
      )
    elseif (nb) then
      return new(a.re * b, a.im * b)
    end
  elseif (cb) then
    return new(a * b.re, a * b.im)
  end
end