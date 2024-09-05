local awful = require'awful'
local hotkeys_popup = require'awful.hotkeys_popup'
local menubar = require'menubar'
local apps = require'configs.apps'
local mod = require'binds.mod'
local ui = require'configs/bar'
local widgets = require'configs/bar'
require'awful.hotkeys_popup.keys'
menubar.utils.terminal = apps.terminal

awful.keyboard.append_global_keybindings{

   awful.key{
      modifiers   = {mod.super},
      key         = 'a',
      description = 'Reload Awesome',
      group       = 'awesome',
      on_press    = awesome.restart,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 't',
      description = 'Open Terminal',
      group       = 'launcher',
      on_press    = function() awful.spawn(apps.terminal) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'r',
      description = 'Open Rofi',
      group       = 'launcher',
      on_press    = function() awful.spawn(apps.menuapps) end,
   },
   awful.key{
      modifiers   = {mod.shift},
      key         = 'Tab',
      description = 'Open Rofi Window',
      group       = 'launcher',
      on_press    = function() awful.spawn(apps.menuwindows) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'b',
      description = 'Open Browser',
      group       = 'launcher',
      on_press    = function() awful.spawn(apps.browser) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'e',
      description = 'Open FileManager',
      group       = 'launcher',
      on_press    = function() awful.spawn(apps.files) end,
   },
}

   
awful.keyboard.append_global_keybindings{
   awful.key{
      modifiers   = {mod.super},
      key         = 'space',
      description = 'select next',
      group       = 'layout',
      on_press    = function() awful.layout.inc(1) end,
   },
   awful.key{
      modifiers   = {mod.alt},
      keygroup    = 'numrow',
      description = 'only view tag',
      group       = 'tag',
      on_press    = function(index)
         local screen = awful.screen.focused()
         local tag = screen.tags[index]
         if tag then
            tag:view_only(tag)
         end
      end
   },
   awful.key{
      modifiers   = {mod.alt, mod.shift},
      keygroup    = 'numrow',
      description = 'move focused client to tag',
      group       = 'tag',
      on_press    = function(index)
         if client.focus then
            local tag = client.focus.screen.tags[index]
            if tag then
               client.focus:move_to_tag(tag)
            end
         end
      end
   },
}

-- !client

client.connect_signal('request::default_keybindings', function()
  awful.keyboard.append_client_keybindings{ 
      awful.key{
         modifiers   = {mod.super},
         key         = 'f',
         description = 'toggle fullscreen',
         group       = 'client',
         on_press    = function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
         end,
      	},
      awful.key{
         modifiers   = {mod.super},
         key         = 'c',
         description = 'close and next',
         group       = 'client',
         on_press    = function(c)
         	c:kill()
        end,
      	},
      awful.key{
         modifiers   = {mod.super},
         key         = 'h',
         description = 'minimize',
         group       = 'client',
         on_press    = function(c) c.minimized  = true end,
		},
      awful.key{
	 	modifiers = {mod.super},
	 	key = 's',
	 	description = 'screenshot',
	 	group = 'client',
	 	on_press = function() awful.spawn.with_shell('flameshot gui') end,
      	}
   }
end)

-- !Mouse

client.connect_signal('request::default_mousebindings', function()
   awful.mouse.append_client_mousebindings{
      awful.button{
         modifiers = {},
         button    = 1,
         on_press  = function(c) c:activate{context = 'mouse_click'} end
      },
      awful.button{
         modifiers = {mod.super},
         button    = 1,
         on_press  = function(c) c:activate{context = 'mouse_click', action = 'mouse_move'} end
      },
      awful.button{
         modifiers = {mod.super},
         button    = 3,
         on_press  = function(c) c:activate{context = 'mouse_click', action = 'mouse_resize'} end
      },
   }
end)

awful.mouse.append_global_mousebindings{
   awful.button{
      modifiers = {},
      button    = 4,
      on_press  = awful.tag.viewprev
   },
   awful.button{
      modifiers = {},
      button    = 5,
      on_press  = awful.tag.viewnext
   },
}
