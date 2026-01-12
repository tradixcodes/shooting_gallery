function menuLoad()
	menuFont = love.graphics.newFont("/fonts/Satoshi-Variable.ttf", 32)
	selected = 1

	options = {
		"Start Game",
		"Options",
		"Quit",
	}
end
function menuUpdate(dt) end

function menuDraw()
	love.graphics.setFont(menuFont)

	local w = love.graphics.getWidth()
	local h = love.graphics.getHeight()

	for i, options in ipairs(options) do
		local y = h / 2 + i * 40

		if i == selected then
			love.graphics.setColor(1, 1, 0)
		else
			love.graphics.setColor(1, 1, 1)
		end

		love.graphics.printf(option, 0, y, w, "center")
	end

	love.graphics.setColor(1, 1, 1)
end

function menuKeypressed(key)
	if key == "up" then
		selected = selected - 1
		if selected < 1 then
			selected = #options
		end
	elseif key == "down" then
		selected = selected + 1
		if selected > #options then
			selected = 1
		end
	elseif key == "return" then
		if options[selected] == "Start Game" then
			gameState = "game"
			gameLoad()
		elseif options[selected] == "Quit" then
			love.event.quit()
		end
	end
end
