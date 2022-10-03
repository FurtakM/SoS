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
		loc(8900),
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
    	loc(8901),
    	{},
		'OW_CUSTOM_COMMAND(102, 1);',
		{
			checked = false
		}
	);

	dialog.customDialog.content.attacks = getCheckBoxEX_UI(
    	dialog.customDialog.content,
    	anchorLT,
    	XYWH(28, 72, 17, 17),
    	loc(8902),
    	{},
		'OW_CUSTOM_COMMAND(102, 2);',
		{
			checked = false
		}
	);

	dialog.customDialog.content.crates = getCheckBoxEX_UI(
    	dialog.customDialog.content,
    	anchorLT,
    	XYWH(28, 94, 17, 17),
    	loc(8903),
    	{},
		'OW_CUSTOM_COMMAND(102, 3);',
		{
			checked = true
		}
	);

	dialog.customDialog.content.techs = getCheckBoxEX_UI(
    	dialog.customDialog.content,
    	anchorLT,
    	XYWH(28, 116, 17, 17),
    	loc(8904),
    	{},
		'OW_CUSTOM_COMMAND(102, 4); setEnabled({ID=%ID}, false);',
		{
			checked = false
		}
	);

    dialog.customDialog.content.human1 = getImageButtonEX(
    	dialog.customDialog.content,
    	anchorB,
    	XYWH(28, 146, 150, 24),
        loc(8906),
        '',
        'OW_CUSTOM_COMMAND(102, 5);',
        SKINTYPE_BUTTON,
        {
        	font_colour_disabled = GRAY(127)
        }
    );

    dialog.customDialog.content.human2 = getImageButtonEX(
    	dialog.customDialog.content,
    	anchorB,
    	XYWH(28, 176, 150, 24),
        loc(8907),
        '',
        'OW_CUSTOM_COMMAND(102, 6);',
        SKINTYPE_BUTTON,
        {
        	font_colour_disabled = GRAY(127)
        }
    );

    dialog.customDialog.content.human3 = getImageButtonEX(
    	dialog.customDialog.content,
    	anchorB,
    	XYWH(dialog.customDialog.content.width - 150 - 28, 146, 150, 24),
        loc(8908),
        '',
        'OW_CUSTOM_COMMAND(102, 7);',
        SKINTYPE_BUTTON,
        {
        	font_colour_disabled = GRAY(127)
        }
    );

    dialog.customDialog.content.human4 = getImageButtonEX(
    	dialog.customDialog.content,
    	anchorB,
    	XYWH(dialog.customDialog.content.width - 150 - 28, 176, 150, 24),
        loc(8909),
        '',
        'OW_CUSTOM_COMMAND(102, 8);',
        SKINTYPE_BUTTON,
        {
        	font_colour_disabled = GRAY(127)
        }
    );

    dialog.customDialog.content.close = getImageButtonEX(
    	dialog.customDialog.content,
    	anchorB,
    	XYWH(dialog.customDialog.content.width / 2 - 75, dialog.customDialog.content.height - 45, 150, 24),
        loc(TID_msg_Ok),
        '',
        'HideDialog(dialog.customDialog); OW_PAUSE();',
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
	if not getVisible(gamewindow.pause) then
		OW_PAUSE();
	end;

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