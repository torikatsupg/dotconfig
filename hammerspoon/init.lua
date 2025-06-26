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

