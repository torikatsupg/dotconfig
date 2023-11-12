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
    if keyCode == hs.keycodes.map['space'] and flags.cmd and not flags.shift and not flags.alt then
      local alacritty = hs.application.find('alacritty')
      if alacritty:isFrontmost() then
        alacritty:hide()
      else
        hs.application.launchOrFocus("/Applications/Alacritty.app")
        -- TODO: everyware send eisu. cmd + tab, spotlight...etc
        hs.eventtap.keyStroke({}, 'eisu')
      end
    end

    return false
end

eventtap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, handleEvent)
eventtap:start()
