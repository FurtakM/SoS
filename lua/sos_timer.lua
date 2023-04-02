-- timer used in game
game.ui.timer = getElementEX(
    game.ui,
    anchorT,
    XYWH(getWidth(game.ui.toolbar) + 1, 0, 93, 26),
    true,
    {
        texture = 'SGUI/Amer/timer.png'
    }
);

game.ui.timer.label = getLabelEX(
    game.ui.timer, 
    anchorR, 
    XYWH(8, 6, 78, 14), 
    nil, 
    '00:00:00', 
    {
        colour1 = WHITEA(),
        font_name = Tahoma_13B,
        border_colour = WHITEA(),
        font_colour = WHITE(),
        nomouseevent = true,
        scissor = true,
        text_halign = ALIGN_RIGHT
    }
);

function DoInterfaceChangeTimer()
	local texture = 'SGUI/' .. interface.current.side .. '/timer.png';

	setTexture(game.ui.timer, texture);
	setX(game.ui.timer, getWidth(game.ui.toolbar));
end;

function updateTimer(tick)
	local time = math.floor(parseInt(tick) / 35);
  	local hours = math.floor(math.mod(time, 86400) / 3600);
 	local minutes = math.floor(math.mod(time, 3600) / 60);
  	local seconds = math.floor(math.mod(time, 60));

  	setText(game.ui.timer.label, string.format("%02d:%02d:%02d", hours, minutes, seconds));
end;