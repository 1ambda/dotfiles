-- key mapping for vim 
-- Convert input soruce as English and sends 'escape' if inputSource is not English.
-- Sends 'escape' if inputSource is English.
-- key bindding reference --> https://www.hammerspoon.org/docs/hs.hotkey.html
local inputEnglish = "com.apple.keylayout.ABC"

local bind_esc
local bind_alfred
local bind_iterm

function convert_esc()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.eventtap.keyStroke({}, 'right')
		hs.keycodes.currentSourceID(inputEnglish)
	end
	bind_esc:disable()
	hs.eventtap.keyStroke({}, 'escape')
	bind_esc:enable()
end

function convert_alfred()
  hs.application.launchOrFocus("Alfred 5")
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.eventtap.keyStroke({}, 'right')
		hs.keycodes.currentSourceID(inputEnglish)
	end
end

function convert_iterm()
	bind_iterm:disable()
	hs.eventtap.keyStroke({"alt"}, 'space')
	bind_iterm:enable()

	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.eventtap.keyStroke({}, 'right')
		hs.keycodes.currentSourceID(inputEnglish)
	end
end

bind_esc = hs.hotkey.new({}, 'escape', convert_esc):enable()
bind_alfred = hs.hotkey.new({"alt"}, 's', convert_alfred):enable()
bind_iterm = hs.hotkey.new({"alt"}, 'space', convert_iterm):enable()

