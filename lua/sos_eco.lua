function initEcoPanel();
	setVisible(game.ecoPanel, true);
	setX(game.ecoPanel, 0);
end;

function displayEcoPanel()
	if getX(game.ecoPanel) == -165 then
		AddEventSlideX(game.ecoPanel.ID, 0, 2, nil);
	else
		AddEventSlideX(game.ecoPanel.ID, -165, 2, nil);
	end;
end;

game.ecoPanel = getElementEX(
    game, 
    anchorNone, 
    XYWH(0, 60, 187, 72), 
    false,
    {
        texture = 'SGUI/Amer/eco-panel.png'
    }
);

game.ecoPanel.switch = getElementEX(
	game.ecoPanel, 
    anchorR, 
    XYWH(167, 0, 20, 72),
    true,
    {
    	colour1 = WHITEA(),
    	callback_mousedown = 'displayEcoPanel();'
    }
);

game.ecoPanel.callBtn = getImageButtonEX(
    game.ecoPanel, 
    anchorNone, 
    XYWH(55, 23, 77, 27), 
    '', 
    '', 
    '',
    nil,
    {
        texture = 'SGUI/Amer/button-call.png'
    }
);