function initEcoPanel();
	setVisible(game.ecoPanel, true);
	setX(game.ecoPanel, 0);
	setY(game.ecoPanel, getY(game.ui.infopanel) - 80);

	sgui_deletechildren(dialog.customDialog.content.ID);

	dialog.customDialog.content.title = getLabelEX(
		dialog.customDialog.content,
		anchorLTR,
		XYWH(0, 20, dialog.customDialog.content.width, 20),
		Trebuchet_20,
		'test',
      	{
      		wordwrap = true,
      		nomouseevent = true,
      		text_halign = ALIGN_MIDDLE
      	}
    );

    dialog.customDialog.content.events = getCheckBoxEX_UI(
    	dialog.customDialog.content,
    	anchorLT,
    	XYWH(28, 50, 17, 17),
    	'Events',
    	{},
		'',
		{
			checked = false
		}
	);

    dialog.customDialog.content.close = getImageButtonEX(
    	dialog.customDialog.content,
    	anchorB,
    	XYWH(dialog.customDialog.content.width / 2 - 75, dialog.customDialog.content.height - 45, 150, 24),
        loc(TID_msg_Ok),
        '',
        'HideDialog(dialog.customDialog.content);',
        SKINTYPE_BUTTON,
        {
        	font_colour_disabled = GRAY(127)
        }
    );

    DoInterfaceChange_SkinElements();
end;

function slideEcoPanel()
	if getX(game.ecoPanel) == -165 then
		AddEventSlideX(game.ecoPanel.ID, 0, 2, nil);
	else
		AddEventSlideX(game.ecoPanel.ID, -165, 2, nil);
	end;
end;

function displayEcoPanel()
	ShowDialog(dialog.customDialog);
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
    	callback_mousedown = 'slideEcoPanel();'
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
        texture = 'SGUI/Amer/button-call.png',
        callback_mousedown = 'displayEcoPanel();'
    }
);