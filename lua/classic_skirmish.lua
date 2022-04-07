SKIRMISH_DATA = {};
SKIRMISH_DISPLAY_DATA = {};
SKIRMISH_SELECTED = nil;

function FROMOW_SKIRMISH_LISTBOX_ADD(INFO, INDEX) -- Called by OW!
	if (SKIRMISH_ALLOWED_MAPS == nil or inArray(SKIRMISH_ALLOWED_MAPS, INFO.map)) then
		SKIRMISH_DATA = addToArray(SKIRMISH_DATA, INFO);
		SKIRMISH_DISPLAY_DATA = addToArray(SKIRMISH_DISPLAY_DATA, INFO.title);

		if (SKIRMISH_SELECTED == nil) and (#SKIRMISH_DATA > 0) then
			SKIRMISH_SELECTED = #SKIRMISH_DATA;-- INDEX + 1;
			setMap();
		end;
	end;
end;

function setMap()
	if (SKIRMISH_DATA == nil) then
		return;
	end;

	setTexture(menu.window_skirmish.panel.mappic, '%missions%/_skirmish/' .. SKIRMISH_DATA[SKIRMISH_SELECTED].map .. '/mappic.png');
	setTextureFallback(menu.window_skirmish.panel.mappic, 'classic/edit/mappic_default.png');
	
	setText(menu.window_skirmish.panel.title, SKIRMISH_DATA[SKIRMISH_SELECTED].title);
	setText(menu.window_skirmish.panel.description, SKIRMISH_DATA[SKIRMISH_SELECTED].desc);

	sgui_deletechildren(menu.window_skirmish.panel.options.ID);
	OW_mapparams_clear();

	for i = 1, table.getn(SKIRMISH_DATA[SKIRMISH_SELECTED].options) do
		setSkirmishOption(SKIRMISH_DATA[SKIRMISH_SELECTED].options[i], i);
	end;
end;

function setSkirmishOption(OPTION, INDEX)
	getLabelEX(
	    menu.window_skirmish.panel.options,
	    anchorT, 
	    XYWH(
	    	10 + (((INDEX - 1) % 3) * 240),
	    	6 + (math.floor((INDEX - 1) / 3) * 60),
	    	240,
	    	14
	    ), 
	    nil,
	    OPTION.name,
	    {
	        font_colour = WHITE(),
            nomouseevent = true,
            font_name = BankGotic_14
	    }
	);
	
	clComboBox(
	    menu.window_skirmish.panel.options,
	    10 + (((INDEX - 1) % 3) * 240),
	    24 + (math.floor((INDEX - 1) / 3) * 60),
	    OPTION.list,
	    OPTION.default + 1,
	    'changeSkirmishOption(' .. OPTION.id .. ', "INDEX")',
	    {
	        
	    }
	);

	-- set default value
	changeSkirmishOption(OPTION.id, OPTION.default + 1);
end;

function changeSkirmishOption(INDEX, ID)
	OW_SKIRMISH_SET_MAPPARAM(INDEX, ID);
end;

function reloadSkirmishList()
	SKIRMISH_DATA = {};
	SKIRMISH_DISPLAY_DATA = {};
	SKIRMISH_SELECTED = nil;

	clSetListItems(menu.window_skirmish_popup.panel.list, {}, 0, '', {});

	OW_skirmishlist(menu.window_skirmish_popup.panel.list.ID);
end;

menu.window_skirmish = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = BLACKA(150)
    }
);

menu.window_skirmish.panel = getElementEX(
	menu.window_skirmish, 
	anchorLTRB,
	XYWH(
		menu.window_skirmish.width / 2 - 512, 
		menu.window_skirmish.height / 2 - 384, 
		1024,
		768
	),
	true,
	{
		texture = 'classic/edit/skirmish_window.png'
	}
);

menu.window_skirmish.panel.mappic = getElementEX(
	menu.window_skirmish, 
	anchorLTRB,
	XYWH(
		5, 
		5, 
		500,
		330
	),
	true,
	{
		colour1 = WHITEA(255),
		texture = 'classic/edit/mappic_default.png',
		texture_fallback = 'classic/edit/mappic_default.png',
		nomouseevent = true,
	}
);

menu.window_skirmish.panel.title = getLabelEX(
    menu.window_skirmish.panel, 
    anchorT, 
    XYWH(510, 6, 500, 600), 
    Tahoma_30B, 
    '',
    {
        wordwrap = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
        font_colour = RGB(231, 222, 214),
        shadowtext = true
    }
);

menu.window_skirmish.panel.description = getLabelEX(
	menu.window_skirmish.panel,
    anchorT, 
    XYWH(510, 40, 500, 596),
    nil, 
    '',
    {
		nomouseevent = true,
        font_colour = WHITE(),
        font_name = ADMUI3L,
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        scissor = true
 	}
);

menu.window_skirmish.panel.options = getElementEX(
	menu.window_skirmish.panel,
	anchorNone,
	XYWH(142, 372, 740, 356),
	true,
	{
		colour1 = WHITEA()
	}
);

menu.window_skirmish.panel.cancel = clButton(
	menu.window_skirmish.panel,
	142,
	734,
	183,
	16,
	loc(TID_Main_Menu_Campaign_Back),
	'showSkirmishWindow(0);',
    {}
);

menu.window_skirmish.panel.loadgame = clButton(
	menu.window_skirmish.panel,
	328,
	734,
	183,
	16,
	loc(TID_Main_Menu_Campaign_Load), 
	'showLoadGame(1);',
    {}
);

menu.window_skirmish.panel.change = clButton(
	menu.window_skirmish.panel,
	514,
	734,
	183,
	16,
	loc(TID_Main_Menu_Skirmish_ChangeMap), 
	'showChangeSkirmishPanel(1);',
    {}
);

menu.window_skirmish.panel.play = clButton(
	menu.window_skirmish.panel,
	700,
	734,
	183,
	16,
	loc(TID_PLAY), 
	'playSkirmish();',
    {}
);

menu.window_skirmish_popup = getElementEX(
    nil,
    anchorLTRB,
    XYWH(0, 0, LayoutWidth, LayoutHeight),
    false,
    {
        colour1 = BLACKA(50)
    }
);

menu.window_skirmish_popup.panel = getElementEX(
	menu.window_skirmish_popup,
    anchorNone,
    XYWH(menu.window_skirmish_popup.width / 2 - 270, menu.window_skirmish_popup.height / 2 - 180, 540, 360),
    true,
    {
        texture = 'classic/edit/skirmish_window_popup.png'
    }
);

menu.window_skirmish_popup.panel.mappic = getElementEX(
	menu.window_skirmish_popup.panel, 
	anchorLTRB,
	XYWH(260, 25, 250, 165),
	true,
	{
		colour1 = WHITEA(255),
		texture = 'classic/edit/mappic_default.png',
		texture_fallback = 'classic/edit/mappic_default.png',
		nomouseeventthis = true,
	}
);

menu.window_skirmish_popup.panel.description = getLabelEX(
	menu.window_skirmish_popup.panel,
    anchorT, 
    XYWH(248, 206, 274, 80),
    nil, 
    '',
    {
		nomouseevent = true,
        font_colour = BLACK(),
        font_name = Arial_12,
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        scissor = true
 	}
);

menu.window_skirmish_popup.panel.list = clListBox(
	menu.window_skirmish_popup.panel, 
	XYWH(10, 24, 224, 312), 
	{}, 
	1, 
	'', 
	{}
);

menu.window_skirmish_popup.panel.ok = clButton(
	menu.window_skirmish_popup.panel,
	245,
	301,
	136,
	16,
	loc(TID_msg_Ok), 
	'changeSkirmishConfirm();',
    {}
);

menu.window_skirmish_popup.panel.cancel = clButton(
	menu.window_skirmish_popup.panel,
	388,
	301,
	136,
	16,
	loc(TID_msg_Cancel), 
	'showChangeSkirmishPanel(0);',
    {}
); 

function showSkirmishWindow(MODE)
	if MODE == 1 then
		if parseInt(OW_SAVENEXIT_CHECK()) == 2 then
	        return;
	    end;
	    
		showMenuButton(0);
		setVisible(menu.window_skirmish, true);
		reloadSkirmishList();
	else
		setVisible(menu.window_skirmish, false);
		showMenuButton(2);
	end;
end;

function showChangeSkirmishPanel(MODE)
	if (MODE == 1) then
		reloadSkirmishList();
		
		clSetListItems(menu.window_skirmish_popup.panel.list, SKIRMISH_DISPLAY_DATA, SKIRMISH_SELECTED, 'changeSkirmish(INDEX)', {}); 
		clSetListSelectedItem(menu.window_skirmish_popup.panel.list.ID, SKIRMISH_SELECTED);
		setText(menu.window_skirmish_popup.panel.description, text(SKIRMISH_DATA[SKIRMISH_SELECTED].desc, 164, '...'));
		setTexture(menu.window_skirmish_popup.panel.mappic, '%missions%/_skirmish/' .. SKIRMISH_DATA[SKIRMISH_SELECTED].map .. '/mappic.png');
		setTextureFallback(menu.window_skirmish_popup.panel.mappic, 'classic/edit/mappic_default.png');
	end;

	setVisible(menu.window_skirmish_popup, MODE == 1);
end;

function changeSkirmish(INDEX)
	clSetListSelectedItem(menu.window_skirmish_popup.panel.list.ID, INDEX);
	setText(menu.window_skirmish_popup.panel.description, text(SKIRMISH_DATA[INDEX].desc, 164, '...'));
	setTexture(menu.window_skirmish_popup.panel.mappic, '%missions%/_skirmish/' .. SKIRMISH_DATA[INDEX].map .. '/mappic.png');
	setTextureFallback(menu.window_skirmish_popup.panel.mappic, 'classic/edit/mappic_default.png');
	SKIRMISH_SELECTED = INDEX;
end;

function changeSkirmishConfirm()
	setVisible(menu.window_skirmish_popup, false);
	setMap();
end;

function playSkirmish()
	if (SKIRMISH_SELECTED == nil) then
		return;
	end;

	OW_runmap_single('_skirmish/' .. SKIRMISH_DATA[SKIRMISH_SELECTED].map);
end;

-- @override
function skirSort(Type, isInit)

end;

reloadSkirmishList();