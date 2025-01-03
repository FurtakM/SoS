-- timer used in game
game.ui.timer = getElementEX(
    game.ui,
    anchorT,
    XYWH(getWidth(game.ui.toolbar) + 1, 0, 113, 26),
    OW_SETTING_READ_BOOLEAN('OPTIONS', 'OPTION_TIMER', true),
    {
        texture = 'SGUI/Amer/timer.png',
        hint = loc(6094)
    }
);

game.ui.timer.label = getLabelEX(
    game.ui.timer, 
    anchorR, 
    XYWH(6, 6, 78, 14), 
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

game.ui.timer.label_diff = getLabelEX(
    game.ui.timer, 
    anchorR, 
    XYWH(80, 6, 24, 14), 
    nil, 
    'X', 
    {
        colour1 = WHITEA(),
        font_name = Tahoma_13B,
        border_colour = WHITEA(),
        font_colour = WHITE(),
        nomouseevent = true,
        scissor = true,
        text_halign = ALIGN_MIDDLE
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

function displayDifficulty(diff)
    local levels = {'I', 'II', 'III', 'IV'};
    setText(game.ui.timer.label_diff, levels[parseInt(diff)]);
end