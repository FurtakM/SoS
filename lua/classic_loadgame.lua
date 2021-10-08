LOADGAME_DATA = {};
LOADGAME_DATA_ACTIVE = nil;
LOADGAME_DATA_SORT = nil;

function FROMOW_SAVEGAME_LIST(DATA)
	for i = 1,loadsave.list.COUNT do
		loadsave.setList(loadsave.list.LIST[i], DATA);
	end;

--[[
	DATA
	    SAVENAME
	    TIME
	    TIMESORT
	    NAME
	    MAP
	    CAMP
--]] 
	setEnabled(menu.window_loadgame.panel.delete, false);
	setEnabled(menu.window_loadgame.panel.ok, false);
	setText(menu.window_loadgame.panel.name, '');
	setTexture(menu.window_loadgame.panel.image, '');

	local displayData = {};

	for i = 1, table.getn(DATA) do
		displayData[i] = DATA[i].CAMP .. DATA[i].MAP .. '\t  ' .. DATA[i].NAME;
	end;

	LOADGAME_DATA = DATA;
	LOADGAME_DATA_ACTIVE = nil;
	LOADGAME_DATA_SORT = nil;

	clSetListItems(menu.window_loadgame.panel.list, displayData, 0, 'selectSaveGame("INDEX")', {});
end;

menu.window_loadgame = getElementEX(
    menu, 
    anchorLTRB, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = BLACKA(50)
    }
);

menu.window_loadgame.panel = getElementEX(
	menu.window_loadgame, 
	anchorNone,
	XYWH(
		(LayoutWidth / 2) - 222, 
		(LayoutHeight / 2) - 160, 
		444,
		320
	),
	true,
	{
		texture = 'classic/edit/background_load.png'
	}
);

menu.window_loadgame.panel.name = getLabelEX(
	menu.window_loadgame.panel,
	anchorL,
	XYWH(
		12, 
		28,
		50, 
		14
	),
	Arial_14,
	'',
   	{
   		font_colour = BLACK(), 
   		nomouseevent = true,
   	}
);

menu.window_loadgame.panel.sortTime = clCheckbox(
    menu.window_loadgame.panel,
    213,
    29,
    'sortGameSave(%id, 0);',
    {
        checked = false
    }
);

menu.window_loadgame.panel.sortTimeLabel = getLabelEX(
    menu.window_loadgame.panel,
    anchorLT,
    XYWH(233, 28, 90, 14),
    BankGotic_14, 
    loc(TID_InGame_LoadSave_Time),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false
    }
);

menu.window_loadgame.panel.sortMission = clCheckbox(
    menu.window_loadgame.panel,
    213,
    54,
    'sortGameSave(%id, 1);',
    {
        checked = false
    }
);

menu.window_loadgame.panel.sortMissionLabel = getLabelEX(
    menu.window_loadgame.panel,
    anchorLT,
    XYWH(233, 53, 90, 14),
    BankGotic_14, 
    loc(TID_InGame_LoadSave_Mission),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false
    }
);

menu.window_loadgame.panel.sortDescription = clCheckbox(
    menu.window_loadgame.panel,
    213,
    79,
    'sortGameSave(%id, 2);',
    {
        checked = false
    }
);

menu.window_loadgame.panel.sortMissionLabel = getLabelEX(
    menu.window_loadgame.panel,
    anchorLT,
    XYWH(233, 78, 90, 14),
    BankGotic_14, 
    loc(TID_InGame_LoadSave_Description),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false
    }
);

menu.window_loadgame.panel.list = clListBox(
	menu.window_loadgame.panel, 
	XYWH(6, 50, 197, 226), 
	{}, 
	1, 
	'', 
	{}
);

menu.window_loadgame.panel.image = getElementEX(
	menu.window_loadgame.panel, 
	anchorNone,
	XYWH(
		211, 
		109, 
		220,
		160
	),
	true,
	{
		colour1 = RGB(231, 222, 214),
	}
);

menu.window_loadgame.panel.image.border = getElementEX(
	menu.window_loadgame.panel, 
	anchorNone,
	XYWH(
		210, 
		108, 
		222,
		162
	),
	true,
	{
		texture = 'classic/edit/background_load_border.png',
	}
);

menu.window_loadgame.panel.cancel = clButton(
	menu.window_loadgame.panel,
	10,
	280,
	138,
	16,
	loc(TID_msg_Cancel),
	'showLoadGame(0)',
    {}
);

menu.window_loadgame.panel.delete = clButton(
	menu.window_loadgame.panel,
	153,
	280,
	138,
	16,
	loc(TID_InGame_LoadSave_Delete),
	'deleteGame()',
    {
    	disabled = true
    }
); 

menu.window_loadgame.panel.ok = clButton(
	menu.window_loadgame.panel,
	296,
	280,
	138,
	16,
	loc(TID_msg_Ok),
	'loadGame()',
    {
    	disabled = true
    }
);

function loadGame()
	if strlen(LOADGAME_DATA_ACTIVE) then
		OW_SAVEGAME_LOAD(LOADGAME_DATA_ACTIVE);
	end;
end;

function deleteGame()
	if strlen(LOADGAME_DATA_ACTIVE) then
		if OW_SAVEGAME_DELETE(LOADGAME_DATA_ACTIVE) then
			OW_SAVEGAME_GET();
		end;
	end;
end;

function selectSaveGame(INDEX)
	INDEX = parseInt(INDEX);

	clSetListSelectedItem(menu.window_loadgame.panel.list.ID, INDEX);
	setText(menu.window_loadgame.panel.name, LOADGAME_DATA[INDEX].NAME);
	setEnabled(menu.window_loadgame.panel.delete, true);
	setEnabled(menu.window_loadgame.panel.ok, true);

	LOADGAME_DATA_ACTIVE = LOADGAME_DATA[INDEX].SAVENAME;

	OW_SAVEGAME_PREVIEW_GET(menu.window_loadgame.panel.image.ID, LOADGAME_DATA[INDEX].SAVENAME);	
end;

function sortGameSave(ID, SORT)
	if (not getCheckedID(ID)) then
		if (SORT == LOADGAME_DATA_SORT) then
			OW_SAVEGAME_GET();
		end;
	else
		if (SORT == LOADGAME_DATA_SORT) then
			return;
		end;

		if (LOADGAME_DATA_SORT == 0) then
			setChecked(menu.window_loadgame.panel.sortTime, false);
		elseif (LOADGAME_DATA_SORT == 1) then
			setChecked(menu.window_loadgame.panel.sortMission, false);
		elseif (LOADGAME_DATA_SORT == 2) then
			setChecked(menu.window_loadgame.panel.sortDescription, false);
		end;

		LOADGAME_DATA_SORT = SORT;

		local data = {};

		if (SORT == 0) then -- sort by TIME
			for i = 1, table.getn(LOADGAME_DATA) do
				local count = table.getn(data);

				if (count == 0) then
					table.insert(data, 1, LOADGAME_DATA[i]);
					goto continue
				end;

				for j = 1, count do
					if data[j].TIMESORT > LOADGAME_DATA[i].TIMESORT then
						table.insert(data, j, LOADGAME_DATA[i]);
						goto continue
					end;
				end;

				table.insert(data, count, LOADGAME_DATA[i]);

				::continue::
			end;
		elseif (SORT == 1) then -- sort by MISSION
			for i = 1, table.getn(LOADGAME_DATA) do
				local count = table.getn(data);

				if (count == 0) then
					table.insert(data, 1, LOADGAME_DATA[i]);
					goto continue
				end;

				for j = 1, count do
					if data[j].CAMP > LOADGAME_DATA[i].CAMP then
						table.insert(data, j, LOADGAME_DATA[i]);
						goto continue
					elseif data[j].CAMP == LOADGAME_DATA[i].CAMP then
						if (data[j].MAP > LOADGAME_DATA[i].MAP) then
							table.insert(data, j, LOADGAME_DATA[i]);
							goto continue
						end;
					end;
				end;

				table.insert(data, count, LOADGAME_DATA[i]);

				::continue::
			end;
		else -- sort by DESCRIPTION
			for i = 1, table.getn(LOADGAME_DATA) do
				local count = table.getn(data);

				if (count == 0) then
					table.insert(data, 1, LOADGAME_DATA[i]);
					goto continue
				end;

				for j = 1, count do
					if data[j].NAME > LOADGAME_DATA[i].NAME then
						table.insert(data, j, LOADGAME_DATA[i]);
						goto continue
					end;
				end;

				table.insert(data, count, LOADGAME_DATA[i]);

				::continue::
			end;
		end;

		local displayData = {};

		for i = 1, table.getn(data) do
			displayData[i] = data[i].CAMP .. data[i].MAP .. '\t  ' .. data[i].NAME;
		end;

		LOADGAME_DATA = data;
		LOADGAME_DATA_ACTIVE = nil;

		clSetListItems(menu.window_loadgame.panel.list, displayData, 0, 'selectSaveGame("INDEX")', {});
		
		setEnabled(menu.window_loadgame.panel.delete, false);
		setEnabled(menu.window_loadgame.panel.ok, false);
		setText(menu.window_loadgame.panel.name, '');
		setTexture(menu.window_loadgame.panel.image, '');
	end;
end;

function showLoadGame(MODE)
	if MODE == 1 then
		setVisible(menu.window_loadgame, true);
		OW_SAVEGAME_GET();
	else
		setVisible(menu.window_loadgame, false);
	end;
end;