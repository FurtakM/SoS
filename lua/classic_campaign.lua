function getCampaignSelectWindow(PARENT)
	local campaings = parseCampaings();
	local count = campaings['COUNT'];
	local data = {
		{
			W = 498, 
			H = 312, 
			buttonLeftX = 6, 
			buttonLeftY = 273, 
			buttonRightX = 251,
			buttonRightY = 273,
			buttonWidth = 240,
			descriptionWidth = 480,
			descriptionX = 10,
			descriptionY = 220,
			texture = 'classic/edit/background_campaign_1.png',
			campaings = {
				{
					X = 174,
					Y = 30,
				}
			}
		},
		{
			W = 498, 
			H = 312, 
			buttonLeftX = 6, 
			buttonLeftY = 273, 
			buttonRightX = 251,
			buttonRightY = 273,
			buttonWidth = 240,
			descriptionWidth = 480,
			descriptionX = 10,
			descriptionY = 220,
			texture = 'classic/edit/background_campaign_2.png',
			campaings = {
				{
					X = 50,
					Y = 35
				},
				{
					X = 294,
					Y = 35
				}
			}
		},
		{
			W = 750, 
			H = 312, 
			buttonLeftX = 6, 
			buttonLeftY = 273, 
			buttonRightX = 377,
			buttonRightY = 273,
			buttonWidth = 366,
			descriptionWidth = 732,
			descriptionX = 10,
			descriptionY = 220,
			texture = 'classic/edit/background_campaign_3.png',
			campaings = {
				{
					X = 50,
					Y = 35
				},
				{
					X = 296,
					Y = 35
				},
				{
					X = 544,
					Y = 35
				}
			}
		},
		{
			W = 1000, 
			H = 312, 
			buttonLeftX = 131, 
			buttonLeftY = 273, 
			buttonRightX = 503,
			buttonRightY = 273,
			buttonWidth = 366,
			descriptionWidth = 982,
			descriptionX = 10,
			descriptionY = 220,
			texture = 'classic/edit/background_campaign_4.png',
			campaings = {
				{
					X = 50,
					Y = 35
				},
				{
					X = 300,
					Y = 35
				},
				{
					X = 548,
					Y = 35
				},
				{
					X = 796,
					Y = 35
				}
			}
		},
		{
			W = 1250, 
			H = 312, 
			buttonLeftX = 131, 
			buttonLeftY = 273, 
			buttonRightX = 753,
			buttonRightY = 273,
			buttonWidth = 366,
			descriptionWidth = 982,
			descriptionX = 10,
			descriptionY = 220,
			texture = 'classic/edit/background_campaign_5.png',
			campaings = {
				{
					X = 50,
					Y = 35
				},
				{
					X = 300,
					Y = 35
				},
				{
					X = 548,
					Y = 35
				},
				{
					X = 796,
					Y = 35
				},
				{
					X = 1044,
					Y = 35
				}
			}
		},
	};

	local campaingsDetails = {};

	if campaings.Am then
		campaingsDetails = addToArray(campaingsDetails, {
			texture = 'classic/edit/campaign/menu-camp-btn-us-pattern.png',
			description = TID_Main_Menu_Campaign_American_Hint, -- 504
			id = 0
		});
	end;

	if campaings.Ar then
		campaingsDetails = addToArray(campaingsDetails, {
			texture = 'classic/edit/campaign/menu-camp-btn-ar-pattern.png',
			description = TID_Main_Menu_Campaign_Arabian_Hint, -- 1114
			id = 1
		});
	end;

	if campaings.Ru then
		campaingsDetails = addToArray(campaingsDetails, {
			texture = 'classic/edit/campaign/menu-camp-btn-ru-pattern.png',
			description = TID_Main_Menu_Campaign_Russian_Hint, -- 520
			id = 2
		});
	end;

	if campaings.Ap then
		campaingsDetails = addToArray(campaingsDetails, {
			texture = 'classic/edit/campaign/menu-camp-btn-ap-pattern.png',
			description = TID_Main_Menu_Campaign_Ape_Hint, -- 5100
			id = 3
		});
	end;

	if campaings.X1 then
		campaingsDetails = addToArray(campaingsDetails, {
			texture = 'classic/edit/campaign/menu-camp-btn-x1-pattern.png',
			description = TID_Main_Menu_Campaign_X1_Hint, -- 5102
			id = 4
		});
	end;

	if campaings.X2 then
		campaingsDetails = addToArray(campaingsDetails, {
			texture = 'classic/edit/campaign/menu-camp-btn-x2-pattern.png',
			description = TID_Main_Menu_Campaign_X2_Hint, -- 5104
			id = 5
		});
	end;

	local ELEMENT = getElementEX(
	    PARENT, 
	    anchorNone, 
	    XYWH(LayoutWidth / 2 - (data[count].W / 2), LayoutHeight / 2 - (data[count].H / 2), data[count].W, data[count].H), 
	    true,
	    {
	        texture = data[count].texture
	    }
	);

	ELEMENT.buttonBack = clButton(
	    ELEMENT, 
	    data[count].buttonLeftX, 
	    data[count].buttonLeftY,
	    data[count].buttonWidth, 
	    30,
	    loc(TID_Main_Menu_Campaign_Back),
	    'showCampaign(0);',
	    {}
	);

	ELEMENT.buttonLoad = clButton(
	    ELEMENT, 
	    data[count].buttonRightX, 
	    data[count].buttonRightY,
	    data[count].buttonWidth, 
	    30,
	    loc(TID_Main_Menu_Campaign_Load), 
	    'showLoadGame(1);',
	    {}
	);

	ELEMENT.description = getLabelEX(
	    ELEMENT, 
	    anchorNone, 
	    XYWH(data[count].descriptionX, data[count].descriptionY, data[count].descriptionWidth, 40),
	    nil, 
	    '',
	    {
			nomouseevent = true,
	        font_colour = WHITE(),
	        font_name = Arial_12,
	        text_halign = ALIGN_MIDDLE,
	        wordwrap = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	 	}
	);

	for i = 1, count do
		getImageButtonEX(
			ELEMENT, 
			anchorNone, 
			XYWH(
				data[count].campaings[i].X,
				data[count].campaings[i].Y,
				153,
				173
			), 
			'', 
			'', 
			'runCampaign(' .. campaingsDetails[i].id .. ')', 
			SKINTYPE_NONE,
			{
				texture = campaingsDetails[i].texture,
				callback_mouseover = 'displayCampDescription(' .. ELEMENT.description.ID .. ',' .. campaingsDetails[i].description ..')',
				callback_mouseleave = 'displayCampDescription(' .. ELEMENT.description.ID .. ', 0)',
			}
		);
	end;

	return ELEMENT;
end;

function displayCampDescription(ID, TEXT)
	if (TEXT == 0) then
		setTextID(ID, '');
	else
		setTextID(ID, loc(TEXT));
	end;
end;

function parseCampaings()
	if (getvalue(OWV_ISMOD)) then
		local dir = getvalue(OWV_MODDIR);
		local result = {
			Am = false,
			Ar = false,
			Ru = false,
			Ap = false,
			X1 = false,
			X2 = false,
			COUNT = 0
		};

		local campaings = {
			'Am', 'Ar', 'Ru', 'Ap', 'X1', 'X2',
		};

		for c = 1, 6 do
			local tmp = OW_FILELIST('%ow%/mods/' .. dir .. '/Campaigns/' .. campaings[c] .. '/');

			if (table.getn(tmp) > 0) then
				for i = 1, table.getn(tmp) do
					if (string.lower(tmp[i]) == 'missions.dat') then
						result[campaings[c]] = true;
						result['COUNT'] = result['COUNT'] + 1;
						break;
					end;
				end;
			end;
		end;

		return result;
	end;

	return {
		Am = true,
		Ar = false,
		Ru = true,
		Ap = false,
		X1 = false,
		X2 = false,
		COUNT = 2
	};
end;

function startGame()
	showCampaign(0);
	showMenuButton(1);

	if CAMPAIGN_ID > 0 then
		ChangeInterface(parseInt(CAMPAIGN_ID));
	end;
	
	OW_camprun();
end;

menu.window_campaign = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

menu.window_campaign.panel = getCampaignSelectWindow(menu.window_campaign);

-- campaign tree window
menu.window_campaign_tree = getElementEX(
	menu, 
	anchorLTRB,
	XYWH(
		0, 
		0, 
		LayoutWidth,
		LayoutHeight
	),
	false,
	{
		colour1 = BLACK(), 
	}
);

menu.window_campaign_tree.panel = getElementEX(
	menu.window_campaign_tree,
	anchorLTRB,
	XYWH(LayoutWidth / 2 - 400, LayoutHeight / 2 - 300, 800, 600),
	true,
	{}
);

menu.window_campaign_tree.panel.scrollbox = getScrollboxEX(
	menu.window_campaign_tree.panel,
	anchorNone,
	XYWH(10, 40, menu.window_campaign_tree.panel.width - 262, menu.window_campaign_tree.panel.height - 72),
	{
		colour1 = WHITEA()
	}
);

menu.window_campaign_tree.panel.scrollV = clScrollboxEX(
    menu.window_campaign_tree.panel,
    anchorTRB,
    XYWH(
        menu.window_campaign_tree.panel.scrollbox.x + menu.window_campaign_tree.panel.scrollbox.width + 1, 
        menu.window_campaign_tree.panel.scrollbox.y, 
        12,
        menu.window_campaign_tree.panel.scrollbox.height
    ), 
    menu.window_campaign_tree.panel.scrollbox, 
    SKINTYPE_NONE,
    false,
    'Amer',
    {
    	returnAllData = true
    }
);

menu.window_campaign_tree.panel.scrollH = clScrollboxEX(
    menu.window_campaign_tree.panel,
    anchorTRB,
    XYWH(
        menu.window_campaign_tree.panel.scrollbox.x, 
        menu.window_campaign_tree.panel.scrollbox.y + menu.window_campaign_tree.panel.scrollbox.height + 1, 
        menu.window_campaign_tree.panel.scrollbox.width,
        12
    ), 
    menu.window_campaign_tree.panel.scrollbox, 
    SKINTYPE_NONE,
    true,
    'Amer',
    {
    	returnAllData = true
    }
);

-- sidebar
menu.window_campaign_tree.panel.sidebar = getElementEX(
	menu.window_campaign_tree.panel,
	anchorTRB,
	XYWH(
		menu.window_campaign_tree.panel.width - 225,
		0,
		200,
		menu.window_campaign_tree.panel.height
	),
	true,
	{
		colour1 = WHITEA()
	}
);

menu.window_campaign_tree.panel.sidebar.text = getLabelEX(
	menu.window_campaign_tree.panel.sidebar,
	anchorLTR,
	XYWH(
		20,
		0,
		menu.window_campaign_tree.panel.sidebar.width - 20,
		300
	),
	ADMUI3L,
    loc(TID_Main_Menu_Campaign_Hint1) .. '\n\n' .. loc(TID_Main_Menu_Campaign_Hint2) .. '\n\n' .. loc(TID_Main_Menu_Campaign_Hint3),
    {
   		wordwrap = true,
		font_colour = WHITE(),
		text_valign = ALIGN_TOP,
		scissor = true
	}
);

menu.window_campaign_tree.panel.sidebar.checkboxEasy = clCheckbox(
	menu.window_campaign_tree.panel.sidebar, 
	35, 
	menu.window_campaign_tree.panel.sidebar.height - 220, 
	'selectDifficulty(1)', 
	{
		W = 14,
		H = 15,
		textureChecked = 'classic/edit/campaign/window/checkbox-am-easy.png',
		textureUnchecked = 'classic/edit/campaign/window/checkbox-am-unchecked.png',
	}
);

menu.window_campaign_tree.panel.sidebar.labelEasy = getLabelEX(
	menu.window_campaign_tree.panel.sidebar,
	anchorLT,
	XYWH(
		56, 
		menu.window_campaign_tree.panel.sidebar.height - 220, 
		50, 
		14
	),
	ADMUI3L,
	loc(TID_Main_Menu_Campaign_American_Adventurer),
   	{
   		font_colour = WHITE(), 
   		nomouseevent = true,
   	}
);

menu.window_campaign_tree.panel.sidebar.checkboxMedium = clCheckbox(
	menu.window_campaign_tree.panel.sidebar, 
	35, 
	menu.window_campaign_tree.panel.sidebar.height - 200, 
	'selectDifficulty(2)', 
	{
		W = 14,
		H = 15,
		textureChecked = 'classic/edit/campaign/window/checkbox-am-medium.png',
		textureUnchecked = 'classic/edit/campaign/window/checkbox-am-unchecked.png',
		checked = true
	}
);

menu.window_campaign_tree.panel.sidebar.labelMedium = getLabelEX(
	menu.window_campaign_tree.panel.sidebar,
	anchorLT,
	XYWH(
		56, 
		menu.window_campaign_tree.panel.sidebar.height - 200, 
		50, 
		14
	),
	ADMUI3L,
	loc(TID_Main_Menu_Campaign_American_Commander),
   	{
   		font_colour = WHITE(), 
   		nomouseevent = true,
   	}
);

menu.window_campaign_tree.panel.sidebar.checkboxHard = clCheckbox(
	menu.window_campaign_tree.panel.sidebar, 
	35, 
	menu.window_campaign_tree.panel.sidebar.height - 180, 
	'selectDifficulty(3)', 
	{
		W = 14,
		H = 15,
		textureChecked = 'classic/edit/campaign/window/checkbox-am-hard.png',
		textureUnchecked = 'classic/edit/campaign/window/checkbox-am-unchecked.png',
	}
);

menu.window_campaign_tree.panel.sidebar.labelHard = getLabelEX(
	menu.window_campaign_tree.panel.sidebar,
	anchorLT,
	XYWH(
		56, 
		menu.window_campaign_tree.panel.sidebar.height - 180, 
		50, 
		14
	),
	ADMUI3L,
	loc(528),
   	{
   		font_colour = WHITE(), 
   		nomouseevent = true,
   	}
);

menu.window_campaign_tree.panel.sidebar.checkboxVHard = clCheckbox(
	menu.window_campaign_tree.panel.sidebar, 
	35, 
	menu.window_campaign_tree.panel.sidebar.height - 160, 
	'selectDifficulty(4)', 
	{
		W = 14,
		H = 15,
		textureChecked = 'classic/edit/campaign/window/checkbox-am-very-hard.png',
		textureUnchecked = 'classic/edit/campaign/window/checkbox-am-unchecked.png',
		--visible = false
	}
);

menu.window_campaign_tree.panel.sidebar.labelVHard = getLabelEX(
	menu.window_campaign_tree.panel.sidebar,
	anchorLT,
	XYWH(
		56, 
		menu.window_campaign_tree.panel.sidebar.height - 160, 
		50, 
		14
	),
	ADMUI3L,
	loc(TID_Main_Menu_Campaign_American_Master_Strategist),
   	{
   		font_colour = WHITE(), 
   		nomouseevent = true,
   		--visible = false
   	}
);

menu.window_campaign_tree.panel.sidebar.run = clButton(
	menu.window_campaign_tree.panel.sidebar,
	35,
	menu.window_campaign_tree.panel.sidebar.height - 125,
	menu.window_campaign_tree.panel.sidebar.width - 40,
	20,
	'',
	'startGame();',
    {
    	skintype = SKINTYPE_BUTTON,
    	font_colour = WHITE(),
    	font_name = ADMUI3L
    }
);

menu.window_campaign_tree.panel.sidebar.delete = clButton(
	menu.window_campaign_tree.panel.sidebar,
	35,
	menu.window_campaign_tree.panel.sidebar.height - 100,
	menu.window_campaign_tree.panel.sidebar.width - 40,
	20,
	loc(TID_Main_Menu_Campaign_American_Delete),
	'',
    {
    	skintype = SKINTYPE_BUTTON,
    	font_colour = WHITE(),
    	font_name = ADMUI3L
    }
);

menu.window_campaign_tree.panel.sidebar.back = clButton(
	menu.window_campaign_tree.panel.sidebar,
	35,
	menu.window_campaign_tree.panel.sidebar.height - 75,
	menu.window_campaign_tree.panel.sidebar.width - 40,
	20,
	loc(TID_msg_Cancel),
	'showCampaign(0)',
    {
    	skintype = SKINTYPE_BUTTON,
    	font_colour = WHITE(),
    	font_name = ADMUI3L
    }
);

function FROMOW_SET_CAMP_DIFF(DIFF) -- Called by OW!
	setChecked(menu.window_campaign_tree.panel.sidebar.checkboxEasy, false);
    setChecked(menu.window_campaign_tree.panel.sidebar.checkboxMedium, false);
    setChecked(menu.window_campaign_tree.panel.sidebar.checkboxHard, false);
    setChecked(menu.window_campaign_tree.panel.sidebar.checkboxVHard, false);

	if (DIFF == 1) then
        setChecked(menu.window_campaign_tree.panel.sidebar.checkboxEasy, true);
	end;

	if (DIFF == 2) then
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxMedium, true);
	end;

	if (DIFF == 3) then
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxHard, true);
	end;

	if (DIFF == 4) then
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxVHard, true);
	end;

	OW_campdiff(DIFF);
end;

function FROMOW_SET_CAMP_RUN_BUTTON(ID) -- Called by OW!
	setText(menu.window_campaign_tree.panel.sidebar.run, loc(ID));
end;


function FROMOW_SET_CAMP_RUN_BUTTON_VIS(VALUE) -- Called by OW!
	setVisible(menu.window_campaign_tree.panel.sidebar.run, VALUE);
	setVisible(menu.window_campaign_tree.panel.sidebar.delete, VALUE);
end;

function FROMOW_CAMP_TREE_MAKE_TEXT(X, Y, TEXT) -- Called by OW!
	getLabelEX(menu.window_campaign_tree.panel.scrollbox,
		anchorLT,
		XYWH(X, Y, 150, 30),
		Tahoma_12,
		TEXT,
       	{
       		font_colour = RGB(163, 230, 170), 
       		colour1 = BLACKA(0), 
       		nomouseevent = true, 
       		wordwrap = true,
       	}
    );
end;

function selectDifficulty(DIFFICULTY)
	if DIFFICULTY == 1 then
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxMedium, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxHard, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxVHard, false);

		if (not getChecked(menu.window_campaign_tree.panel.sidebar.checkboxEasy)) then
			setChecked(menu.window_campaign_tree.panel.sidebar.checkboxEasy, true);
		end;
	elseif DIFFICULTY == 2 then
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxEasy, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxHard, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxVHard, false);

		if (not getChecked(menu.window_campaign_tree.panel.sidebar.checkboxMedium)) then
			setChecked(menu.window_campaign_tree.panel.sidebar.checkboxMedium, true);
		end;
	elseif DIFFICULTY == 3 then
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxEasy, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxMedium, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxVHard, false);

		if (not getChecked(menu.window_campaign_tree.panel.sidebar.checkboxHard)) then
			setChecked(menu.window_campaign_tree.panel.sidebar.checkboxHard, true);
		end;
	elseif DIFFICULTY == 4 then
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxEasy, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxMedium, false);
		setChecked(menu.window_campaign_tree.panel.sidebar.checkboxHard, false);

		if (not getChecked(menu.window_campaign_tree.panel.sidebar.checkboxVHard)) then
			setChecked(menu.window_campaign_tree.panel.sidebar.checkboxVHard, true);
		end;
	end;

	OW_campdiff(DIFFICULTY);
end;

function deleteCampaign(ID)
	if (OW_CAMPDELETE()) then
		runCampaign(ID);
	end;
end;


function showCampaign(mode)
	if mode == 1 then    
		local loadGameStatus = parseInt(OW_SAVENEXIT_CHECK());

		if loadGameStatus == 0 or loadGameStatus == 2 then
	        return;
	    end;

		showMenuButton(0);
		setVisible(menu.window_campaign, true);
		setFontName(menu.window_campaign_tree.panel.sidebar.run, ADMUI3L);
		setFontName(menu.window_campaign_tree.panel.sidebar.delete, ADMUI3L);
		setFontName(menu.window_campaign_tree.panel.sidebar.back, ADMUI3L);
	else
		showMenuButton(2);
		setVisible(menu.window_campaign, false);
		setVisible(menu.window_campaign_tree, false);
	end;
end;

function runCampaign(ID)
	CAMPAIGN_ID = parseInt(ID) + 1;

	setVisible(menu.window_campaign, false);
	setVisible(menu.window_campaign_tree, true);

	local camp, lowerCamp, interface, backgroundImage, scrollboxPos, sidebarPos, campText;

	local campContainerWidth = 1920;
	local campContainerHeight = 1080;
	local campContainerX = 0;
	local campContainerY = 0;

	if (ScrWidth <= campContainerWidth) then
		campContainerWidth = ScrWidth;
	else
		campContainerX = ScrWidth / 2 - (campContainerWidth / 2);
	end;

	if (ScrHeight <= campContainerHeight) then
		campContainerHeight = ScrHeight;
	else
		campContainerY = ScrHeight / 2 - (campContainerHeight / 2);
	end;

	if (ID == 0) then
		backgroundImage = 'classic/edit/campaign/window/am-campaign.png';
		interface = 'Amer';
		camp = 'Am';
		lowerCamp = 'am';
		scrollboxPos = XYWH(20, round(campContainerHeight * 0.07), round(campContainerWidth * 0.7) - 30, campContainerHeight - round(campContainerHeight * 0.07) - 30);
		sidebarPos = XYWH(round(campContainerWidth * 0.73), round(campContainerHeight * 0.07), round(campContainerWidth * 0.98) - round(campContainerWidth * 0.73), campContainerHeight - round(campContainerHeight * 0.07) - 30);
		campText = loc(9990);
	elseif (ID == 1) then
		backgroundImage = 'classic/edit/campaign/window/ar-campaign.png';
		interface = 'Arab';
		camp = 'Ar';
		lowerCamp = 'ar';
		scrollboxPos = XYWH(round(campContainerHeight * 0.12), round(campContainerHeight * 0.13), round(campContainerWidth * 0.63) - 30, campContainerHeight - round(campContainerHeight * 0.14) - 30);
		sidebarPos = XYWH(round(campContainerWidth * 0.73), round(campContainerHeight * 0.07), round(campContainerWidth * 0.99) - round(campContainerWidth * 0.73), campContainerHeight - round(campContainerHeight * 0.07) - 30);campText = loc(9993);		
		campText = loc(9991);
	elseif (ID == 2) then
		backgroundImage = 'classic/edit/campaign/window/ru-campaign.png';
		interface = 'Rus';
		camp = 'Ru';
		lowerCamp = 'ru';
		scrollboxPos = XYWH(round(campContainerHeight * 0.11), round(campContainerHeight * 0.11), round(campContainerWidth * 0.64) - 30, campContainerHeight - round(campContainerHeight * 0.11) - 30);
		sidebarPos = XYWH(round(campContainerWidth * 0.73), round(campContainerHeight * 0.07), round(campContainerWidth * 0.98) - round(campContainerWidth * 0.73), campContainerHeight - round(campContainerHeight * 0.07) - 30);
		campText = loc(9992);
	elseif (ID == 3) then
		backgroundImage = 'classic/edit/campaign/window/ap-campaign.png';
		interface = 'Ape';
		camp = 'Ap';
		lowerCamp = 'ap';
		scrollboxPos = XYWH(round(campContainerHeight * 0.12), round(campContainerHeight * 0.13), round(campContainerWidth * 0.63) - 30, campContainerHeight - round(campContainerHeight * 0.14) - 30);
		sidebarPos = XYWH(round(campContainerWidth * 0.73), round(campContainerHeight * 0.07), round(campContainerWidth * 0.99) - round(campContainerWidth * 0.73), campContainerHeight - round(campContainerHeight * 0.07) - 30);campText = loc(9993);		
		campText = loc(9993);
	elseif (ID == 4) then
		backgroundImage = 'classic/edit/campaign/window/ar-campaign.png';
		interface = 'Arab';
		camp = 'X1';
		lowerCamp = 'ar';
		scrollboxPos = XYWH(round(campContainerHeight * 0.12), round(campContainerHeight * 0.13), round(campContainerWidth * 0.63) - 30, campContainerHeight - round(campContainerHeight * 0.14) - 30);
		sidebarPos = XYWH(round(campContainerWidth * 0.73), round(campContainerHeight * 0.07), round(campContainerWidth * 0.99) - round(campContainerWidth * 0.73), campContainerHeight - round(campContainerHeight * 0.07) - 30);
		campText = loc(9994);
	else
		backgroundImage = 'classic/edit/campaign/window/ar-campaign.png';
		interface = 'Arab';
		camp = 'X2';
		lowerCamp = 'x2';
		scrollboxPos = XYWH(round(campContainerHeight * 0.12), round(campContainerHeight * 0.13), round(campContainerWidth * 0.63) - 30, campContainerHeight - round(campContainerHeight * 0.14) - 30);
		sidebarPos = XYWH(round(campContainerWidth * 0.73), round(campContainerHeight * 0.07), round(campContainerWidth * 0.99) - round(campContainerWidth * 0.73), campContainerHeight - round(campContainerHeight * 0.07) - 30);campText = loc(9995);
		campText = loc(9995);
	end;

	setXYWH(menu.window_campaign, {
		X = 0,
		Y = 0,
		W = ScrWidth,
		H = ScrHeight
	});

	setXYWH(menu.window_campaign_tree, {
		X = campContainerX, 
		Y = campContainerY, 
		W = campContainerWidth, 
		H = campContainerHeight
	});
	
	setXYWH(menu.window_campaign_tree.panel, {
		X = 0, 
		Y = 0, 
		W = campContainerWidth, 
		H = campContainerHeight
	});

	setTexture(menu.window_campaign_tree.panel, backgroundImage);

	setXYWH(menu.window_campaign_tree.panel.scrollbox, scrollboxPos);

	--setColour1(menu.window_campaign_tree.panel.scrollbox, RGBA(255, 0, 0, 50));
	--setColour1({ID = menu.window_campaign_tree.panel.scrollV.id}, RGBA(128, 0, 128, 50));
	--setColour1({ID = menu.window_campaign_tree.panel.scrollH.id}, RGBA(0, 128, 128, 50));
	--setColour1(menu.window_campaign_tree.panel.sidebar, RGBA(0, 255, 0, 50));

	setXYWH({ID = menu.window_campaign_tree.panel.scrollH.id}, {
		X = scrollboxPos.X,
		Y = scrollboxPos.Y + scrollboxPos.H + 1,
		W = scrollboxPos.W,
        H = 12
	});

	setXYWH({ID = menu.window_campaign_tree.panel.scrollV.id}, {
		X = scrollboxPos.X + scrollboxPos.W + 1,
		Y = scrollboxPos.Y,
		W = 12,
		H = scrollboxPos.H
	});

	setXYWH(menu.window_campaign_tree.panel.sidebar, sidebarPos);

	setText(menu.window_campaign_tree.panel.sidebar.text, loc(TID_Main_Menu_Campaign_Hint1) 
		.. '\n\n' 
		.. loc(TID_Main_Menu_Campaign_Hint2) 
		.. '\n\n'
		.. campText
		.. '\n\n'
		.. loc(TID_Main_Menu_Campaign_Hint3)
	);

	local sidebarWidth = getWidth(menu.window_campaign_tree.panel.sidebar);
	local sidebarHeight = getHeight(menu.window_campaign_tree.panel.sidebar);
	local sidebarHeightP = round(sidebarHeight * 0.7);

	setXY(menu.window_campaign_tree.panel.sidebar.checkboxEasy, 20, sidebarHeightP);
	setXY(menu.window_campaign_tree.panel.sidebar.labelEasy, 40, sidebarHeightP);

	setXY(menu.window_campaign_tree.panel.sidebar.checkboxMedium, 20, sidebarHeightP + 20);
	setXY(menu.window_campaign_tree.panel.sidebar.labelMedium, 40, sidebarHeightP + 20);

	setXY(menu.window_campaign_tree.panel.sidebar.checkboxHard, 20, sidebarHeightP + 40);
	setXY(menu.window_campaign_tree.panel.sidebar.labelHard, 40, sidebarHeightP + 40);

	setXY(menu.window_campaign_tree.panel.sidebar.checkboxVHard, 20, sidebarHeightP + 60);
	setXY(menu.window_campaign_tree.panel.sidebar.labelVHard, 40, sidebarHeightP + 60);

	setHeight(menu.window_campaign_tree.panel.sidebar.text, sidebarHeightP - 30);

	setXYWH(menu.window_campaign_tree.panel.sidebar.run, {
		X = 20,
		Y = sidebarHeightP + 100,
		W = sidebarWidth - 20,
		H = 20
	});
	
	setXYWH(menu.window_campaign_tree.panel.sidebar.delete, {
		X = 20,
		Y = sidebarHeightP + 125,
		W = sidebarWidth - 20,
		H = 20
	});

	setXYWH(menu.window_campaign_tree.panel.sidebar.back, {
		X = 20,
		Y = sidebarHeightP + 150,
		W = sidebarWidth - 20,
		H = 20
	});

	local texture, texture2, texture3;

	texture = 'SGUI/' .. interface .. '/button_left.png';
	texture2 = 'SGUI/' .. interface .. '/button_middle.png';
	texture3 = 'SGUI/' .. interface .. '/button_right.png';

	setTexture(menu.window_campaign_tree.panel.sidebar.back, texture);
	setTexture2(menu.window_campaign_tree.panel.sidebar.back, texture2);
	setTexture3(menu.window_campaign_tree.panel.sidebar.back, texture3);

	setTexture(menu.window_campaign_tree.panel.sidebar.run, texture);
	setTexture2(menu.window_campaign_tree.panel.sidebar.run, texture2);
	setTexture3(menu.window_campaign_tree.panel.sidebar.run, texture3);

	setTexture(menu.window_campaign_tree.panel.sidebar.delete, texture);
	setTexture2(menu.window_campaign_tree.panel.sidebar.delete, texture2);
	setTexture3(menu.window_campaign_tree.panel.sidebar.delete, texture3);

	clUpdateScrollboxEX(menu.window_campaign_tree.panel.scrollV, interface);
	clUpdateScrollboxEX(menu.window_campaign_tree.panel.scrollH, interface);

	setTexture(menu.window_campaign_tree.panel.sidebar.checkboxEasy, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-unchecked.png');
	setTexture(menu.window_campaign_tree.panel.sidebar.checkboxMedium, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-unchecked.png');
	setTexture(menu.window_campaign_tree.panel.sidebar.checkboxHard, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-unchecked.png');
	setTexture(menu.window_campaign_tree.panel.sidebar.checkboxVHard, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-unchecked.png');
	setTexture2(menu.window_campaign_tree.panel.sidebar.checkboxEasy, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-easy.png');
	setTexture2(menu.window_campaign_tree.panel.sidebar.checkboxMedium, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-medium.png');
	setTexture2(menu.window_campaign_tree.panel.sidebar.checkboxHard, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-hard.png');
	setTexture2(menu.window_campaign_tree.panel.sidebar.checkboxVHard, 'classic/edit/campaign/window/checkbox-' .. lowerCamp .. '-very-hard.png');

	set_Callback(menu.window_campaign_tree.panel.sidebar.delete.ID, CALLBACK_MOUSEUP, 'deleteCampaign(' .. ID .. ');');

	selectDifficulty(2);
	OW_loadcampaign(menu.window_campaign_tree.panel.scrollbox.ID, camp);
end