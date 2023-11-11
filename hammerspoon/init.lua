local function handleEvent(event)
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()

    if keyCode == hs.keycodes.map['['] and flags.ctrl then
        hs.eventtap.keyStroke({}, 'eisu')
        return false
    end

    if keyCode == hs.keycodes.map['escape'] then
        hs.eventtap.keyStroke({}, 'eisu')
        return false
    end


    -- ⌘ + space: Toggle alacritty
    if keyCode == hs.keycodes.map['space'] and flags.cmd then
      local alacritty = hs.application.find('alacritty')
      if alacritty:isFrontmost() then
        alacritty:hide()
      else
        hs.application.launchOrFocus("/Applications/Alacritty.app")
      end
    end

    return false
end

local eventtap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, handleEvent)
eventtap:start()
