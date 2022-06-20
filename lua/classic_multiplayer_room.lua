MULTIPLAYER_ROOM_ACTIVE = false;
MULTIPLAYER_ROOM_DATA = {};
MULTIPLAYER_ROOM_MAP_DATA = {};
MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX = 1;
MULTIPLAYER_ROOM_ACTIVE_GAMETYPE_INDEX = 1;
MULTIPLAYER_ROOM_ACTIVE_PAGE = 1;
MULTIPLAYER_ROOM_IS_HOST = false;
MULTIPLAYER_ROOM_IS_DEDI = false;
MULTIPLAYER_ROOM_MY_PLID = 0;
MULTIPLAYER_ROOM_IM_READY = false;
MULTIPLAYER_ROOM_GAME_LOCKED = false;
MULTIPLAYER_ROOM_RANDOM_POSITIONS = false;
MULTIPLAYER_ROOM_RANDOM_COLOURS = false;
MULTIPLAYER_ROOM_RANDOM_NATIONS = false;
MULTIPLAYER_ROOM_LOCK_TEAMS = false;
MULTIPLAYER_ROOM_MY_AVATAR_ID = 0;
MULTIPLAYER_ROOM_MY_AVATAR_COMPONENTS = nil;
MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS = nil;
MULTIPLAYER_ROOM_MY_AVATAR_SEX = 0;

MULTIPLAYER_OPTION_RANDOM_POSITONS = 58;
MULTIPLAYER_OPTION_RANDOM_COLOURS = 59;
MULTIPLAYER_OPTION_RANDOM_NATIONS = 60;
MULTIPLAYER_OPTION_LOCK_TEAMS = 55;
MULTIPLAYER_OPTION_RANDKED = 51;
MULTIPLAYER_OPTION_LOCK_GAME = 57;
MULTIPLAYER_OPTION_LIMIT_TECH = 56;


menu.window_multiplayer_room = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = BLACKA(150)
    }
);

menu.window_multiplayer_room.panel = getElementEX(
	menu.window_multiplayer_room, 
	anchorLTRB,
	XYWH(
		menu.window_multiplayer_room.width / 2 - 512, 
		menu.window_multiplayer_room.height / 2 - 384, 
		1024,
		768
	),
	true,
	{
		texture = 'classic/edit/multiroom/multiplayer_room.png'
	}
);

-- upper panel
menu.window_multiplayer_room.panel.quit = clButton(
    menu.window_multiplayer_room.panel, 
    19, 
    68, 
    150,
    30, 
    loc(TID_Multi_button_Leave_game), 
    'hideMultiplayerGame();',
    {}
);

menu.window_multiplayer_room.panel.changeAvatar = clButton(
    menu.window_multiplayer_room.panel, 
    19, 
    102, 
    150,
    30, 
    loc(TID_Main_Menu_ChangeAvatar),
    'showMultiplayerAvatarGenerator();', -- for test
    {}
);


menu.window_multiplayer_room.panel.start = clButton(
    menu.window_multiplayer_room.panel, 
    19, 
    136, 
    150,
    30, 
    loc(TID_Multi_button_Start_Game), 
    '',
    {}
);

menu.window_multiplayer_room.panel.mapName = getLabelEX(
    menu.window_multiplayer_room.panel,
    anchorLTRB,
    XYWH(12, 16, 326, 29),
    nil,
    loc(TID_InGame_NoName) .. '-' .. loc(TID_InGame_NoName), -- game name + game type,
    {
    	font_colour = BLACK(),
        nomouseevent = true,
        font_name = ADMUI3L,
        scissor = true,
        wordwrap = false
    }
); 

menu.window_multiplayer_room.panel.mapCount = getLabelEX(
    menu.window_multiplayer_room.panel,
    anchorR,
    XYWH(342, 16, 50, 29),
    nil,
    '12/12',
    {
    	font_colour = BLACK(),
        nomouseevent = true,
        font_name = ADMUI3L,
        scissor = true,
        wordwrap = false,
        text_halign = ALIGN_RIGHT
    }
); 

menu.window_multiplayer_room.panel.playerName = getLabelEX(
    menu.window_multiplayer_room.panel,
    anchorLTRB,
    XYWH(18, 48, 150, 14),
    nil,
    '', -- see showMultiplayerGame()
    {
    	font_colour = BLACK(),
        nomouseevent = true,
        font_name = ADMUI3L,
        scissor = true
    }
); 

menu.window_multiplayer_room.panel.status = getLabelEX(
    menu.window_multiplayer_room.panel,
    anchorLTRB,
    XYWH(14, 174, 370, 60),
    nil,
    '',
    {
    	font_colour = BLACK(),
        nomouseevent = true,
        font_name = ADMUI3L,
        scissor = true,
        wordwrap = true,
        text_halign = ALIGN_TOP,	
        text_valign = ALIGN_LEFT,
    }
);

menu.window_multiplayer_room.panel.globalSettings = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		180, 
		47, 
		212,
		130
	),
	true,
	{
		colour1 = WHITEA()
	}
);

-- chat
menu.window_multiplayer_room.panel.chat = clTextBoxWithTexture(
    menu.window_multiplayer_room.panel,
    anchorLTRB,
    XYWH(412, 24, 596, 178), 
    '',
    {
        font_colour = BLACK(),
        nomouseevent = true,
        font_name = ADMUI3L,
        padding = {
        	x = 4,
        	y = 0
        }
        -- added='setTextID(%id, %data);',
    }
);

menu.window_multiplayer_room.panel.chatInput = getEditEX(
    menu.window_multiplayer_room.panel,
    anchorNone,
    XYWH(420, 208, 578, 14),
    ADMUI3L,
    '',
    '',
    {},
    {
        font_colour = BLACK(),
        font_name = Arial_14,
        callback_keypress = 'sendChatMessage(%k);'
    }
);

textBoxTest = clTextBox(nil, anchorLTRB, XYWH(1, 1, 1, 1), 'test', {visible = false});

-- lower panel
menu.window_multiplayer_room.panel.page1Button = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		7, 
		243,
		60,
		26
	),
	true,
	{
		texture = 'classic/edit/multiroom/zalozka-players-on.png',
		callback_mousedown = 'multiRoomChangePage(1);'
	}
);

menu.window_multiplayer_room.panel.page2Button = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		67, 
		243,
		60,
		26
	),
	true,
	{
		texture = 'classic/edit/multiroom/zalozka-options-off.png',
		callback_mousedown = 'multiRoomChangePage(2);'
	}
);

menu.window_multiplayer_room.panel.page3Button = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		127, 
		243,
		60,
		26
	),
	true,
	{
		texture = 'classic/edit/multiroom/zalozka-map-off.png',
		callback_mousedown = 'multiRoomChangePage(3);'
	}
);

menu.window_multiplayer_room.panel.page4Button = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		187, 
		243,
		60,
		26
	),
	true,
	{
		texture = 'classic/edit/multiroom/zalozka-tech-off.png',
		callback_mousedown = 'multiRoomChangePage(4);',
		disabled = MULTIPLAYER_OPTION_LIMIT_TECH
	}
);

-- players page
menu.window_multiplayer_room.panel.page1 = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		7, 
		266,
		1011,
		490
	),
	true,
	{
		texture = 'classic/edit/multiroom/page.png'
	}
);

menu.window_multiplayer_room.panel.page1.scroll = getScrollboxEX(
    menu.window_multiplayer_room.panel.page1, 
    anchorNone, 
    XYWH(
		8, 
		8,
		768,
		320
	),
    {
        colour1 = WHITEA()
    }
);

set_Property(menu.window_multiplayer_room.panel.page1.scroll.ID, PROP_AUTOHIDESCROLL, false);

menu.window_multiplayer_room.panel.page1.scrollBar = clScrollBarEX2(
    menu.window_multiplayer_room.panel.page1,
    anchorNone,
    XYWH(
        762, 
        menu.window_multiplayer_room.panel.page1.scroll.y + 6, 
        12,
        menu.window_multiplayer_room.panel.page1.scroll.height - 6 
    ), 
    menu.window_multiplayer_room.panel.page1.scroll, 
    SKINTYPE_NONE,
    false,
    {
        visible = true
    }
);

menu.window_multiplayer_room.panel.page1.playerSlots = getElementEX(
	menu.window_multiplayer_room.panel.page1.scroll, 
	anchorLTRB,
	XYWH(
		0, 
		0,
		750,
		300
	),
	true,
	{
		colour1 = WHITEA()
	}
);

menu.window_multiplayer_room.panel.page1.spectatorSlots = getElementEX(
	menu.window_multiplayer_room.panel.page1, 
	anchorLTRB,
	XYWH(
		8, 
		340,
		762,
		146
	),
	true,
	{
		colour1 = WHITEA()
	}
);


-- check init player slots
menu.window_multiplayer_room.panel.page1.playerListDescription = getLabelEX(
	menu.window_multiplayer_room.panel.page1,
    anchorT, 
    XYWH(782, 9, 240, 12),
    nil, 
    loc(846), -- player list
    {
		nomouseevent = true,
        font_colour = WHITE(),
        font_name = BankGotic_14,
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        scissor = true
 	}
);

menu.window_multiplayer_room.panel.page1.playerListKick = clButton(
    menu.window_multiplayer_room.panel.page1,
    808, 
    338, 
    156,
    30, 
    loc(498), -- kick player
    'kickPlayer();',
    {}
);

menu.window_multiplayer_room.panel.page1.playerList = clListBox(
	menu.window_multiplayer_room.panel.page1, 
	XYWH(782, 24, 224, 312), 
	{}, 
	1, 
	'', 
	{}
);

-- game settings page
menu.window_multiplayer_room.panel.page2 = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		7, 
		266,
		1011,
		490
	),
	false,
	{
		texture = 'classic/edit/multiroom/page.png'
	}
);

-- map page
menu.window_multiplayer_room.panel.page3 = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		7, 
		266,
		1011,
		490
	),
	false,
	{
		texture = 'classic/edit/multiroom/page.png'
	}
);

-- other servers page
menu.window_multiplayer_room.panel.page4 = getElementEX(
	menu.window_multiplayer_room.panel, 
	anchorLTRB,
	XYWH(
		7, 
		266,
		1011,
		490
	),
	false,
	{
		texture = 'classic/edit/multiroom/page.png'
	}
);

-- xichted avatar generator
menu.window_multiplayer_room.avatarPanel = getElementEX(
    menu.window_multiplayer_room,
    anchorLTRB,
    XYWH(0, 0, LayoutWidth, LayoutHeight),
    false,
    {
        colour1 = BLACKA(50)
    }
);

menu.window_multiplayer_room.avatarPanel.popup = getElementEX(
	menu.window_multiplayer_room.avatarPanel,
    anchorNone,
    XYWH(menu.window_multiplayer_room.avatarPanel.width / 2 - 310, menu.window_multiplayer_room.avatarPanel.height / 2 - 123, 621, 400),
    true,
    {
        texture = 'classic/edit/avw_1.png'
    }
);

menu.window_multiplayer_room.avatarPanel.popup.preview = getElementEX(
	menu.window_multiplayer_room.avatarPanel.popup, 
	anchorLTRB,
	XYWH(
		16,
		17, 
		80,
		100
	),
	true,
	{
		texture = 'Avatars/unknow.png'
	}
);

menu.window_multiplayer_room.avatarPanel.popup.settings = getElementEX(
	menu.window_multiplayer_room.avatarPanel.popup, 
	anchorLTRB,
	XYWH(
		110,
		10, 
		500,
		340
	),
	true,
	{
		colour1 = WHITEA()
	}
);

menu.window_multiplayer_room.avatarPanel.popup.saveBtn = clButton(
    menu.window_multiplayer_room.avatarPanel.popup, 
    235,
    328,
    150,
    18, 
    loc(1173), -- ok
    'savePreviewAvatar();',
    {
    	texture = 'classic/edit/menu_button_small_l.png',
    	texture2 = 'classic/edit/menu_button_small_c.png',
    	texture3 = 'classic/edit/menu_button_small_r.png'
    }
);

menu.window_multiplayer_room.avatarPanel.popup.randomBtn = clButton(
    menu.window_multiplayer_room.avatarPanel.popup, 
    235, 
    352, 
    150,
    18, 
    loc(1100), -- random face
    'randomPreviewAvatar();',
    {
    	texture = 'classic/edit/menu_button_small_l.png',
    	texture2 = 'classic/edit/menu_button_small_c.png',
    	texture3 = 'classic/edit/menu_button_small_r.png'
    }
);

menu.window_multiplayer_room.avatarPanel.popup.closeBtn = clButton(
    menu.window_multiplayer_room.avatarPanel.popup, 
    235, 
    376, 
    150,
    18, 
    loc(828), -- close
    'hideMultiplayerAvatarGenerator();',
    {
    	texture = 'classic/edit/menu_button_small_l.png',
    	texture2 = 'classic/edit/menu_button_small_c.png',
    	texture3 = 'classic/edit/menu_button_small_r.png'
    }
);

function showMultiplayerAvatarGenerator()
	setVisible(menu.window_multiplayer_room.avatarPanel, true);

	if (MULTIPLAYER_ROOM_MY_AVATAR_ID) then
		SGUI_settextureid(menu.window_multiplayer_room.avatarPanel.popup.preview.ID, MULTIPLAYER_ROOM_MY_AVATAR_ID, 80, 100, 80, 100);
		MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS = copytable(MULTIPLAYER_ROOM_MY_AVATAR_COMPONENTS);
		refreshPlayerAvatarSettings();
	end;
end;

function hideMultiplayerAvatarGenerator()
	setVisible(menu.window_multiplayer_room.avatarPanel, false);
end;

function refreshPlayerAvatarSettings()
	sgui_deletechildren(menu.window_multiplayer_room.avatarPanel.popup.settings.ID);

	local components = {
		'SEX',
		'CHEEK',
		'NECK',
		'FACE',
		'BEARD',
		'NOSE',
		'EAR',
		'EYE',
		'EYEBROW',
		'GLASSES',
		'HAIR',
		'MOUTH'
	};

	local componentsID = {
		1,
		4,
		2,
		3,
		11,
		6,
		8,
		5,
		9,
		13,
		10,
		7
	};
	
	local componentsNames = {
		loc(1101), -- SEX
		loc(1104), -- CHEEK
		loc(1102), -- NECK
		loc(1112), -- FACE
		loc(1110), -- BREAD
		loc(1105), -- NOSE
		loc(1107), -- EAR
		loc(1103), -- EYES
		loc(1108), -- EYEBROW
		loc(1111), -- GlASSES
		loc(1109), -- HAIR
		loc(1106), -- MOUTH
	};

	local parts = AVATARS_COMPONENTS.MALE;

	if MULTIPLAYER_ROOM_MY_AVATAR_SEX > 0 then
		parts = AVATARS_COMPONENTS.FEMALE;
	end;

	getLabelEX(
	    menu.window_multiplayer_room.avatarPanel.popup.settings,
	    anchorT, 
	    XYWH(
	    	10,
	    	6,
	    	240,
	    	14
	    ), 
	    nil,
	    SGUI_widesub(componentsNames[1], 1, 27),
	    {
	        font_colour = BLACK(),
	        nomouseevent = true,
	        font_name = BankGotic_14
	    }
	);

	clComboBox(
	    menu.window_multiplayer_room.avatarPanel.popup.settings,
	    10,
	    24,
	    {
			loc(1168), -- Male
			loc(1169)  -- Female 
		},
	    MULTIPLAYER_ROOM_MY_AVATAR_SEX + 1,
	    'updatePreviewAvatarSex("INDEX")',
	    {}
	);

	for i = 2, #components do
		getLabelEX(
		    menu.window_multiplayer_room.avatarPanel.popup.settings,
		    anchorT, 
		    XYWH(
		    	10 + (((i - 1) % 2) * 240),
		    	6 + (math.floor((i - 1) / 2) * 40),
		    	240,
		    	14
		    ), 
		    nil,
		    SGUI_widesub(componentsNames[i], 1, 27),
		    {
		        font_colour = BLACK(),
	            nomouseevent = true,
	            font_name = BankGotic_14
		    }
		);

		clComboBox(
		    menu.window_multiplayer_room.avatarPanel.popup.settings,
		    10 + (((i - 1) % 2) * 240),
		    24 + (math.floor((i - 1) / 2) * 40),
		    parts[components[i]].PARTS,
		    MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS[componentsID[i]],
		    'updatePreviewAvatar(' .. componentsID[i] .. ', "INDEX")',
		    {}
		);
	end;
end;

function updatePreviewAvatar(ID, INDEX)
	MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS[ID] = INDEX;
	SGUI_settextureid(menu.window_multiplayer_room.avatarPanel.popup.preview.ID, previewAvatar(MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS), 80, 100, 80, 100);
end;

function updatePreviewAvatarSex(INDEX)
	MULTIPLAYER_ROOM_MY_AVATAR_SEX = INDEX - 1;

	local parts = AVATARS_COMPONENTS.MALE;

	if MULTIPLAYER_ROOM_MY_AVATAR_SEX > 0 then
		parts = AVATARS_COMPONENTS.FEMALE;
	end;

	MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS[1] = MULTIPLAYER_ROOM_MY_AVATAR_SEX;

	for i = 2, #MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS do
		MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS[i] = 1;
	end;

	SGUI_settextureid(menu.window_multiplayer_room.avatarPanel.popup.preview.ID, previewAvatar(MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS), 80, 100, 80, 100);
	refreshPlayerAvatarSettings();
end;

function randomPreviewAvatar()
	local sex = math.random(0, 1);
	local parts = AVATARS_COMPONENTS.MALE;

	if sex > 0 then
		parts = AVATARS_COMPONENTS.FEMALE;
	end;

	local components = {
		'SEX',
		'CHEEK',
		'NECK',
		'FACE',
		'BEARD',
		'NOSE',
		'EAR',
		'EYE',
		'EYEBROW',
		'GLASSES',
		'HAIR',
		'MOUTH'
	};

	local componentsID = {
		1,
		4,
		2,
		3,
		11,
		6,
		8,
		5,
		9,
		13,
		10,
		7
	};

	MULTIPLAYER_ROOM_MY_AVATAR_SEX = sex;
	MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS[1] = sex;

	for i = 2, #componentsID do
		MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS[componentsID[i]] = math.random(1, #parts[components[i]].PARTS);
	end;

	SGUI_settextureid(menu.window_multiplayer_room.avatarPanel.popup.preview.ID, previewAvatar(MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS), 80, 100, 80, 100);
    refreshPlayerAvatarSettings();
end;

function savePreviewAvatar()
	setAvatar(MULTIPLAYER_ROOM_MY_AVATAR_SEX, MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS);
	setVisible(menu.window_multiplayer_room.avatarPanel, false);
end;

-- events
OW_ROOM_SETUP(menu.window_multiplayer_room.panel.chat.TEXTBOX.ID, textBoxTest.ID, menu.window_multiplayer_room.panel.status.ID);

function FROMOW_MULTIROOM_GET_MAP_INFO_CALLBACK(DATA)
--[[
DATA Breakdown
    MULTIMAP Breakdown
        GAMETYPE      Integer
        DESCRIPTION      WideString
        RULES      WideString
        RANDOMNATIONS      Boolean
        ADDCOMPBUTTON     Boolean
        CANSPEC       Boolean
        MAPPARAMCOUNT     Integer
        RESTRICTTECH       Boolean
        RESTRICTBUILDINGS       Boolean

        MAPPARAMS [1..MAPPARAMCOUNT] of
            COUNT     Integer
            VALUE      default
            ITEMS of
                NAMES [1..COUNT] of WideString
                HINTS [1..COUNT] of WideString
            HINTS [1..2] of WideString

    TEAMDEF[1..9] of            1 isn't team
        NAME    String                without name isn't avalible         1 hasn't name
        SIDESMIN    Integer
        SIDESMAX    Integer
        ASSIGNED_POSITIONS[1..8] of Boolean
        ASSIGNED_POSITIONS_COUNT    Integer

    SIDEDEF[1..8] of
        NAME    String
        ENABLED    Boolean
        NATIONS of
            AR    Boolean
            US    Boolean
            RU    Boolean 
--]]

	MULTIPLAYER_ROOM_DATA.MULTIMAP = DATA.MULTIMAP;
	MULTIPLAYER_ROOM_DATA.SIDEDEF = DATA.SIDEDEF;
	MULTIPLAYER_ROOM_DATA.TEAMDEF = DATA.TEAMDEF;
	MULTIPLAYER_ROOM_DATA.TeamGame = getTeamGame(DATA.TEAMDEF);
	MULTIPLAYER_ROOM_DATA.MaxPlayers = getPlayersCount(DATA.TEAMDEF, DATA.SIDEDEF, MULTIPLAYER_ROOM_DATA.TeamGame);

	generateMapSettings(DATA.MULTIMAP, canModifyServerSettings());
	setGameTypeList(MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX, MULTIPLAYER_ROOM_ACTIVE_GAMETYPE_INDEX, canModifyServerSettings());
	setMapPictureDescription(MULTIPLAYER_ROOM_DATA.MAPS[MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX].NAME);
end;

function FROMOW_MULTIROOM_TEAMLIST(DATA)
--[[
	 PLAYERCOUNT Integer
	 PLAYERSMYPOS Integer
	 PLAYERS [1..12] of
		  NAME String
		  ALIVE Boolean
		  ISCOMP Boolean
		  NATION Integer
		  TEAM Integer
		  TEAMPOS Integer
		  SIDE Integer
		  COLOUR Integer
		  READY Boolean
		  LOCKED Boolean
		  TEAMREADY Boolean
		  PLID Integer (PLAYER ID)
		  ISSPEC Boolean
		  ISDEDI Boolean
		  AVATAR Array [1..14] of Byte
		  AVATARSEX Byte
		  PING Integer
--]]

	MULTIPLAYER_ROOM_DATA.PlayerCount = DATA.PLAYERCOUNT;
	MULTIPLAYER_ROOM_DATA.PlayerMyPos = DATA.PLAYERSMYPOS;
	MULTIPLAYER_ROOM_DATA.Players = DATA.PLAYERS;

	updateHostVisibilitySettings(canModifyServerSettings());
	updatePlayersCount(MULTIPLAYER_ROOM_DATA.PlayerCount, MULTIPLAYER_ROOM_DATA.MaxPlayers);
	updatePlayersOnServer(MULTIPLAYER_ROOM_DATA.Players);

	setMapList(MULTIPLAYER_ROOM_DATA.MAPS, MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX, canModifyServerSettings());

	updateMultiplayerView();
end;

-- trigger each when map is changed
function FROMOW_MULTIROOM_UPDATE_MAP_NAME(DATA)
	MULTIPLAYER_ROOM_MAP_DATA = DATA;

	setText(menu.window_multiplayer_room.panel.mapName, trim(MULTIPLAYER_ROOM_MAP_DATA.MAPLOC) .. ' - ' .. trim(MULTIPLAYER_ROOM_MAP_DATA.GAMETYPELOC));

	-- get map info data
  	OW_MULTIROOM_GET_CURRENT_MAP_INFO();
end;

function FROMOW_MULTIROOM_UPDATE_MAP_SETTINGS(DATA)
	if MULTIPLAYER_ROOM_DATA.MULTIMAP ~= nil then
		for i = 1, DATA.MAPPARAMCOUNT do
			if MULTIPLAYER_ROOM_DATA.MULTIMAP.MAPPARAMS[i] ~= nil then
				MULTIPLAYER_ROOM_DATA.MULTIMAP.MAPPARAMS[i].VALUE = DATA.MAPPARAMS[i];
			end;
		end;

	generateMapSettings(MULTIPLAYER_ROOM_DATA.MULTIMAP, canModifyServerSettings());
	end;
end;

function FROMOW_MULTIROOM_UPDATE_MAP_GAMETYPE_LIST(DATA)
	MULTIPLAYER_ROOM_ACTIVE_GAMETYPE_INDEX = 1;
end;

function FROMOW_MULTIROOM_GET_MAP_GAMETYPES_CALLBACK(DATA)
	-- clDebug('FROMOW_MULTIROOM_GET_MAP_GAMETYPES_CALLBACK');
end;

function FROMOW_MULTIROOM_UPDATE_MAP_LIST(UNRANKED, RANKED)
	--MULTIPLAYER_ROOM_DATA.UNRANKED_MAPS  = UNRANKED.MAPLIST;
	--MULTIPLAYER_ROOM_DATA.UNRANKED_COUNT = UNRANKED.MAPLISTCOUNT;
	--MULTIPLAYER_ROOM_DATA.RANKED_MAPS    = RANKED.MAPLIST;
	--MULTIPLAYER_ROOM_DATA.RANKED_COUNT   = RANKED.MAPLISTCOUNT;

	MultiDef.MapList      = UNRANKED.MAPLIST;
  	MultiDef.MapListCount = UNRANKED.MAPLISTCOUNT;

	if (MULTIPLAYER_ALLOWED_MAPS == nil) then
		MULTIPLAYER_ROOM_DATA.MAPS = UNRANKED.MAPLIST;
	else
		MULTIPLAYER_ROOM_DATA.MAPS = {};

		for i = 1, UNRANKED.MAPLISTCOUNT do
			if inArray(MULTIPLAYER_ALLOWED_MAPS, string.lower(UNRANKED.MAPLIST[i].NAME)) then
				MULTIPLAYER_ROOM_DATA.MAPS = addToArray(MULTIPLAYER_ROOM_DATA.MAPS, UNRANKED.MAPLIST[i]);
			end;
		end;
	end;
end;

function FROMOW_MULTIROOM_TIMEOUT() -- Called by OW
    hideMultiplayerGame();
end;

function FROMOW_MULTI_PINGED(DATA)

end;

function FROMOW_MULTIROOM_CONSTATUS_UPDATE(DATA)
	-- clDebug('FROMOW_MULTIROOM_CONSTATUS_UPDATE');
end;

function FROMOW_MULTIROOM_CONNSTATUS_NOTJOINED() -- Called by OW
	hideMultiplayerGame();
end;

function FROMOW_MULTIPLAYER_STARTGAME() -- Called by OW
	useModernGUILogic(); -- use global variables from Sali's GUI...
	
    IN_LOBBY = false;
	OW_IRC_DESTROY();
	  	
	MULTIPLAYER_ROOM_ACTIVE = false;
  	MULTIPLAYER_ROOM_IS_HOST = false;
  	MULTIPLAYER_ROOM_IS_DEDI = false;
  	MULTIPLAYER_ROOM_DATA = {};
  	MULTIPLAYER_ROOM_MAP_DATA = {};

  	setVisible(menu.window_multiplayer_room, false);

  	deleteSlots();
  	clearAvatarCache();
end;

MULTIPLAYER_ROOM_TIMER_ID = timer:repeatable(0.1, 'refreshPlayerView();', -1);
timer:stop(MULTIPLAYER_ROOM_TIMER_ID);

function updateMultiplayerView()
	local _t = timer:get(MULTIPLAYER_ROOM_TIMER_ID);

    if (_t.delay == 0) then
        _t.delay = 0.1;
        _t.time  = 0;
    end;
end;

-- main functions
function startMultiplayerGame()
    if OW_ROOM_LAUNCH_GAME() then
        IN_LOBBY = false;
		OW_IRC_DESTROY();

	  	setVisible(menu.window_multiplayer_room, false);

	  	deleteSlots();
	  	clearAvatarCache();
    end;
end;

function setReadyMultiplayerGame()
	setEnabled(menu.window_multiplayer_room.panel.changeAvatar, MULTIPLAYER_ROOM_IM_READY);

	local ready = (not MULTIPLAYER_ROOM_IM_READY);	
	OW_MULTIROOM_SET_MYREADY(ready);
end;

function showMultiplayerGame()
  	IN_LOBBY = false;	
  	MULTIPLAYER_ROOM_ACTIVE = true;
  	MULTIPLAYER_ROOM_IS_HOST = getvalue(OWV_IAMSERVER);
	MULTIPLAYER_ROOM_IS_DEDI = getvalue(OWV_IAMDEDIHOST);

  	setVisible(menu.window_multiplayer, false);
  	setVisible(menu.window_multiplayer_room, true);

  	-- set player nickname
  	setText(menu.window_multiplayer_room.panel.playerName, getPlayerName());

  	-- set button
  	if canModifyServerSettings() then
  		setText(menu.window_multiplayer_room.panel.start, loc(804));
  		set_Callback(menu.window_multiplayer_room.panel.start.ID, CALLBACK_MOUSEDOWN, 'startMultiplayerGame();');
  	else
  		setText(menu.window_multiplayer_room.panel.start, loc(818));
  		set_Callback(menu.window_multiplayer_room.panel.start.ID, CALLBACK_MOUSEDOWN, 'setReadyMultiplayerGame();');
  	end;
end;

function hideMultiplayerGame()
	if (not IN_LOBBY) then
		OW_ROOM_LEAVE();
	end;

	IN_LOBBY = true;	
	MULTIPLAYER_ROOM_ACTIVE = false;

  	setVisible(menu.window_multiplayer_room, false);
  	setVisible(menu.window_multiplayer, true);

  	MULTIPLAYER_ROOM_IS_HOST = false;
  	MULTIPLAYER_ROOM_IS_DEDI = false;
  	MULTIPLAYER_ROOM_DATA = {};
  	MULTIPLAYER_ROOM_MAP_DATA = {};

  	deleteSlots();
  	clearAvatarCache();
end;

function setMultiplayerGameLocked()
	local value = (not MULTIPLAYER_ROOM_GAME_LOCKED);
	local messageCode = 5042;

	if (value) then
		messageCode = 5041;
	end;

	OW_MULTI_SENDALLCHATMSG(loc(messageCode), '#000000');

	OW_MULTIROOM_HOST_SET_SERVERLOCKED(value);
	OW_MULTIROOM_HOST_SET_MAPPARAM(MULTIPLAYER_OPTION_LOCK_GAME - 2, parseInt(value));
	MULTIPLAYER_ROOM_GAME_LOCKED = value;
end;

function setMultiplayerRandomPositions()
	local value = (not MULTIPLAYER_ROOM_RANDOM_POSITIONS);
	OW_MULTIROOM_HOST_SET_MAPPARAM(MULTIPLAYER_OPTION_RANDOM_POSITONS - 2, parseInt(value));
	MULTIPLAYER_ROOM_RANDOM_POSITIONS = value;
end;

function setMultiplayerRandomColours()
	local value = (not MULTIPLAYER_ROOM_RANDOM_COLOURS);
	OW_MULTIROOM_HOST_SET_MAPPARAM(MULTIPLAYER_OPTION_RANDOM_COLOURS - 2, parseInt(value));
	MULTIPLAYER_ROOM_RANDOM_COLOURS = value;
end;

function setMultiplayerRandomNations()
	local value = (not MULTIPLAYER_ROOM_RANDOM_NATIONS);
	OW_MULTIROOM_HOST_SET_MAPPARAM(MULTIPLAYER_OPTION_RANDOM_NATIONS - 2, parseInt(value));
	MULTIPLAYER_ROOM_RANDOM_NATIONS = value;
end;

function setMultiplayerLockTeams()
	local value = (not MULTIPLAYER_ROOM_LOCK_TEAMS);
	OW_MULTIROOM_HOST_SET_MAPPARAM(MULTIPLAYER_OPTION_LOCK_TEAMS - 2, parseInt(value));
	MULTIPLAYER_ROOM_LOCK_TEAMS = value;
end;

function generateGlobalSettings()
	-- global multiroom settings
  	-- delete global settings panel to prevent duplicates
  	sgui_deletechildren(menu.window_multiplayer_room.panel.globalSettings.ID);

  	if (canModifyServerSettings()) then
		menu.window_multiplayer_room.panel.gameLock = clCheckbox(
		    menu.window_multiplayer_room.panel.globalSettings,
		    1,
		    0,
		    'setMultiplayerGameLocked();',
		    {
		        checked = MULTIPLAYER_ROOM_GAME_LOCKED
		    }
		);

		menu.window_multiplayer_room.panel.gameLockLabel = getLabelEX(
		    menu.window_multiplayer_room.panel.globalSettings,
		    anchorLT,
		    XYWH(21, 0, 199, 16),
		    BankGotic_14, 
		    loc(817),
		    {
		        font_colour = RGB(0, 0, 0),
		        shadowtext = false,
		        nomouseevent = true,
		        text_halign = ALIGN_LEFT,
		        text_valign = ALIGN_TOP,
		        wordwrap = false,
		        scissor = true
		    }
		);
  	else
		menu.window_multiplayer_room.panel.ready = clCheckbox(
		    menu.window_multiplayer_room.panel.globalSettings,
		    1,
		    0,
		    'setReadyMultiplayerGame();',
		    {
		        checked = MULTIPLAYER_ROOM_IM_READY
		    }
		);

		menu.window_multiplayer_room.panel.readyLabel = getLabelEX(
		    menu.window_multiplayer_room.panel.globalSettings,
		    anchorLT,
		    XYWH(21, 0, 199, 16),
		    BankGotic_14, 
		    loc(818),
		    {
		        font_colour = RGB(0, 0, 0),
		        shadowtext = false,
		        nomouseevent = true,
		        text_halign = ALIGN_LEFT,
		        text_valign = ALIGN_TOP,
		        wordwrap = false,
		        scissor = true
		    }
		);
	end;

	--[[
		MULTIPLAYER_OPTION_RANDOM_POSITONS = 58;
		MULTIPLAYER_OPTION_RANDOM_COLOURS = 59;
		MULTIPLAYER_OPTION_RANDOM_NATIONS = 60;
		MULTIPLAYER_OPTION_LOCK_TEAMS = 55;
		MULTIPLAYER_OPTION_RANDKED = 51;
		MULTIPLAYER_OPTION_LOCK_GAME = 57;
		MULTIPLAYER_OPTION_LIMIT_TECH = 56;
	]]--

	menu.window_multiplayer_room.panel.randomPos = clCheckbox(
	    menu.window_multiplayer_room.panel.globalSettings,
	    1,
	    30,
	    'setMultiplayerRandomPositions();',
	    {
	        checked = MULTIPLAYER_ROOM_RANDOM_POSITIONS,
	        disabled = not canModifyServerSettings(),
	        hint = loc(832)
	    }
	);

	menu.window_multiplayer_room.panel.randomPosLabel = getLabelEX(
	    menu.window_multiplayer_room.panel.globalSettings,
	    anchorLT,
	    XYWH(21, 30, 199, 16),
	    BankGotic_14, 
	    SGUI_widesub(loc(831), 1, 21), -- random pos
	    {
	        font_colour = RGB(0, 0, 0),
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
	        scissor = true
	    }
	);

	menu.window_multiplayer_room.panel.randomCol = clCheckbox(
	    menu.window_multiplayer_room.panel.globalSettings,
	    1,
	    48,
	    'setMultiplayerRandomColours();',
	    {
	        checked = MULTIPLAYER_ROOM_RANDOM_COLOURS,
	        disabled = not canModifyServerSettings(),
	        hint = loc(836)
	    }
	);

	menu.window_multiplayer_room.panel.randomColLabel = getLabelEX(
	    menu.window_multiplayer_room.panel.globalSettings,
	    anchorLT,
	    XYWH(21, 48, 199, 16),
	    BankGotic_14, 
	    SGUI_widesub(loc(835), 1, 21), -- random colour
	    {
	        font_colour = RGB(0, 0, 0),
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
	        scissor = true
	    }
	);	

	menu.window_multiplayer_room.panel.randomNat = clCheckbox(
	    menu.window_multiplayer_room.panel.globalSettings,
	    1,
	    66,
	    'setMultiplayerRandomNations();',
	    {
	        checked = MULTIPLAYER_ROOM_RANDOM_NATIONS,
	        disabled = not canModifyServerSettings(),
	        hint = loc(5040)
	    }
	);

	menu.window_multiplayer_room.panel.randomNatLabel = getLabelEX(
	    menu.window_multiplayer_room.panel.globalSettings,
	    anchorLT,
	    XYWH(21, 66, 199, 16),
	    BankGotic_14, 
	    SGUI_widesub(loc(5039), 1, 21), -- random nation
	    {
	        font_colour = RGB(0, 0, 0),
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
	        scissor = true
	    }
	);

	menu.window_multiplayer_room.panel.lockTeam = clCheckbox(
	    menu.window_multiplayer_room.panel.globalSettings,
	    1,
	    84,
	    'setMultiplayerLockTeams();',
	    {
	        checked = MULTIPLAYER_ROOM_LOCK_TEAMS,
	        disabled = not canModifyServerSettings(),
	        hint = loc(1231)
	    }
	);

	menu.window_multiplayer_room.panel.lockTeamLabel = getLabelEX(
	    menu.window_multiplayer_room.panel.globalSettings,
	    anchorLT,
	    XYWH(21, 84, 199, 16),
	    BankGotic_14, 
	    SGUI_widesub(loc(1230), 1, 21), -- lock team diplomacy
	    {
	        font_colour = RGB(0, 0, 0),
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
	        scissor = true
	    }
	);	

	menu.window_multiplayer_room.panel.limitedTech = clCheckbox(
	    menu.window_multiplayer_room.panel.globalSettings,
	    1,
	    102,
	    '',
	    {
	        checked = false,
	        disabled = true,
	        hint = loc(1217)
	    }
	);

	menu.window_multiplayer_room.panel.limitedTechLabel = getLabelEX(
	    menu.window_multiplayer_room.panel.globalSettings,
	    anchorLT,
	    XYWH(21, 102, 199, 16),
	    BankGotic_14, 
	    SGUI_widesub(loc(1216), 1, 21), -- limited tech (todo)
	    {
	        font_colour = RGB(0, 0, 0),
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
	        scissor = true
	    }
	);
end;

function sendChatMessage(key)
	if key == VK_ENTER then
		OW_MULTI_SENDALLCHATMSG(getText(menu.window_multiplayer_room.panel.chatInput), '#000000'); -- getHexColour(SIDE_COLOURS[Players[MyID].Colour+1]));
		setText(menu.window_multiplayer_room.panel.chatInput, '');
		return;
	end;

	if key == VK_ESC then
		setText(menu.window_multiplayer_room.panel.chatInput, '');
		return;
	end;
end;

function multiRoomChangePage(page)
	local textures = {
		'zalozka-players-',
		'zalozka-options-',
		'zalozka-map-',
		'zalozka-tech-'
	};

	local pages = {
		{
			button = menu.window_multiplayer_room.panel.page1Button.ID,
			page = menu.window_multiplayer_room.panel.page1.ID
		},
		{
			button = menu.window_multiplayer_room.panel.page2Button.ID,
			page = menu.window_multiplayer_room.panel.page2.ID
		},
		{
			button = menu.window_multiplayer_room.panel.page3Button.ID,
			page = menu.window_multiplayer_room.panel.page3.ID
		},
		{
			button = menu.window_multiplayer_room.panel.page4Button.ID,
			page = menu.window_multiplayer_room.panel.page4.ID
		},
	};

	local basePath = 'classic/edit/multiroom/';

	setTextureID(pages[MULTIPLAYER_ROOM_ACTIVE_PAGE].button, basePath .. textures[MULTIPLAYER_ROOM_ACTIVE_PAGE] .. 'off');
	setTextureID(pages[page].button, basePath .. textures[page] .. 'on');
	setVisible({ID=pages[MULTIPLAYER_ROOM_ACTIVE_PAGE].page}, false);
	setVisible({ID=pages[page].page}, true);

	MULTIPLAYER_ROOM_ACTIVE_PAGE = page;
end;

function selectPlayerOnPlayerList(INDEX)
	clSetListSelectedItem(menu.window_multiplayer_room.panel.page1.playerList.ID, INDEX);
end;

function kickPlayer()
	if (not canModifyServerSettings()) then
		return;
	end;

	local index = clGetListSelectedIndex(menu.window_multiplayer_room.panel.page1.playerList.ID);
	local player = MULTIPLAYER_ROOM_DATA.Players[index].PLID;

	if (index == 1 or player == nil or player == 0) then
		return;
	end;

	OW_MULTIROOM_HOST_KICKPLAYER(player);
end;

function updateHostVisibilitySettings(isHost)
	-- hide/show kick player button if player is host
	setVisible(menu.window_multiplayer_room.panel.page1.playerListKick, isHost);
end;

--[[	 
	PLAYERS [1..12] of
		  NAME String
		  ALIVE Boolean
		  ISCOMP Boolean
		  NATION Integer
		  TEAM Integer
		  TEAMPOS Integer
		  SIDE Integer
		  COLOUR Integer
		  READY Boolean
		  LOCKED Boolean
		  TEAMREADY Boolean
		  PLID Integer (PLAYER ID)
		  ISSPEC Boolean
		  ISDEDI Boolean
		  AVATAR Array [1..14] of Byte
		  AVATARSEX Byte
		  PING Integer
--]]
function updatePlayersOnServer(players)
	local playersList = {};

	for i = 1, table.getn(players) do
		playersList = addToArray(playersList, players[i].NAME .. ' (' .. players[i].PLID .. ')');
	end;

	clSetListItems(menu.window_multiplayer_room.panel.page1.playerList, playersList, 0, 'selectPlayerOnPlayerList(INDEX);', {});
end;

function updatePlayersCount(currentCount, maxCount)
	local text = currentCount .. '/0';

	if (maxCount) then
		text = currentCount .. '/' .. maxCount;		
	end;

	setText(menu.window_multiplayer_room.panel.mapCount, text);
end;

function getPlayersCount(teamDef, sideDef, teamGame)
	local maxPlayers = 0;
	local allPositionsCount = 0;

	for i = 1, 8 do
		if sideDef[i].ENABLED then
			allPositionsCount = allPositionsCount + 1;
		end;
	end;

	if (not teamGame) then
		maxPlayers = teamDef[1].SIDESMAX;
	else
		for i = 2, 9 do
			if teamDef[i].NAME ~= '' then
				if teamDef[i].SIDESMAX == -1 then
					maxPlayers = maxPlayers + teamDef[i].ASSIGNED_POSITIONS_COUNT;
				else
					if teamDef[i].SIDESMAX > teamDef[i].ASSIGNED_POSITIONS_COUNT then
						maxPlayers = maxPlayers + teamDef[i].ASSIGNED_POSITIONS_COUNT;
					else
						maxPlayers = maxPlayers + teamDef[i].SIDESMAX;
					end;
				end;
			end;
		end;
	end;

	if maxPlayers > allPositionsCount then
		maxPlayers = allPositionsCount;
	end;

	return maxPlayers;
end;

function getTeamGame(teamDef)
	for i = 2, 9 do
		if teamDef[i].NAME ~= '' then
			return true;
		end;
	end;

	return false;
end;

-- generate SGUI slots for players
function refreshPlayerView()
	deleteSlots();

	local teamPlayers  = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }; -- array which storage data which player is in which team
	local playerMerged = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }; -- array which contain merged players
	local playerSlots  = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }; -- array which storage player slots id's
	local teamCounter  = 0;

	if (#MULTIPLAYER_ROOM_DATA.Players > 0) then
		-- get my plid
		MULTIPLAYER_ROOM_MY_PLID = MULTIPLAYER_ROOM_DATA.Players[MULTIPLAYER_ROOM_DATA.PlayerMyPos + 1].PLID;

		for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
			MULTIPLAYER_ROOM_DATA.Players[i].AVATAR_ID = generateAvatar(i, MULTIPLAYER_ROOM_DATA.Players[i].AVATAR, MULTIPLAYER_ROOM_DATA.Players[i].AVATARSEX, MULTIPLAYER_ROOM_DATA.Players[i].NATION);
			playerMerged[MULTIPLAYER_ROOM_DATA.Players[i].TEAMPOS + 1] = addToArray(playerMerged[MULTIPLAYER_ROOM_DATA.Players[i].TEAMPOS + 1], MULTIPLAYER_ROOM_DATA.Players[i].PLID);

			if (MULTIPLAYER_ROOM_DATA.Players[i].TEAM > 0) then
				teamPlayers[MULTIPLAYER_ROOM_DATA.Players[i].TEAM] = addToArray(teamPlayers[MULTIPLAYER_ROOM_DATA.Players[i].TEAM], i);
			end;
		end;

		MULTIPLAYER_ROOM_MY_AVATAR_ID = getAvatarID(MULTIPLAYER_ROOM_DATA.PlayerMyPos + 1);
		MULTIPLAYER_ROOM_MY_AVATAR_COMPONENTS = MULTIPLAYER_ROOM_DATA.Players[MULTIPLAYER_ROOM_DATA.PlayerMyPos + 1].AVATAR;
		MULTIPLAYER_ROOM_MY_AVATAR_SEX = MULTIPLAYER_ROOM_DATA.Players[MULTIPLAYER_ROOM_DATA.PlayerMyPos + 1].AVATARSEX;
	end;

	if (MULTIPLAYER_ROOM_DATA.TEAMDEF == nil) then
		return;
	end;

	local posY = 0;

	if MULTIPLAYER_ROOM_DATA.TeamGame then
		teamCounter = MULTIPLAYER_ROOM_DATA.TEAMDEF[1].SIDESMAX + 1;

		if (teamCounter < 5) then
			setHeight(menu.window_multiplayer_room.panel.page1.playerSlots, 320);
		else
			setHeight(menu.window_multiplayer_room.panel.page1.playerSlots, teamCounter * 80);
		end;

		-- generate team names
		for i = 2, MULTIPLAYER_ROOM_DATA.TEAMDEF[1].SIDESMAX + 1 do
			-- get team allowed positions
			local allowedPositions = {};

			for c = 1, MULTIPLAYER_ROOM_DATA.TEAMDEF[i].ASSIGNED_POSITIONS_COUNT do
				if (MULTIPLAYER_ROOM_DATA.TEAMDEF[i].ASSIGNED_POSITIONS[c]) then
					allowedPositions = addToArray(allowedPositions, MULTIPLAYER_ROOM_DATA.SIDEDEF[c].NAME);
				end;
			end;

			local teamLabel = getLabelEX(
			    menu.window_multiplayer_room.panel.page1.playerSlots, 
			    anchorT, 
			    XYWH(10, posY, menu.window_multiplayer_room.panel.page1.playerSlots.width - 10, 18), 
			    Tahoma_18B, 
			    MULTIPLAYER_ROOM_DATA.TEAMDEF[i].NAME,
			    {
			        wordwrap = true,
			        text_halign = ALIGN_MIDDLE,
			        text_valign = ALIGN_TOP,
			        font_colour = RGB(231, 222, 214),
			        shadowtext = true
			    }
			);

			posY = posY + 26;

			local teamBtn = clButton(
			    menu.window_multiplayer_room.panel.page1.playerSlots, 
			    304, 
			    posY, 
			    150,
			    18, 
			    loc(839), -- join
			    'joinToTeam(' .. i .. ', -1);',
			    {
			    	texture = 'classic/edit/menu_button_small_l.png',
			    	texture2 = 'classic/edit/menu_button_small_c.png',
			    	texture3 = 'classic/edit/menu_button_small_r.png'
			    }
			);

			if (#teamPlayers[i] > 0) then
				for p = 1, #teamPlayers[i] do				
					local playerData = MULTIPLAYER_ROOM_DATA.Players[teamPlayers[i][p]];
					local isMySlot = MULTIPLAYER_ROOM_MY_PLID == playerData.PLID;
					local isMerged = isMerged(playerData.PLID, playerData.TEAM, playerData.TEAMPOS, playerMerged[playerData.TEAMPOS + 1]);
					local slotExists = #playerSlots[i] >= playerData.TEAMPOS + 1;
					local allowedNations = {};

					if (isMySlot) then
						setText(teamBtn, loc(825));
						set_Callback(teamBtn.ID, CALLBACK_MOUSECLICK, 'leaveTeam();');
					end;

					if (#allowedPositions > 0 and playerData.SIDE > 0) then
						local nations = MULTIPLAYER_ROOM_DATA.SIDEDEF[playerData.SIDE].NATIONS;
						
						if (nations.US) then
							allowedNations[1] = loc(810);
						end;

						if (nations.AR) then
							allowedNations[2] = loc(811);
						end;

						if (nations.RU) then
							allowedNations[3] = loc(812);
						end;
					end;

					if (slotExists and isMerged) then
						local id = parseInt(playerSlots[i][playerData.TEAMPOS + 1]);

						if (id ~= nil) then
							setTextID(id, getTextID(id) .. ' + ' .. playerData.NAME);
						end;
					else
						posY = posY + 32;

						local slot = getElementEX(
							menu.window_multiplayer_room.panel.page1.playerSlots, 
							anchorLTRB,
							XYWH(
								2,
								posY, 
								750,
								28
							),
							true,
							{
								texture = 'classic/edit/multiroom/player_slot.png'
							}
						);

						local texture = 'notready';

						if (playerData.PLID == 1 and playerData.READY) then
							texture = 'server';
						elseif (playerData.READY == true) then
							texture = 'ready';
						end;

						local slotPlayerStatus = getElementEX(
							slot, 
							anchorLTRB,
							XYWH(
								4,
								4, 
								20,
								20
							),
							true,
							{
								texture = 'classic/edit/special/' .. texture .. '.png'
							}
						);

						if (isMySlot and (not canModifyServerSettings())) then
							MULTIPLAYER_ROOM_IM_READY = playerData.READY;
							set_Callback(slotPlayerStatus.ID, CALLBACK_MOUSEDOWN, 'setReadyMultiplayerGame();');
							setChecked(menu.window_multiplayer_room.panel.ready, playerData.READY);
						end;

						local slotPlayerAvatar = getElementEX(
							slot, 
							anchorLTRB,
							XYWH(
								28,
								4, 
								20,
								20
							),
							true,
							{
								texture = 'Avatars/unknow.png'
							}
						);

						if (playerData.AVATAR_ID) then
							SGUI_settextureid(slotPlayerAvatar.ID, playerData.AVATAR_ID, 80, 100, 80, 100);
						end;

						local slotPlayerName = getLabelEX(
							slot,
						    anchorT, 
						    XYWH(50, 6, 220, 14),
						    nil, 
						    playerData.NAME, 
						    {
								nomouseevent = true,
						        font_colour = WHITE(),
						        font_name = BankGotic_14,
						        wordwrap = false,
						        text_halign = ALIGN_TOP,
						        text_valign = ALIGN_LEFT,
						        scissor = true
						 	}
						);

						playerSlots[i] = addToArray(playerSlots[i], slotPlayerName.ID);

						local slotColorPicker = clColorPicker(slot, isMySlot and ((not playerData.READY) or canModifyServerSettings()), playerData.COLOUR, 277, 5);

						local slotPosition = clComboBox(
						    slot,
						    336,
						    3,
						    allowedPositions,
						    playerData.SIDE,
						    'OW_MULTIROOM_SET_MYSIDE(INDEX);',
						    {
						        width = 150,
						        texture = 'classic/edit/combobox-short.png',
						        defaultLabel = loc(809),
						        disabled = (not isMySlot)
						    }
						);

						if (not MULTIPLAYER_ROOM_DATA.MULTIMAP.RANDOMNATIONS) then
							local slotNation = clComboBox(
							    slot,
							    488,
							    3,
							    allowedNations,
							    playerData.NATION,
							    'OW_MULTIROOM_SET_MYNATION(INDEX);',
							    {
							        width = 150,
							        texture = 'classic/edit/combobox-short.png',
							        defaultLabel = loc(809),
							        disabled = (not isMySlot)
							    }
							);
						end;

						if (isMySlot and not isMerged) then
							local slotPlayerLock = clCheckbox(
							    slot,
							    659,
							    6,
							    'changeLockStatus(' .. boolToStr(not playerData.LOCKED) .. ');',
							    {
							        checked = playerData.LOCKED,
							        hint = loc(829)
							    }
							);

							local slotPlayerLockLabel = getLabelEX(
							    slot,
							    anchorLT,
							    XYWH(678, 6, 160, 16),
							    BankGotic_14, 
							    loc(828),
							    {
							        font_colour = RGB(0, 0, 0),
							        shadowtext = false,
							        nomouseevent = true,
							        text_halign = ALIGN_LEFT,
							        text_valign = ALIGN_TOP,
							        wordwrap = false,
							        scissor = true
							    }
							);
						else
							if (isMerged) then
								local leavePlayer = clButton(
								    slot, 
								    660, 
								    5, 
								    84,
								    18, 
								    loc(844), -- separate
								    'joinToTeam(' .. i .. ', -1);',
								    {
								    	texture = 'classic/edit/menu_button_small_l.png',
								    	texture2 = 'classic/edit/menu_button_small_c.png',
								    	texture3 = 'classic/edit/menu_button_small_r.png'
								    }
								);
							elseif (not playerData.LOCKED) then
								local joinToPlayer = clButton(
								    slot, 
								    660, 
								    5, 
								    84,
								    18, 
								    loc(839), -- join
								    'joinToTeam(' .. i .. ', ' .. playerData.TEAMPOS .. ');',
								    {
								    	texture = 'classic/edit/menu_button_small_l.png',
								    	texture2 = 'classic/edit/menu_button_small_c.png',
								    	texture3 = 'classic/edit/menu_button_small_r.png'
								    }
								);
							end;
						end;
					end;
				end;
			end;

			posY = posY + 38;
		end;
	else
		local allowedPositions = {};

		for c = 1, 8 do
			if (MULTIPLAYER_ROOM_DATA.TEAMDEF[1].ASSIGNED_POSITIONS[c]) then
				allowedPositions = addToArray(allowedPositions, MULTIPLAYER_ROOM_DATA.SIDEDEF[c].NAME);
			end;
		end;

		for p = 1, #MULTIPLAYER_ROOM_DATA.Players do
			local playerData = MULTIPLAYER_ROOM_DATA.Players[p];
			local isMySlot = MULTIPLAYER_ROOM_MY_PLID == playerData.PLID;
			local allowedNations = {};

			if (#allowedPositions > 0 and playerData.SIDE > 0) then
				local nations = MULTIPLAYER_ROOM_DATA.SIDEDEF[playerData.SIDE].NATIONS;
				
				if (nations.US) then
					allowedNations[1] = loc(810);
				end;

				if (nations.AR) then
					allowedNations[2] = loc(811);
				end;

				if (nations.RU) then
					allowedNations[3] = loc(812);
				end;
			end;

			local slot = getElementEX(
				menu.window_multiplayer_room.panel.page1.playerSlots, 
				anchorLTRB,
				XYWH(
					2,
					posY, 
					750,
					28
				),
				true,
				{
					texture = 'classic/edit/multiroom/player_slot.png'
				}
			);

			local texture = 'notready';

			if (playerData.PLID == 1 and playerData.READY) then
				texture = 'server';
			elseif (playerData.READY == true) then
				texture = 'ready';
			end;

			local slotPlayerStatus = getElementEX(
				slot, 
				anchorLTRB,
				XYWH(
					4,
					4, 
					20,
					20
				),
				true,
				{
					texture = 'classic/edit/special/' .. texture .. '.png'
				}
			);

			if (isMySlot and (not canModifyServerSettings())) then
				MULTIPLAYER_ROOM_IM_READY = playerData.READY;
				set_Callback(slotPlayerStatus.ID, CALLBACK_MOUSEDOWN, 'setReadyMultiplayerGame();');
				setChecked(menu.window_multiplayer_room.panel.ready, playerData.READY);
			end;

			local slotPlayerAvatar = getElementEX(
				slot, 
				anchorLTRB,
				XYWH(
					28,
					4, 
					20,
					20
				),
				true,
				{
					texture = 'Avatars/unknow.png'
				}
			);

			if (playerData.AVATAR_ID) then
				SGUI_settextureid(slotPlayerAvatar.ID, playerData.AVATAR_ID, 80, 100, 80, 100);
			end;

			local slotPlayerName = getLabelEX(
				slot,
			    anchorT, 
			    XYWH(50, 6, 220, 14),
			    nil, 
			    playerData.NAME, 
			    {
					nomouseevent = true,
			        font_colour = WHITE(),
			        font_name = BankGotic_14,
			        wordwrap = false,
			        text_halign = ALIGN_TOP,
			        text_valign = ALIGN_LEFT,
			        scissor = true
			 	}
			);

			local slotColorPicker = clColorPicker(slot, isMySlot and ((not playerData.READY) or canModifyServerSettings()), playerData.COLOUR, 277, 5);

			local slotPosition = clComboBox(
			    slot,
			    336,
			    3,
			    allowedPositions,
			    playerData.SIDE,
			    'OW_MULTIROOM_SET_MYSIDE(INDEX);',
			    {
			        width = 150,
			        texture = 'classic/edit/combobox-short.png',
			        defaultLabel = loc(809),
			        disabled = (not isMySlot)
			    }
			);

			if (not MULTIPLAYER_ROOM_DATA.MULTIMAP.RANDOMNATIONS) then
				local slotNation = clComboBox(
				    slot,
				    488,
				    3,
				    allowedNations,
				    playerData.NATION,
				    'OW_MULTIROOM_SET_MYNATION(INDEX);',
				    {
				        width = 150,
				        texture = 'classic/edit/combobox-short.png',
				        defaultLabel = loc(809),
				        disabled = (not isMySlot)
				    }
				);
			end;

			posY = posY + 32;
		end;
	end;

	-- spectator
	if MULTIPLAYER_ROOM_DATA.MULTIMAP.CANSPEC and #MULTIPLAYER_ROOM_DATA.TEAMDEF >= 10 then
		local specLabel = getLabelEX(
		    menu.window_multiplayer_room.panel.page1.spectatorSlots, 
		    anchorT, 
		    XYWH(10, 0, menu.window_multiplayer_room.panel.page1.spectatorSlots.width - 22, 18), 
		    Tahoma_18B, 
		    loc(1113),
		    {
		        wordwrap = true,
		        text_halign = ALIGN_MIDDLE,
		        text_valign = ALIGN_TOP,
		        font_colour = RGB(231, 222, 214),
		        shadowtext = true
		    }
		);

		local teamBtn = clButton(
		    menu.window_multiplayer_room.panel.page1.spectatorSlots, 
		    304, 
		    26, 
		    150,
		    18, 
		    loc(839), -- join
		    'joinToTeam(10, -1);',
		    {
		    	texture = 'classic/edit/menu_button_small_l.png',
		    	texture2 = 'classic/edit/menu_button_small_c.png',
		    	texture3 = 'classic/edit/menu_button_small_r.png'
		    }
		);

		posY = 50;

		if (#teamPlayers[10] > 0) then
			for p = 1, #teamPlayers[10] do
				local playerData = MULTIPLAYER_ROOM_DATA.Players[teamPlayers[10][p]];
				local isMySlot = MULTIPLAYER_ROOM_MY_PLID == playerData.PLID;

				if (isMySlot) then
					setText(teamBtn, loc(825));
					set_Callback(teamBtn.ID, CALLBACK_MOUSECLICK, 'leaveTeam();');
				end;

				local slot = getElementEX(
					menu.window_multiplayer_room.panel.page1.spectatorSlots, 
					anchorLTRB,
					XYWH(
						2,
						posY, 
						750,
						28
					),
					true,
					{
						texture = 'classic/edit/multiroom/player_slot.png'
					}
				);

				local texture = 'notready';

				if (playerData.PLID == 1 and playerData.READY) then
					texture = 'server';
				elseif (playerData.READY == true) then
					texture = 'ready';
				end;

				local slotPlayerStatus = getElementEX(
					slot, 
					anchorLTRB,
					XYWH(
						4,
						4, 
						20,
						20
					),
					true,
					{
						texture = 'classic/edit/special/' .. texture .. '.png'
					}
				);

				if (isMySlot and (not canModifyServerSettings())) then
					MULTIPLAYER_ROOM_IM_READY = playerData.READY;
					set_Callback(slotPlayerStatus.ID, CALLBACK_MOUSEDOWN, 'setReadyMultiplayerGame();');
					setChecked(menu.window_multiplayer_room.panel.ready, playerData.READY);
				end;

				local slotPlayerAvatar = getElementEX(
					slot, 
					anchorLTRB,
					XYWH(
						28,
						4, 
						20,
						20
					),
					true,
					{
						texture = 'Avatars/unknow.png'
					}
				);

				if (playerData.AVATAR_ID) then
					SGUI_settextureid(slotPlayerAvatar.ID, playerData.AVATAR_ID, 80, 100, 80, 100);
				end;

				local slotPlayerName = getLabelEX(
					slot,
				    anchorT, 
				    XYWH(50, 6, 220, 14),
				    nil, 
				    playerData.NAME, 
				    {
						nomouseevent = true,
				        font_colour = WHITE(),
				        font_name = BankGotic_14,
				        wordwrap = false,
				        text_halign = ALIGN_TOP,
				        text_valign = ALIGN_LEFT,
				        scissor = true
				 	}
				);

				posY = posY + 32;
			end;
		end;
	end;
end;

function deleteSlots()
	sgui_deletechildren(menu.window_multiplayer_room.panel.page1.playerSlots.ID);
	sgui_deletechildren(menu.window_multiplayer_room.panel.page1.spectatorSlots.ID);
end;

function isMerged(plid, team, teamPos, mergedPlayers)
	if (#mergedPlayers < 2) then
		return false;
	end;

	for i = 1, #mergedPlayers do
		local player = getPlayerByPLID(mergedPlayers[i]);

		if (mergedPlayers[i] ~= plid and team == player.TEAM and teamPos == player.TEAMPOS) then
			return true;
		end;
	end;

	return false;
end;

function getPlayerByPLID(plid)
	if (#MULTIPLAYER_ROOM_DATA.Players == 0) then
		return {};
	end;

	for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
		if (MULTIPLAYER_ROOM_DATA.Players[i].PLID == plid) then
			return MULTIPLAYER_ROOM_DATA.Players[i];
		end;
	end;
end;

function changeLockStatus(isLocked)
	OW_MULTIROOM_SET_MYLOCKED(isLocked);
end;

-- join to team
function joinToTeam(teamID, teamPos)
	OW_MULTIROOM_SET_MYTEAMANDPOS(teamID, teamPos);
	OW_MULTIROOM_SET_MYISSPEC(false);
end;

function leaveTeam()
	OW_MULTIROOM_SET_MYTEAMANDPOS(0, -1);
	OW_MULTIROOM_SET_MYISSPEC(false);
	resetPlayerData(true);
end;

-- reset player data
-- resetColour : bool
function resetPlayerData(resetColour)
	if resetColour == true then
		OW_MULTIROOM_SET_MYCOLOUR(0);
	end;

	OW_MULTIROOM_SET_MYSIDE(0);
	OW_MULTIROOM_SET_MYNATION(0);
end;

-- PAGE #2
--[[
	TYPE:
		0: none
		1: unknown
		2: comboBox
		3: slider
		4: comboBox
]]--
function generateMapSettings(SETTINGS, IS_HOST)
	local parent = menu.window_multiplayer_room.panel.page2;
	local counter = 1;

	sgui_deletechildren(parent.ID);

	if #SETTINGS.MAPPARAMS == 0 then
		return;
	end;

	for i = 1, 51 do --SETTINGS.MAPPARAMCOUNT do
		local param = SETTINGS.MAPPARAMS[i];

		if (param.TYPE == 0 or param.NAME == '') then
			goto continue;
		end;

		local option = {
			ID = i,
			LIST = param.ITEMS.NAMES,
			DEFAULT = param.VALUE,
			NAME = param.NAME,
			HINT = param.ITEMS.HINTS[param.VALUE]
		};

		setMultiplayerOption(parent, option, counter, not IS_HOST);
		counter = counter + 1;
		::continue::
	end;


	MULTIPLAYER_ROOM_GAME_LOCKED = (SETTINGS.MAPPARAMS[MULTIPLAYER_OPTION_LOCK_GAME - 1].VALUE) > 0;
	MULTIPLAYER_ROOM_RANDOM_POSITIONS = (SETTINGS.MAPPARAMS[MULTIPLAYER_OPTION_RANDOM_POSITONS - 1].VALUE) > 0;
	MULTIPLAYER_ROOM_RANDOM_COLOURS = (SETTINGS.MAPPARAMS[MULTIPLAYER_OPTION_RANDOM_COLOURS - 1].VALUE) > 0;
	MULTIPLAYER_ROOM_RANDOM_NATIONS = (SETTINGS.MAPPARAMS[MULTIPLAYER_OPTION_RANDOM_NATIONS - 1].VALUE) > 0;
	MULTIPLAYER_ROOM_LOCK_TEAMS = (SETTINGS.MAPPARAMS[MULTIPLAYER_OPTION_LOCK_TEAMS - 1].VALUE) > 0;

	generateGlobalSettings();
end;

function setMultiplayerOption(PARENT, OPTION, INDEX, MODIFIABLE)
	getLabelEX(
	    PARENT,
	    anchorT, 
	    XYWH(
	    	10 + (((INDEX - 1) % 4) * 240),
	    	6 + (math.floor((INDEX - 1) / 4) * 60),
	    	240,
	    	14
	    ), 
	    nil,
	    SGUI_widesub(OPTION.NAME, 1, 27),
	    {
	        font_colour = WHITE(),
            nomouseevent = true,
            font_name = BankGotic_14
	    }
	);
	
	clComboBox(
	    PARENT,
	    10 + (((INDEX - 1) % 4) * 240),
	    24 + (math.floor((INDEX - 1) / 4) * 60),
	    OPTION.LIST,
	    OPTION.DEFAULT + 1,
	    'changeMultiplayerOption(' .. OPTION.ID .. ', "INDEX")',
	    {
	        hint = OPTION.HINT,
	        disabled = MODIFIABLE
	    }
	);
end;

function changeMultiplayerOption(ID, INDEX)
	OW_MULTIROOM_HOST_SET_MAPPARAM(ID - 1, INDEX - 1); -- for some reason it must be -1 lol..
end;


-- PAGE #3
menu.window_multiplayer_room.panel.page3.mapNameLabel = getLabelEX(
    menu.window_multiplayer_room.panel.page3,
    anchorT, 
    XYWH(
    	12,
    	12,
    	120,
    	14
    ), 
    nil,
   	loc(821),
    {
        font_colour = WHITE(),
        nomouseevent = true,
        font_name = BankGotic_14
    }
);

menu.window_multiplayer_room.panel.page3.mapComboBox = getElementEX(
	menu.window_multiplayer_room.panel.page3, 
	anchorLTRB,
	XYWH(
		10,
		30,
		447,
		270
	),
	true,
	{
		colour1 = WHITEA()
	}
);

menu.window_multiplayer_room.panel.page3.gameTypeLabel = getLabelEX(
    menu.window_multiplayer_room.panel.page3,
    anchorT, 
    XYWH(
    	558,
    	12,
    	120,
    	14
    ), 
    nil,
   	loc(822),
    {
        font_colour = WHITE(),
        nomouseevent = true,
        font_name = BankGotic_14
    }
);

menu.window_multiplayer_room.panel.page3.gameTypeComboBox = getElementEX(
	menu.window_multiplayer_room.panel.page3, 
	anchorLTRB,
	XYWH(
		556,
		30,
		447,
		270
	),
	true,
	{
		colour1 = WHITEA()
	}
);

menu.window_multiplayer_room.panel.page3.mapPic = getElementEX(
	menu.window_multiplayer_room.panel.page3, 
	anchorLTRB,
	XYWH(
		10,
		60,
		500,
		330
	),
	true,
	{
		colour1 = WHITE()
	}
);

menu.window_multiplayer_room.panel.page3.description = getLabelEX(
	menu.window_multiplayer_room.panel.page3,
    anchorT, 
    XYWH(556, 60, 447, 596),
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

function setMapList(mapList, selectedMap, isHost)
	sgui_deletechildren(menu.window_multiplayer_room.panel.page3.mapComboBox.ID);

	if (mapList == nil) then
		return;
	end;

	local list = {};

	for i = 1, #mapList do
		list = addToArray(list, mapList[i].NAMELOC);
	end;

	menu.window_multiplayer_room.panel.page3.mapComboBox.list = clComboBox(
	    menu.window_multiplayer_room.panel.page3.mapComboBox,
	    0,
	    0,
	    list,
	    selectedMap,
	    'selectMap(INDEX);',
	    {
	    	texture = 'classic/edit/combobox-text.png',
	    	textureList = 'classic/edit/combobox-list.png',
	    	width = 447,
	    	widthList = 447,
	    	trimLength = 66,
	    	trimFrom = 3,
	    	disabled = (not isHost)
	    }
	);
end;

function setGameTypeList(INDEX, selectedGameType, isHost)
	local gameTypeList = {};
	local gameType = nil;

	for i = 1, MULTIPLAYER_ROOM_DATA.MAPS[INDEX].GAMETYPELISTCOUNT do
		gameType = MULTIPLAYER_ROOM_DATA.MAPS[INDEX].GAMETYPELIST[i];
		gameTypeList = addToArray(gameTypeList, gameType.NAMELOC);
	end;

	sgui_deletechildren(menu.window_multiplayer_room.panel.page3.gameTypeComboBox.ID);

	menu.window_multiplayer_room.panel.page3.gameTypeComboBox.list = clComboBox(
	    menu.window_multiplayer_room.panel.page3.gameTypeComboBox,
	    0,
	    0,
	    gameTypeList,
	    selectedGameType,
	    'selectGameType(INDEX);',
	    {
	    	texture = 'classic/edit/combobox-text.png',
	    	textureList = 'classic/edit/combobox-list.png',
	    	width = 447,
	    	widthList = 447,
	    	trimLength = 66,
	    	trimFrom = 3,
	    	disabled = (not isHost)
	    }
	);
end;

function selectMap(INDEX)
	INDEX = parseInt(INDEX);

	MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX = INDEX;

	local mapName = MULTIPLAYER_ROOM_DATA.MAPS[INDEX].NAME;
	local gameType = MULTIPLAYER_ROOM_DATA.MAPS[INDEX].GAMETYPELIST[1].NAME;

	OW_MULTIROOM_HOST_SET_MAP(mapName, gameType);
end;

function selectGameType(INDEX)
	INDEX = parseInt(INDEX);

	MULTIPLAYER_ROOM_ACTIVE_GAMETYPE_INDEX = INDEX;

	local mapName = MULTIPLAYER_ROOM_DATA.MAPS[MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX].NAME;
	local gameType = MULTIPLAYER_ROOM_DATA.MAPS[MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX].GAMETYPELIST[INDEX].NAME;

	OW_MULTIROOM_HOST_SET_MAP(mapName, gameType);
end;

function setMapPictureDescription(mapName)
	local picture = '';

	if mapName == nil or mapName == '' then
		picture = 'skirmish_unknown.png';
	else
		picture = '%missions%/_multiplayer/' .. mapName .. '/mappic.png'
	end;

	setTexture(menu.window_multiplayer_room.panel.page3.mapPic, picture);
	setTextureFallback(menu.window_multiplayer_room.panel.page3.mapPic, 'skirmish_unknown.png');

	local description = SGUI_widesub(splitstringfirst(MULTIPLAYER_ROOM_DATA.MULTIMAP.DESCRIPTION, ': '), 3) .. ':\n' .. SGUI_widesub(splitstringrest(MULTIPLAYER_ROOM_DATA.MULTIMAP.DESCRIPTION, ': '), 2);
	local rules = SGUI_widesub(splitstringfirst(MULTIPLAYER_ROOM_DATA.MULTIMAP.RULES, ': '), 3) .. ':\n' .. SGUI_widesub(splitstringrest(MULTIPLAYER_ROOM_DATA.MULTIMAP.RULES, ': '), 2);

	setText(menu.window_multiplayer_room.panel.page3.description, description .. '\n\n' .. rules);
end;

function canModifyServerSettings()
	return MULTIPLAYER_ROOM_IS_HOST or MULTIPLAYER_ROOM_IS_DEDI;
end;

function useModernGUILogic()
	-- modern gui logic
	MultiDef.MultiMap = copytable(MULTIPLAYER_ROOM_DATA.MULTIMAP);
	MultiDef.SideDef = copytable(MULTIPLAYER_ROOM_DATA.SIDEDEF);
	MultiDef.TeamDef = copytable(MULTIPLAYER_ROOM_DATA.TEAMDEF);
	MultiDef.MapName = copytable(MULTIPLAYER_ROOM_MAP_DATA);
	Players = copytable(MULTIPLAYER_ROOM_DATA.Players);
	MyID = MULTIPLAYER_ROOM_MY_PLID;
	teamGame = MULTIPLAYER_ROOM_DATA.TeamGame;

	local mapName = string.upper(MultiDef.MapName.MAP);
	local gameName = string.upper(MultiDef.MapName.GAMETYPE);

	if gameName == nil then 
		gameName = ''; 
	end;

	if mapName == nil then 
		mapName = ''; 
	end;

	AddData = LOAD_TEXT_TO_TABLE("missions/_Multiplayer/" .. mapName .. "/MultiDesc" .. gameName .. "");

	if not AddData then
		AddData = {};
	end;

	if string.find(gameName, 'UNITED NATIONS') then
		MultiDef.MultiMap.UNITED = true;
	else
		MultiDef.MultiMap.UNITED = false;
	end;

	MultiDef.NationsText,MultiDef.NationsIcons,MultiDef.NationsLBars = getBaseNatNames(MultiDef.MultiMap.UNITED);
	MultiDef.MultiMap.MODIFEDNATIONS = getModNation(AddData.MODIFEDNATIONS);

	MultiDef.MultiMap.RESTRICTIONS = AddData.RESTRICTIONS;

	if MultiDef.MultiMap.RESTRICTIONS == nil then
		MultiDef.MultiMap.RESTRICTIONS = {};
	end;

	MultiDef.MultiMap.RESTRICTIONS.RESTRICTTECH = {};
	MultiDef.MultiMap.RESTRICTIONS.RESTRICTBUILDINGS = {};
	MultiDef.MultiMap.TECHLIMIT = AddData.TECHNOLOGYLIMITS;
	MultiDef.MultiMap.POSCOORS = AddData.POSCOORS;
	MultiDef.MultiMap.POSMARKS = AddData.POSMARKS;
 	MultiDef.MaxPlayers = MULTIPLAYER_ROOM_DATA.MaxPlayers;
end;

-- override functions
-- @TODO
function init_specBars()

end;