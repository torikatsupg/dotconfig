ResendingPrefix = false

function handleEvent(event)
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()

    if keyCode == hs.keycodes.map['['] and flags.ctrl then
      hs.eventtap.keyStroke({}, 'escape')
      return true
    end

    if keyCode == hs.keycodes.map['escape'] then
      hs.timer.doAfter(0.01, function()
        hs.eventtap.keyStroke({}, 'eisu')
      end)
      return false
    end

    -- tmux prefix (C-t) in Alacritty: switch IME to eisu
    -- 変換中だと C-t が IME に吸われるので、英数で確定させてから C-t を送り直す
    if keyCode == hs.keycodes.map['t'] and flags.ctrl and not flags.cmd and not flags.alt and not flags.shift then
      if ResendingPrefix then
        ResendingPrefix = false
        return false
      end
      local front = hs.application.frontmostApplication()
      if front and front:name() == "Alacritty" and hs.keycodes.currentMethod() ~= nil then
        hs.eventtap.keyStroke({}, 'eisu', 0)
        hs.timer.doAfter(0.02, function()
          ResendingPrefix = true
          hs.eventtap.keyStroke({'ctrl'}, 't', 0)
        end)
        return true
      end
      return false
    end

    -- ⌘ + space: Toggle alacritty
    if keyCode == hs.keycodes.map['space'] and flags.cmd and not flags.shift and not flags.alt and not flags.ctrl then
      local alacritty = hs.application.find('alacritty')
      if alacritty:isFrontmost() then
        alacritty:hide()
      else
        hs.application.launchOrFocus("/Applications/Alacritty.app")
      end
      return true
    end

    return false
end

Eventtap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, handleEvent)
Eventtap:start()

AppWatcher = hs.application.watcher.new(function(applicationName, eventType, applicationObject)
    if eventType == hs.application.watcher.activated and applicationName == "Alacritty" then
      hs.timer.doAfter(0.01, function()
        hs.eventtap.keyStroke({}, 'eisu')
      end)
    end
end)
AppWatcher:start()

