function handleEvent(event)
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()

    if keyCode == hs.keycodes.map['['] and flags.ctrl then
      hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
      return false
    end

    if keyCode == hs.keycodes.map['escape'] then
      hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
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

-- Switch to ABC when alacritty is activatedっっっk
AppWatcher = hs.application.watcher.new(function(applicationName, eventType, applicationObject)
    if eventType == hs.application.watcher.activated and applicationName == "Alacritty" then
      hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
    end
end)
AppWatcher:start()

-- Enable spotlight for name searches
hs.application.enableSpotlightForNameSearches(true)
