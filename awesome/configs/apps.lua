local _M = {
   terminal    = os.getenv('TERMINAL') or 'qterminal',
   editor      = os.getenv('EDITOR')   or 'micro',
   browser     = 'firefox',
   nitrogen    = 'nitrogen',
   files       = 'pcmanfm',
   menuapps    = 'rofi -show drun',
   menuwindows = 'rofi -show window',
   logout      = 'pkill -KILL -u adicion'
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor

return _M
