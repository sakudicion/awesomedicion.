pcall(require, 'luarocks.loader')

local awful = require'awful'
local beautiful = require'beautiful'
local menubar = require("menubar")
local gears = require'gears'
local wibox = require'wibox'
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")
local mmytheme = 'configs/theme.lua'

beautiful.init(gears.filesystem.get_configuration_dir()..mmytheme)

-- awful things
require("awful.hotkeys_popup.keys")

-- MA LIFE
require("awful.autofocus")

-- MA LIFE pt2.
require'binds'

-- load config
require'configs'

-- load at start
require'configs/autoexec'

-- load rules
require'configs/rules'

-- load titlebar
require'configs/titlebar'

-- load bar
require'configs/bar'

