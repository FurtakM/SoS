MAP_DESCRIPTION_WINDOW_ACTIVE = false;

dialog.map = getDialogEX(
	dialog.back,
	anchorNone,
	XYWH(
		LayoutWidth / 2 - 200, 
		125, 
		600, 
		540
	),
	SKINTYPE_DIALOG1,
	{
		tile = true
	}
);

dialog.map.btnPage1 = getImageButtonEX(
	dialog.map,
	anchorT,
	XYWH(
		20,
		16,
		120,
		24
	),
    loc(9904),
    '',
    'showMapDescriptionPage(1);',
    SKINTYPE_BUTTON,
    {
    	font_colour_disabled = GRAY(127)
    }
);

dialog.map.btnPage2 = getImageButtonEX(
	dialog.map,
	anchorT,
	XYWH(
		140,
		16,
		120,
		24
	),
    loc(9905),
    '',
    'showMapDescriptionPage(2);',
    SKINTYPE_BUTTON,
    {
    	font_colour_disabled = GRAY(127)
    }
);

dialog.map.btnPage3 = getImageButtonEX(
	dialog.map,
	anchorT,
	XYWH(
		260,
		16,
		120,
		24
	),
    loc(9906),
    '',
    'showMapDescriptionPage(3);',
    SKINTYPE_BUTTON,
    {
    	font_colour_disabled = GRAY(127)
    }
);

dialog.map.btnPage4 = getImageButtonEX(
	dialog.map,
	anchorT,
	XYWH(
		380,
		16,
		120,
		24
	),
    'Netstat',
    '',
    'showMapDescriptionPage(4);',
    SKINTYPE_BUTTON,
    {
    	font_colour_disabled = GRAY(127)
    }
);

dialog.map.name = getLabelEX(
    dialog.map, 
    anchorT, 
    XYWH(0, 48, dialog.map.width, 18),
    nil, 
    'NAME',
	{
		nomouseevent = true,
        font_colour = RGBA(250, 250, 250, 255),
        text_halign = ALIGN_MIDDLE,
        font_name = Tahoma_18B
 	}
);

-- PAGE 1
dialog.map.page1 = getElementEX(
	dialog.map,
	anchorLTRB,
	XYWH(
		20, 
		74, 
		dialog.map.width - 40, 
		dialog.map.height - 140
	),
	true,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.page1.panel = getElementEX(
	dialog.map.page1,
	anchorLTRB,
	XYWH(
		0, 
		0, 
		dialog.map.page1.width,
		dialog.map.page1.height
	),
	true,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.page1.panel.textbox = getElementEX(
	dialog.map.page1.panel,
	anchorLTR,
	XYWH(
		0, 
		0, 
		dialog.map.page1.panel.width - 20, 
		dialog.map.page1.panel.height
	),
	true,
	{
		type = TYPE_TEXTBOX,
		text = '',
   		colour1 = RGB(16,31,24),
		font_name = Tahoma_13,
		wordwrap = true,
		bevel_colour1 = RGB(76,148,128),
		bevel_colour2 = RGB(76,148,128)
	}
);

dialog.map.page1.panel.textboxscroll = getElementEX(
	dialog.map.page1.panel,
	anchorTRB,
	XYWH(
		dialog.map.page1.panel.textbox.width + 4, 
		0, 
		16, 
		dialog.map.page1.panel.textbox.height
	),
	true,
	{
		type = TYPE_SCROLLBAR,
		colour1 = WHITE(),
		colour2 = WHITE(),
		texture2 = "scrollbar.png",
		tile = true,
		skin = SKINTYPE_SCROLLBARWITHBUTTONS
	}
);

setInterfaceTexture1n2(
	dialog.map.page1.panel.textboxscroll,
	'scrollbar_back_v.png',
	'scrollbar.png'
);

sgui_set(
	dialog.map.page1.panel.textbox.ID,
	PROP_SCROLLBAR,
	dialog.map.page1.panel.textboxscroll.ID
);

-- PAGE 2
dialog.map.page2 = getElementEX(
	dialog.map,
	anchorLTRB,
	XYWH(
		20, 
		74, 
		dialog.map.width - 40, 
		dialog.map.height - 140
	),
	false,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.page2.panel = getElementEX(
	dialog.map.page2,
	anchorLTRB,
	XYWH(
		0, 
		0, 
		dialog.map.page2.width,
		dialog.map.page2.height
	),
	true,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.page2.panel.mapPic = getElementEX(
	dialog.map.page2.panel, 
	anchorLTRB,
	XYWH(
		dialog.map.page2.panel.width / 2 - 250,
		dialog.map.page2.panel.height / 2 - 165,
		500,
		330
	),
	true,
	{
		texture = 'skirmish_unknown.png'
	}
);

-- PAGE 3
dialog.map.page3 = getElementEX(
	dialog.map,
	anchorLTRB,
	XYWH(
		20, 
		74, 
		dialog.map.width - 40, 
		dialog.map.height - 140
	),
	false,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.page3.panel = getElementEX(
	dialog.map.page3,
	anchorLTRB,
	XYWH(
		0, 
		0, 
		dialog.map.page3.width,
		dialog.map.page3.height
	),
	true,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.page3.panel.textbox = getElementEX(
	dialog.map.page3.panel,
	anchorLTR,
	XYWH(
		0, 
		0, 
		dialog.map.page3.panel.width - 20, 
		dialog.map.page3.panel.height
	),
	true,
	{
		type = TYPE_TEXTBOX,
		text = '',
   		colour1 = RGB(16,31,24),
		font_name = Tahoma_13,
		wordwrap = true,
		bevel_colour1 = RGB(76,148,128),
		bevel_colour2 = RGB(76,148,128)
	}
);

dialog.map.page3.panel.textboxscroll = getElementEX(
	dialog.map.page3.panel,
	anchorTRB,
	XYWH(
		dialog.map.page3.panel.textbox.width + 4, 
		0, 
		16, 
		dialog.map.page3.panel.textbox.height
	),
	true,
	{
		type = TYPE_SCROLLBAR,
		colour1 = WHITE(),
		colour2 = WHITE(),
		texture2 = "scrollbar.png",
		tile = true,
		skin = SKINTYPE_SCROLLBARWITHBUTTONS
	}
);

setInterfaceTexture1n2(
	dialog.map.page3.panel.textboxscroll,
	'scrollbar_back_v.png',
	'scrollbar.png'
);

sgui_set(
	dialog.map.page3.panel.textbox.ID,
	PROP_SCROLLBAR,
	dialog.map.page3.panel.textboxscroll.ID
);

-- PAGE 4
dialog.map.page4 = getElementEX(
	dialog.map,
	anchorLTRB,
	XYWH(
		20, 
		74, 
		dialog.map.width - 40, 
		dialog.map.height - 140
	),
	false,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.page4.panel = getElementEX(
	dialog.map.page4,
	anchorLTRB,
	XYWH(
		0, 
		0, 
		dialog.map.page4.width,
		dialog.map.page4.height
	),
	true,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.ok = getImageButtonEX(
	dialog.map,
	anchorB,
	XYWH(
		dialog.map.width / 2 - 75,
		dialog.map.height - 30 - 15,
		150,
		24
	),
    'OK',
    '',
    'HideDialog(dialog.map);OW_FORM_CLOSE(dialog.map.FORMID,OK);MAP_DESCRIPTION_WINDOW_ACTIVE=false;',
    SKINTYPE_BUTTON,
    {
    	font_colour_disabled = GRAY(127)
    }
);

function showMapDescription()
	MAP_DESCRIPTION_WINDOW_ACTIVE = true;
	refreshPlayersPage();
	ShowDialog(dialog.map);

	if (getVisible(dialog.map.page4)) then
		refreshPlayersPingPage();
	end;
end;

function showMapDescriptionPage(PAGE)
	setVisible(dialog.map.page1, PAGE == 1);
	setVisible(dialog.map.page2, PAGE == 2);

	if (PAGE == 2) then
		refreshPlayersPage();		
	end;

	setVisible(dialog.map.page3, PAGE == 3);
	setVisible(dialog.map.page4, PAGE == 4);

	if (PAGE == 4) then
		refreshPlayersPingPage();
	end;
end

function setMapDescription(TEXT)
	setText(dialog.map.page1.panel.textbox, TEXT);
end;

function addMapDescription(TEXT)
	setText(dialog.map.page1.panel.textbox, getText(dialog.map.page1.panel.textbox) .. TEXT);
end;

function turnMapDescription(MODE)
	setEnabled(game.ui.toolbtns[5], MODE);

	if (MODE == false) then
		mapDescription('', '', nil, nil, nil, nil);
	end;
end;

function refreshPlayersPingPage()
	if (not getVisible(dialog.map.page4) or not MAP_DESCRIPTION_WINDOW_ACTIVE) then
		return;
	end;

	sgui_deletechildren(dialog.map.page4.panel.ID);

	if (MULTI_PLAYERINFO_CURRENT_PLID == nil or MULTIPLAYER_ROOM_PING_DATA == nil) then
		local info = getLabelEX(
			dialog.map.page4.panel,
			anchorLTRB,
			XYWH(15, 3, 60, 16),
			nil,
			loc(874),
			{
				font_name = Tahoma_16B,
				colour1 = WHITEA(),
				font_colour = WHITE(),
				text_halign = ALIGN_LEFT,
				text_valign = ALIGN_MIDDLE,
				shadowtext = true
			}
		);	

		return;
	end;

	local PLAYERS = copytable(MULTI_PLAYERINFO_CURRENT_PLID);
	local NETSTAT_DATA = copytable(MULTIPLAYER_ROOM_PING_DATA);
	local row = 1;

	if (PLAYERS ~= nil and #PLAYERS > 0) then
		for i, v in pairs(PLAYERS) do
			local player = v;
			local pingData = '~';

			for k, p in pairs(NETSTAT_DATA) do
				if parseInt(p.PLID) == parseInt(player.PLID) then
					if (parseInt(p.PING) == 65535) then
						p.PING = 0;
					end;

					pingData = p.PING .. 'ms / ' .. p.PACKETS_LOST .. ' ' .. loc(9985) 
								.. ' / ' .. p.PACKETS_SENT .. ' ' .. loc(9987) .. ' / ' .. p.PACKETS_RECIEVED .. ' ' .. loc(9986);
					break;
				end;
			end;

			local info = getLabelEX(
				dialog.map.page4.panel,
				anchorLTRB,
				XYWH(15, 3 + ((row - 1) * 12), 520, 12),
				nil,
				row .. '. ' .. player.NAME .. ': ' .. pingData,
				{
					font_name = Tahoma_12,
					colour1 = WHITEA(),
					font_colour = WHITE(),
					text_halign = ALIGN_LEFT,
					text_valign = ALIGN_MIDDLE,
					shadowtext = true,
					scissor = true
				}
			);

			row = row + 1;			
		end;
	else
		local info = getLabelEX(
			dialog.map.page4.panel,
			anchorLTRB,
			XYWH(15, 3, 30, 16),
			nil,
			loc(874),
			{
				font_name = Tahoma_16B,
				colour1 = WHITEA(),
				font_colour = WHITE(),
				text_halign = ALIGN_LEFT,
				text_valign = ALIGN_MIDDLE,
				shadowtext = true
			}
		);	
	end;

	timer:single(2.5, 'refreshPlayersPingPage();');
end

function refreshPlayersPage()
	if (MULTI_PLAYERINFO_CURRENT_PLID == nil or MULTIPLAYER_ROOM_MAP_EXTRA_DATA.mapPosSides == nil) then
		return;
	end;

	local PLAYERS = copytable(MULTI_PLAYERINFO_CURRENT_PLID);
	local POSITIONS = copytable(MULTIPLAYER_ROOM_MAP_EXTRA_DATA.mapPosSides);
	local REALPOSITIONS = copytable(MULTIPLAYER_REAL_POSITIONS);

	sgui_deletechildren(dialog.map.page2.panel.mapPic.ID);

	if (PLAYERS ~= nil and POSITIONS ~= nil) then
		local scalX = 2.2722;
		local scalY = 1.5000;
		local tmp = {};

		for k, v in pairs(PLAYERS) do
			if REALPOSITIONS[parseInt(v.PLID)] then
				local realPos = parseInt(REALPOSITIONS[parseInt(v.PLID)]);

				if (realPos > 0 and realPos <= #POSITIONS) then
					local coord = POSITIONS[realPos];

					local player = v;

					if (tmp[coord] == nil) then
						local X = (coord.X * scalX);
						local Y = (coord.Y * scalY);

						if (X < 35) then
							X = 35;
						end;

						if (X > 440) then
							X = 440;
						end;

						if (Y < 25) then
							Y = 25;
						end;

						if (Y > 290) then
							Y = 290;
						end;

						local team = player.TEAM;
						local colour = player.COLOUR;

						if not player.ALIVE then
							team = 0;
							colour = 0;
						end;

						local badge = getElementEX(
							dialog.map.page2.panel.mapPic,
							anchorLTRB,
							XYWH(X - 30, Y - 20, 60, 40),
							true,
							{
								texture = 'SGUI/tags/b' .. team .. '.png',
								hint = player.NAME
							}
						);

						if (player.NATION > 0) then
							local nation = 'am';				 

							if (player.NATION == 2) then
								nation = 'ar';
							end;

							if (player.NATION == 3) then
								nation = 'ru';
							end;

							local icon = getElementEX(
								badge,
								anchorLTRB,
								XYWH(15, 5, 30, 30),
								true,
								{
									texture = 'SGUI/tags/' .. nation .. '-' .. colour .. '.png',
									hint = player.NAME
								}
							);
						else
							local icon = getLabelEX(
								badge,
								anchorLTRB,
								XYWH(15, 5, 30, 30),
								nil,
								'?',
								{
									font_name = Tahoma_60B,
									colour1 = WHITEA(),
									font_colour = MULTIPLAYER_MINIMAP_PREVIEW_COLOURS[colour],
									text_halign = ALIGN_MIDDLE,
									text_valign = ALIGN_MIDDLE,
									shadowtext = true,
									hint = player.NAME
								}
							);
						end;
					end;
				end;
			end;
		end; 
	end;
end

function mapDescription(NAME, TEXT, PICTURE, PLAYERS, POSITIONS, SETTINGS)
	if (NAME ~= nil and strlen(NAME) > 0) then
		setText(dialog.map.name, NAME);
	else
		setText(dialog.map.name, '');
	end;

	if (TEXT ~= nil and strlen(TEXT) > 0) then
		TEXT = SGUI_widesub(splitstringrest(TEXT, ': '), 2);
		TEXT = TEXT:gsub("%$", '\n');
		setText(dialog.map.page1.panel.textbox, TEXT);
	else
		setText(dialog.map.page1.panel.textbox, '');
	end;

	if (PICTURE ~= nil and strlen(PICTURE) > 0) then
		setTexture(dialog.map.page2.panel.mapPic, PICTURE);
		setTextureFallback(dialog.map.page2.panel.mapPic, 'skirmish_unknown.png');
	else
		setTexture(dialog.map.page2.panel.mapPic, 'skirmish_unknown.png');
	end;

	-- POSITIONS 220, 220 -> 500, 330
	sgui_deletechildren(dialog.map.page2.panel.mapPic.ID);

	-- see refreshPlayersPage

	-- SETTINGS
	if (SETTINGS ~= nil) then
		local settingsText = '';

		for i = 1, #SETTINGS do
			local setting = SETTINGS[i];

			if (setting.ITEMS ~= nil and setting.VALUE >= 0) then
				if setting.TYPE == 1 and setting.ITEMS.COUNT > 0 then
					settingsText = settingsText .. setting.NAME .. ': ' .. setting.ITEMS.NAMES[setting.VALUE + 1] .. '\n';
				end;
			end;
		end;

		setText(dialog.map.page3.panel.textbox, settingsText);
	else
		setText(dialog.map.page3.panel.textbox, '');
	end;
end;

--[[
  see: LangX.wri
	9900=Opis
	9901=Warunki wygranej
	9902=Warunki przegranej
	9903=Dodatkowe zasady
	9910=Zniszcz przeciwnika razem z sojusznikami.
	9911=Zniszcz przeciwników razem z sojusznikami.
	9912=Przegrasz jeśli Twój dowódca zginie.
	9913=Przegrasz jeśli wszyscy sojuszniczy dowódcy zginą.
	9914=Zdobądź wymaganą liczbę punktów. 
	9920=Punkty zdobywasz za
	9921=Niszczenie wrogich jednostek.
	9922=Budowanie pojazdów.
	9923=Wypełnianie celów specjalnych np. zabicie ważnej jednostki lub zdobycie artefaktu.
	9924=Doprowadzenie sojuszniczych jednostek do strefy ewakuacji.
	9930=Punkty tracisz za
	9931=Utratę postaci.
	9932=Zabijanie sojuszników.
]]--
function buildMapDescription(PARAMS)
	local result = '';

	if (PARAMS.DESC) then
		result = result .. loc(9900) .. '\n' .. loc(PARAMS.DESC) .. '\n\n';
	end;

	if (PARAMS.WIN) then
		result = result .. loc(9901);

		 for i = 1, #PARAMS.WIN do
		 	result = result .. '\n - ' .. loc(PARAMS.WIN[i]);
		 end;

		result = result .. '\n\n';
	end;

	if (PARAMS.LOSE) then
		result = result .. loc(9902);

		 for i = 1, #PARAMS.LOSE do
		 	result = result .. '\n - ' .. loc(PARAMS.LOSE[i]);
		 end;

		result = result .. '\n\n';
	end;

	if (PARAMS.ADDITIONAL) then
		result = result .. loc(9903);

		 for i = 1, #PARAMS.ADDITIONAL do
		 	result = result .. '\n - ' .. loc(PARAMS.ADDITIONAL[i]);
		 end;

		result = result .. '\n\n';
	end;

	if (PARAMS.POINTSG) then
		result = result .. loc(9920);

		 for i = 1, #PARAMS.POINTSG do
		 	result = result .. '\n - ' .. loc(PARAMS.POINTSG[i]);
		 end;

		result = result .. '\n\n';
	end;

	if (PARAMS.POINTSL) then
		result = result .. loc(9930);

		 for i = 1, #PARAMS.POINTSL do
		 	result = result .. '\n - ' .. loc(PARAMS.POINTSL[i]);
		 end;

		result = result .. '\n\n';
	end;

	if (PARAMS.BONUS) then
		result = result .. PARAMS.BONUS;
	end;

	return result;
end;