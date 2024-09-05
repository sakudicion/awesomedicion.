local _M = {}

local awful = require'awful'

_M.layouts = {
   awful.layout.suit.floating,
   awful.layout.suit.spiral.dwindle,
}

_M.tags = {'1', '2', '3'}

return _M
