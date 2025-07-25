MULTIPLAYER_ROOM_ACTIVE = false;
MULTIPLAYER_ROOM_DATA = {};
MULTIPLAYER_ROOM_MAP_DATA = {};
MULTIPLAYER_ROOM_MAPS_PLAYERS = {};
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
MULTIPLAYER_ROOM_MAP_EXTRA_DATA = {};
MULTIPLAYER_ROOM_INIT_PLAYERS_LIST = false;
MULTIPLAYER_ROOM_PLAYERS = {};
MULTIPLAYER_ROOM_TEAMS = {};
MULTIPLAYER_ROOM_TEAMS_INIT = {};
MULTIPLAYER_ROOM_TEAMS_SPEC = {};
MULTIPLAYER_ROOM_MERGED = {};
MULTIPLAYER_MINIMAP_PREVIEW_TEAM = {
	[0] = RGBA(140, 132, 99, 115),
	[1] = RGBA(66, 130, 255, 115),
	[2] = RGBA(255, 255, 132, 115),
	[3] = RGBA(231, 65, 66, 115),
	[4] = RGBA(0, 255, 255, 115),
	[5] = RGBA(255, 180, 0, 115),
	[6] = RGBA(255, 130, 255, 115),
	[7] = RGBA(0, 255, 0, 115),
	[8] = RGBA(200, 200, 200, 115)
};
MULTIPLAYER_MINIMAP_PREVIEW_COLOURS = {
	[0] = RGB(140, 132, 99),
	[1] = RGB(66, 130, 255),
	[2] = RGB(255, 255, 132),
	[3] = RGB(231, 65, 66),
	[4] = RGB(0, 255, 255),
	[5] = RGB(255, 180, 0),
	[6] = RGB(255, 130, 255),
	[7] = RGB(0, 255, 0),
	[8] = RGB(200, 200, 200)
};
MULTIPLAYER_MINIMAP_PLAYERS = {};

MULTIPLAYER_OPTION_RANDOM_POSITONS = 58;
MULTIPLAYER_OPTION_RANDOM_COLOURS = 59;
MULTIPLAYER_OPTION_RANDOM_NATIONS = 60;
MULTIPLAYER_OPTION_LOCK_TEAMS = 55;
MULTIPLAYER_OPTION_RANDKED = 51;
MULTIPLAYER_OPTION_LOCK_GAME = 57;
MULTIPLAYER_OPTION_LIMIT_TECH = 56;

MULTIPLAYER_ROOM_START_TIMER = 5;
MULTIPLAYER_ROOM_START_ERROR = false;
MULTIPLAYER_ROOM_START_ERROR_MSG = '';

MULTIPLAYER_REAL_POSITIONS = {};

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
		},
		-- added='setTextID(%id, %data);'
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

--[[
menu.window_multiplayer_room.panel.watcher = getLabelEX(
	menu.window_multiplayer_room.panel,
	anchorLTRB,
	XYWH(240, 243, 190, 30),
	nil,
	'A: 0',
	{
		font_colour = WHITE(),
		nomouseevent = true,
		font_name = ADMUI3L,
		scissor = true,
		wordwrap = true,
		text_halign = ALIGN_TOP,	
		text_valign = ALIGN_LEFT,
	}
);

menu.window_multiplayer_room.panel.watcher2 = getLabelEX(
	menu.window_multiplayer_room.panel,
	anchorLTRB,
	XYWH(440, 243, 190, 30),
	nil,
	'B: 0',
	{
		font_colour = WHITE(),
		nomouseevent = true,
		font_name = ADMUI3L,
		scissor = true,
		wordwrap = true,
		text_halign = ALIGN_TOP,	
		text_valign = ALIGN_LEFT,
	}
);

menu.window_multiplayer_room.panel.watcher3 = getLabelEX(
	menu.window_multiplayer_room.panel,
	anchorLTRB,
	XYWH(640, 243, 190, 30),
	nil,
	'C: 0',
	{
		font_colour = WHITE(),
		nomouseevent = true,
		font_name = ADMUI3L,
		scissor = true,
		wordwrap = true,
		text_halign = ALIGN_TOP,	
		text_valign = ALIGN_LEFT,
	}
);
--]]

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

-- preview map
menu.window_multiplayer_room.panel.page1.previewMap = getElementEX(
	menu.window_multiplayer_room.panel.page1, 
	anchorLTRB,
	XYWH(
		782, 
		9,
		220,
		220
	),
	true,
	{
		
	}
);

-- check init player slots
menu.window_multiplayer_room.panel.page1.playerListDescription = getLabelEX(
	menu.window_multiplayer_room.panel.page1,
	anchorT, 
	XYWH(782, 249, 240, 12),
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

--[[menu.window_multiplayer_room.panel.page1.playerListKick = clButton(
	menu.window_multiplayer_room.panel.page1,
	808, 
	538, 
	156,
	30, 
	loc(498), -- kick player
	'kickPlayer();',
	{}
);--]]

menu.window_multiplayer_room.panel.page1.playerList = clListBox(
	menu.window_multiplayer_room.panel.page1, 
	XYWH(782, 264, 224, 212), 
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

	local avatarFromProfile = loadAvatarComponentsFromProfile();

	if avatarFromProfile ~= nil then
		local components = {};

		for i = 1, #avatarFromProfile do
			components = addToArray(components, parseInt(avatarFromProfile[i]));
		end;

		MULTIPLAYER_ROOM_MY_AVATAR_ID = previewAvatar(avatarFromProfile);
		MULTIPLAYER_ROOM_MY_AVATAR_COMPONENTS = components;
		MULTIPLAYER_ROOM_MY_AVATAR_SEX = parseInt(avatarFromProfile[1]);
	else
		MULTIPLAYER_ROOM_MY_AVATAR_ID = getAvatarID(MULTIPLAYER_ROOM_MY_PLID);
		MULTIPLAYER_ROOM_MY_AVATAR_COMPONENTS = MULTIPLAYER_ROOM_DATA.Players[MULTIPLAYER_ROOM_DATA.PlayerMyPos + 1].AVATAR;
		MULTIPLAYER_ROOM_MY_AVATAR_SEX = MULTIPLAYER_ROOM_DATA.Players[MULTIPLAYER_ROOM_DATA.PlayerMyPos + 1].AVATARSEX;
	end;

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
	setMyHeroAvatar(MULTIPLAYER_ROOM_MY_AVATAR_SEX, MULTIPLAYER_ROOM_PREVIEV_AVATAR_COMPONENTS);
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

	MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX = getMultiplayerActiveMapIndex(MULTIPLAYER_ROOM_DATA.MAPS, MULTIPLAYER_ROOM_MAP_DATA.MAP);
	-- MULTIPLAYER_ROOM_ACTIVE_GAMETYPE_INDEX = MULTIPLAYER_ROOM_DATA.MULTIMAP.GAMETYPE;

	generateMapSettings(DATA.MULTIMAP, canModifyServerSettings());
	setMapList(MULTIPLAYER_ROOM_DATA.MAPS, MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX, canModifyServerSettings());
	setGameTypeList(MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX, MULTIPLAYER_ROOM_ACTIVE_GAMETYPE_INDEX, canModifyServerSettings());
	setMapPictureDescription();
	setMapPreview();
	
	--clDebug('FROMOW_MULTIROOM_GET_MAP_INFO_CALLBACK');
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

	--local stopwatch = STOPWATCH_ADD();
	--STOPWATCH_START(stopwatch);

	MULTIPLAYER_ROOM_IS_DEDI = getvalue(OWV_IAMDEDIHOST);

	MULTIPLAYER_ROOM_DATA.PlayerCount = DATA.PLAYERCOUNT;
	MULTIPLAYER_ROOM_DATA.PlayerMyPos = DATA.PLAYERSMYPOS;
	MULTIPLAYER_ROOM_DATA.Players = DATA.PLAYERS;

	--updateHostVisibilitySettings(canModifyServerSettings());
	updatePlayersCount(MULTIPLAYER_ROOM_DATA.PlayerCount, MULTIPLAYER_ROOM_DATA.MaxPlayers);
	updatePlayersOnServer(MULTIPLAYER_ROOM_DATA.Players);

	--setMapList(MULTIPLAYER_ROOM_DATA.MAPS, MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX, canModifyServerSettings());

	updateMultiplayerView();
	
	--clDebug(STOPWATCH_STOP(stopwatch));
	--setText(menu.window_multiplayer_room.panel.watcher, 'A: ' .. string.format("%.18f", STOPWATCH_STOP(stopwatch)));
	--STOPWATCH_DELETE(stopwatch);

	-- clDebug('FROMOW_MULTIROOM_TEAMLIST');
end;

-- trigger each when map is changed
function FROMOW_MULTIROOM_UPDATE_MAP_NAME(DATA)
	MULTIPLAYER_ROOM_MAP_DATA = DATA;

	setText(menu.window_multiplayer_room.panel.mapName, trim(MULTIPLAYER_ROOM_MAP_DATA.MAPLOC) .. ' - ' .. trim(MULTIPLAYER_ROOM_MAP_DATA.GAMETYPELOC));

	-- get map info data
	OW_MULTIROOM_GET_CURRENT_MAP_INFO();

	setMapList(MULTIPLAYER_ROOM_DATA.MAPS, MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX, canModifyServerSettings());
	resetPlayerData(true);

	if (MULTIPLAYER_ROOM_INIT_PLAYERS_LIST) then
		recreateTeams();
	end;

	if not MULTIPLAYER_ROOM_IS_HOST then
		OW_MULTIROOM_SET_MYREADY(false);
	end;

	-- clDebug('FROMOW_MULTIROOM_UPDATE_MAP_NAME');
end;

function FROMOW_MULTIROOM_UPDATE_MAP_SETTINGS(DATA)
	--local stopwatch2 = STOPWATCH_ADD();
	--STOPWATCH_START(stopwatch2);

	if MULTIPLAYER_ROOM_DATA.MULTIMAP ~= nil then
		for i = 1, DATA.MAPPARAMCOUNT do
			if MULTIPLAYER_ROOM_DATA.MULTIMAP.MAPPARAMS[i] ~= nil then
				MULTIPLAYER_ROOM_DATA.MULTIMAP.MAPPARAMS[i].VALUE = DATA.MAPPARAMS[i];
			end;
		end;

		generateMapSettings(MULTIPLAYER_ROOM_DATA.MULTIMAP, canModifyServerSettings());
	end;

	-- get map info data
	--OW_MULTIROOM_GET_CURRENT_MAP_INFO();

	--setText(menu.window_multiplayer_room.panel.watcher2, 'B: ' .. string.format("%.18f", STOPWATCH_STOP(stopwatch2)));
	--STOPWATCH_DELETE(stopwatch2);

	--clDebug('FROMOW_MULTIROOM_UPDATE_MAP_SETTINGS');
end;

function FROMOW_MULTIROOM_UPDATE_MAP_GAMETYPE_LIST(DATA)
	MULTIPLAYER_ROOM_ACTIVE_GAMETYPE_INDEX = 1;
end;

function FROMOW_MULTIROOM_GET_MAP_GAMETYPES_CALLBACK(DATA)
	--clDebug('FROMOW_MULTIROOM_GET_MAP_GAMETYPES_CALLBACK');
end;

function FROMOW_MULTIROOM_UPDATE_MAP_LIST(UNRANKED, RANKED)
	--MULTIPLAYER_ROOM_DATA.UNRANKED_MAPS  = UNRANKED.MAPLIST;
	--MULTIPLAYER_ROOM_DATA.UNRANKED_COUNT = UNRANKED.MAPLISTCOUNT;
	--MULTIPLAYER_ROOM_DATA.RANKED_MAPS    = RANKED.MAPLIST;
	--MULTIPLAYER_ROOM_DATA.RANKED_COUNT   = RANKED.MAPLISTCOUNT;

	MultiDef.MapList      = UNRANKED.MAPLIST;
	MultiDef.MapListCount = UNRANKED.MAPLISTCOUNT;

	MULTIPLAYER_ROOM_DATA.MAPS = UNRANKED.MAPLIST;
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
	MULTIPLAYER_ROOM_INIT_PLAYERS_LIST = false;
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

function FROMOW_MULTIROOM_TEAMERROR(ERR, ISERR)
    MULTIPLAYER_ROOM_START_ERROR_MSG = ERR;

    if ISERR then
        MULTIPLAYER_ROOM_START_ERROR = true;
    else
    	MULTIPLAYER_ROOM_START_ERROR = false;
    end;

    -- check settings before start
    if MULTIPLAYER_ROOM_DATA.Players then
        if #MULTIPLAYER_ROOM_DATA.Players < 2 then
            return loc(875), true;
        end;

        if MULTIPLAYER_ROOM_MAP_EXTRA_DATA then
            if MULTIPLAYER_ROOM_MAP_EXTRA_DATA.forceToPickColours then
                for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
                    if MULTIPLAYER_ROOM_DATA.Players[i].COLOUR == 0 then
                        MULTIPLAYER_ROOM_START_ERROR = true;    
                        return loc(5063), true;
                    end;
                end;
            end;
        end;
    end;
end;

-- main functions
function delayMultiplayerStart()
	if (MULTIPLAYER_ROOM_START_ERROR) then
		MULTIPLAYER_ROOM_START_ERROR = false;
		MULTIPLAYER_ROOM_START_TIMER = 5;
		
		if canModifyServerSettings() then
			setEnabled(menu.window_multiplayer_room.panel.start, true);
		end;

		-- OW_MULTI_SENDALLCHATMSG(MULTIPLAYER_ROOM_START_ERROR_MSG, '#000000');
		OW_MULTI_SENDALLCHATMSG(loc(TID_Multi_StartupAborted) .. ' (HOST)', '#000000');

		return false;
	end;

	if (MULTIPLAYER_ROOM_START_TIMER == 0) then
		if OW_ROOM_LAUNCH_GAME() then
			IN_LOBBY = false;
			OW_IRC_DESTROY();

			setVisible(menu.window_multiplayer_room, false);

			deleteSlots();
			clearAvatarCache();
		end;
	else
		MULTIPLAYER_ROOM_START_TIMER = MULTIPLAYER_ROOM_START_TIMER - 1;
		OW_MULTI_SENDALLCHATMSG(loc1(TID_Multi_StartingIn, MULTIPLAYER_ROOM_START_TIMER + 1), '#000000');
		timer:single(1, 'delayMultiplayerStart();');
	end;
end;

function startMultiplayerGame()
	-- check settings before start
	if MULTIPLAYER_ROOM_MAP_EXTRA_DATA then
		if MULTIPLAYER_ROOM_MAP_EXTRA_DATA.forceToPickColours then
			for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
				if MULTIPLAYER_ROOM_DATA.Players[i].COLOUR == 0 then
					setText(menu.window_multiplayer_room.panel.status, loc(5063));
					return;
				end;
			end;
		end;
	end;

	if canModifyServerSettings() then
		setEnabled(menu.window_multiplayer_room.panel.start, false);
	end;

	refreshPlayerView();
	delayMultiplayerStart();
end;

function getMultiplayerActiveMapIndex(MAPS, ACTIVE_MAP)
	if (MAPS == nil) then
		return 1;
	end;

	for i = 1, #MAPS do
		if (MAPS[i].NAME == ACTIVE_MAP) then
			return i;
		end;
	end;

	return 1;
end

function switchCheckboxReady()
	setChecked(menu.window_multiplayer_room.panel.ready, not MULTIPLAYER_ROOM_IM_READY);
	setReadyMultiplayerGame();
end

function setReadyMultiplayerGame()
	local ready = not MULTIPLAYER_ROOM_IM_READY;

    if ready then
        if MULTIPLAYER_ROOM_MAP_EXTRA_DATA and MULTIPLAYER_ROOM_DATA.Players then
            if MULTIPLAYER_ROOM_MAP_EXTRA_DATA.forceToPickColours then
                for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
                    if MULTIPLAYER_ROOM_MY_PLID == MULTIPLAYER_ROOM_DATA.Players[i].PLID and MULTIPLAYER_ROOM_DATA.Players[i].COLOUR == 0 then
                        OW_MULTI_SENDALLCHATMSG(loc(5069):gsub("%$", MULTIPLAYER_ROOM_DATA.Players[i].NAME) .. ' (HOST)', '#000000');
                        OW_MULTIROOM_SET_MYREADY(false);
                        return false;
                    end;
                end;
            end;
        end;
    end;

	setEnabled(menu.window_multiplayer_room.panel.changeAvatar, not ready or MULTIPLAYER_ROOM_IS_HOST);	
	OW_MULTIROOM_SET_MYREADY(ready);
end;

function showMultiplayerGame()
	IN_LOBBY = false;	
	MULTIPLAYER_ROOM_ACTIVE = true;
	MULTIPLAYER_ROOM_IS_HOST = getvalue(OWV_IAMSERVER);
	MULTIPLAYER_ROOM_IS_DEDI = getvalue(OWV_IAMDEDIHOST);

	MULTIPLAYER_ROOM_GAME_LOCKED = false;
	MULTIPLAYER_ROOM_RANDOM_POSITIONS = false;
	MULTIPLAYER_ROOM_RANDOM_COLOURS = false;
	MULTIPLAYER_ROOM_RANDOM_NATIONS = false;
	MULTIPLAYER_ROOM_LOCK_TEAMS = false;
	
	MULTIPLAYER_ROOM_START_TIMER = 5;
	MULTIPLAYER_ROOM_START_ERROR = false;
	MULTIPLAYER_ROOM_START_ERROR_MSG = '';

	setVisible(menu.window_multiplayer, false);
	setVisible(menu.window_multiplayer_room, true);

	-- set player nickname
	setText(menu.window_multiplayer_room.panel.playerName, getPlayerName());

	-- set button
	if canModifyServerSettings() then
		setEnabled(menu.window_multiplayer_room.panel.start, true);
		setText(menu.window_multiplayer_room.panel.start, loc(804));
		set_Callback(menu.window_multiplayer_room.panel.start.ID, CALLBACK_MOUSEDOWN, 'startMultiplayerGame();');
	else
		setText(menu.window_multiplayer_room.panel.start, loc(818));
		set_Callback(menu.window_multiplayer_room.panel.start.ID, CALLBACK_MOUSEDOWN, 'setReadyMultiplayerGame();');
	end;

	waitUntilMapLoaded();
end;

function waitUntilMapLoaded()
	if (MULTIPLAYER_ROOM_DATA.MAPS) then
		OW_MULTIROOM_GET_CURRENT_MAP_INFO();

		selectMap(MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX);

		return;
	end;

   	timer:single(0.1, 'waitUntilMapLoaded()');
end

function hideMultiplayerGame()
	if (not IN_LOBBY) then
		OW_ROOM_LEAVE();
	end;

	IN_LOBBY = true;	
	MULTIPLAYER_ROOM_ACTIVE = false;
	MULTIPLAYER_ROOM_INIT_PLAYERS_LIST = false;

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

	local banRandomColours = false;

	if MULTIPLAYER_ROOM_MAP_EXTRA_DATA then
		banRandomColours = MULTIPLAYER_ROOM_MAP_EXTRA_DATA.banRandomColours;
	end;

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
	--[[else
		menu.window_multiplayer_room.panel.ready = clCheckbox(
			menu.window_multiplayer_room.panel.globalSettings,
			1,
			0,
			'setReadyMultiplayerGame();',
			{
				checked = (not MULTIPLAYER_ROOM_IM_READY)
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
		);--]]
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
			disabled = not canModifyServerSettings() or banRandomColours,
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
		OW_MULTI_SENDALLCHATMSG(safeText(getText(menu.window_multiplayer_room.panel.chatInput)), '#000000'); -- getHexColour(SIDE_COLOURS[Players[MyID].Colour+1]));
		setText(menu.window_multiplayer_room.panel.chatInput, '');
		return;
	end;

	if key == VK_ESC then
		setText(menu.window_multiplayer_room.panel.chatInput, '');
		clearFocus();
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

	if (index == nil or index < 1) then
		return;
	end;

	local player = MULTIPLAYER_ROOM_DATA.Players[index].PLID;

	if (index == 1 or player == nil or player == 0) then
		return;
	end;

	OW_MULTIROOM_HOST_KICKPLAYER(player);
end;

function kickPlayerFromList(INDEX)
	if (not canModifyServerSettings()) then
		return;
	end;

	local index = parseInt(INDEX);
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
		playersList[i] = players[i].NAME .. ' (' .. players[i].PING .. ')';
	end;

	clSetListItems(menu.window_multiplayer_room.panel.page1.playerList, playersList, 0, 'kickPlayerFromList(INDEX);', {});
	--clSetListItems(menu.window_multiplayer_room.panel.page1.playerList, playersList, 0, 'selectPlayerOnPlayerList(INDEX);', {});
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

function getMultiplayerUsedPosition(PLAYER, POSITIONS)
	local result = {};


	for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
		local tmp = MULTIPLAYER_ROOM_DATA.Players[i];

		if (tmp.PLID ~= PLAYER.PLID) then
			for j = 1, #POSITIONS do
				if (tmp.SIDE > 0 and POSITIONS[j].POS == tmp.SIDE) then
					result = addToArray(result, POSITIONS[j].NAME);
				end; 
			end;
		end;
	end;

	return result;
end;

function getMultiplayerUsedColours(PLAYER)
	local result = {};

	for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
		local tmp = MULTIPLAYER_ROOM_DATA.Players[i];

		if (tmp.PLID ~= PLAYER.PLID) then
			if (tmp.COLOUR > 0) then
				result = addToArray(result, tmp.COLOUR);
			end;
		end;
	end;

	if (MULTIPLAYER_ROOM_MAP_EXTRA_DATA.banRandomColours) then
		if (not result) then
			return MULTIPLAYER_ROOM_MAP_EXTRA_DATA.banColour;
		end;

		result = joinArray(result, MULTIPLAYER_ROOM_MAP_EXTRA_DATA.banColour);
	end;

	return result;
end;

function createPlayerSlot(NUMBER)
	local posY = (NUMBER - 1) * 26;

	local slot = getElementEX(
		menu.window_multiplayer_room.panel.page1.playerSlots, 
		anchorT,
		XYWH(
			0,
			posY, 
			750,
			28
		),
		false,
		{
			texture = 'classic/edit/multiroom/player_slot.png'
		}
	);

	local texture = 'notready';

	if (NUMBER == 1) then
		texture = 'server';
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

	local slotPlayerName = getLabelEX(
		slot,
		anchorT, 
		XYWH(50, 6, 220, 14),
		nil, 
		NUMBER, 
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

	return {
		SLOT = slot.ID,
		PLID = nil,
		TEAM = nil,
		TEAMPOS = nil,
		STATUS = slotPlayerStatus.ID,
		AVATAR = slotPlayerAvatar.ID,
		AVATARNUM = 0,
		NAME = slotPlayerName.ID,
		POSITION =  nil,
		NATION = nil,
		COLOUR = nil,
		LOCK = nil,
		LOCKLABEL = nil,
		MERGE = nil
	};
end;

function updatePlayerSlot(NUMBER)
--[[
	SLOT = slot.ID,
	STATUS = slotPlayerStatus.ID,
	AVATAR = slotPlayerAvatar.ID,
	NAME = slotPlayerName.ID,
	POSITION = slotPosition.ID,
	NATION = slotNation.ID
]]--
	local s = MULTIPLAYER_ROOM_PLAYERS[NUMBER];

--[[
	  ["ISCOMP"] = false
	  ["NAME"] = $ierpek
	  ["PLID"] = 1
	  ["LOCKED"] = false
	  ["TEAMPOS"] = 0
	  ["TEAMREADY"] = false
	  ["NATION"] = 0
	  ["LASTOKTEAM"] = 0
	  ["COLOUR"] = 0
	  ["AVATARSEX"] = 0
	  ["LASTMAP"] = 9
	  ["ALIVE"] = true
	  ["TEAM"] = 0
	  ["AVATAR"] =
	  ["LASTNM"] = 7
	  ["ISSPEC"] = false
	  ["PING"] = 0
	  ["ISDEDI"] = false
	  ["READY"] = true
	  ["SIDE"] = 0
	} 
]]--
	local player = MULTIPLAYER_ROOM_DATA.Players[NUMBER];

	if (player == nil) then
		setVisible({ID = s.SLOT}, false);

		if (MULTIPLAYER_ROOM_TEAMS_INIT ~= {}) then
			setParentID(s.SLOT, MULTIPLAYER_ROOM_TEAMS_INIT.SLOT);
		end;
		
		return;
	end;

	MULTIPLAYER_ROOM_PLAYERS[NUMBER].PLID = player.PLID;
	MULTIPLAYER_ROOM_PLAYERS[NUMBER].TEAM = player.TEAM;
	MULTIPLAYER_ROOM_PLAYERS[NUMBER].TEAMPOS = player.TEAMPOS;

	if (not getVisible({ID = s.SLOT})) then
		if (MULTIPLAYER_ROOM_TEAMS_INIT ~= {}) then
			setVisible({ID = s.SLOT}, true);

			if (MULTIPLAYER_ROOM_TEAMS_INIT.SLOT ~= nil) then
				setParentID(s.SLOT, MULTIPLAYER_ROOM_TEAMS_INIT.SLOT);
			end;
		end;
	end;

	local isMySlot = MULTIPLAYER_ROOM_MY_PLID == player.PLID;
	local imHost = isMySlot and canModifyServerSettings();
	local isMerged = isMerged(MULTIPLAYER_ROOM_MY_PLID, player.TEAM, player.TEAMPOS);

	if (isMySlot) then
		if (MULTIPLAYER_ROOM_RANDOM_COLOURS) then
			OW_MULTIROOM_SET_MYCOLOUR(0);
		end;

		if (MULTIPLAYER_ROOM_RANDOM_POSITIONS) then
			OW_MULTIROOM_SET_MYSIDE(0);
		end;

		if (MULTIPLAYER_ROOM_RANDOM_NATIONS) then
			OW_MULTIROOM_SET_MYNATION(0);
		end;
	end;

	if (MULTIPLAYER_ROOM_TEAMS ~= {} and isMySlot) then
		for i = 1, #MULTIPLAYER_ROOM_TEAMS do
			-- setEnabled({ID = MULTIPLAYER_ROOM_TEAMS[i].BUTTON}, not MULTIPLAYER_ROOM_LOCK_TEAMS);

			if (player.TEAM ~= i or player.TEAMPOS == 99) then
				setText({ID = MULTIPLAYER_ROOM_TEAMS[i].BUTTON}, loc(824)); -- join
				set_Callback(MULTIPLAYER_ROOM_TEAMS[i].BUTTON, CALLBACK_MOUSECLICK, 'joinToTeam(' .. i .. ', -1);');
			else
				setText({ID = MULTIPLAYER_ROOM_TEAMS[i].BUTTON}, loc(825));
				set_Callback(MULTIPLAYER_ROOM_TEAMS[i].BUTTON, CALLBACK_MOUSECLICK, 'leaveTeam();');
			end;
		end;
	end;

	if MULTIPLAYER_ROOM_DATA.MULTIMAP.CANSPEC and #MULTIPLAYER_ROOM_DATA.TEAMDEF >= 10 then
		setVisible({ID = MULTIPLAYER_ROOM_TEAMS_SPEC.SLOT}, true);

		local children = getChildernIDs(MULTIPLAYER_ROOM_TEAMS_SPEC.SLOT);

		if (isMySlot and player.TEAMPOS == 99) then
			setText({ID = MULTIPLAYER_ROOM_TEAMS_SPEC.BUTTON}, loc(825));
			set_Callback(MULTIPLAYER_ROOM_TEAMS_SPEC.BUTTON, CALLBACK_MOUSECLICK, 'leaveTeam();');
		else
			setText({ID = MULTIPLAYER_ROOM_TEAMS_SPEC.BUTTON}, loc(824)); -- join
			set_Callback(MULTIPLAYER_ROOM_TEAMS_SPEC.BUTTON, CALLBACK_MOUSECLICK, 'joinAsSpectator();');
			setEnabled({ID = MULTIPLAYER_ROOM_TEAMS_SPEC.BUTTON}, #children < 5);
		end;
	else
		setVisible({ID = MULTIPLAYER_ROOM_TEAMS_SPEC.SLOT}, false);
	end;

	if (player.TEAM > 0 and MULTIPLAYER_ROOM_TEAMS[player.TEAM] and player.TEAMPOS < 99) then
		local team = MULTIPLAYER_ROOM_TEAMS[player.TEAM];

		setParentID(s.SLOT, team.SLOT);

		if (team ~= nil) then		
			reloadTeamContainers();
		end;

		if (s.COLOUR ~= nil) then
			sgui_delete(s.COLOUR);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].COLOUR = nil;
		end;

		if (not MULTIPLAYER_ROOM_RANDOM_COLOURS) then
			local colorPicker = clColorPicker(
				{ID = s.SLOT}, 
				isMySlot and ((not player.READY) or MULTIPLAYER_ROOM_IS_HOST), --canModifyServerSettings()),
				player.COLOUR, 
				277, 
				5, 
				getMultiplayerUsedColours(player)
			);

			MULTIPLAYER_ROOM_PLAYERS[NUMBER].COLOUR = colorPicker.ID;
		end;

		if (s.POSITION ~= nil) then
			sgui_delete(s.POSITION);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].POSITION = nil;
		end;

		if (not MULTIPLAYER_ROOM_RANDOM_POSITIONS) then
			local positions = {};
			local realIndex = 0; -- player.SIDE + 1

			for p = 1, #team.POSITIONS do
				positions = addToArray(positions, team.POSITIONS[p].NAME);

				if (player.SIDE == team.POSITIONS[p].POS) then
					realIndex = p;
				end;
			end;

			local slotPosition = clComboBox(
				{ID = s.SLOT},
				336,
				3,
				positions,
				realIndex,
				'setMyPosition(INDEX, ' .. player.TEAM .. ')',
				{
					width = 150,
					texture = 'classic/edit/combobox-short.png',
					defaultLabel = loc(809),
					disabled = (not isMySlot or (player.READY and (not canModifyServerSettings()))),
					blockElements = getMultiplayerUsedPosition(player, team.POSITIONS)
				}
			);

			MULTIPLAYER_ROOM_PLAYERS[NUMBER].POSITION = slotPosition.ID;
		end;

		if (s.NATION ~= nil) then
			sgui_delete(s.NATION);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].NATION = nil;
		end;

		if (not MULTIPLAYER_ROOM_RANDOM_NATIONS) then
			local slotNation = clComboBox(
				{ID = s.SLOT},
				488,
				3,
				team.NATIONS,
				getMultiplayerNation(player.NATION, player.SIDE),
				'setMultiplayerNation(INDEX, ' .. player.SIDE .. ');',
				{
					width = 150,
					texture = 'classic/edit/combobox-short.png',
					defaultLabel = loc(809),
					disabled = (not isMySlot or (player.READY and (not canModifyServerSettings())) or (player.SIDE == 0 and not MULTIPLAYER_ROOM_RANDOM_POSITIONS))
				}
			);

			MULTIPLAYER_ROOM_PLAYERS[NUMBER].NATION = slotNation.ID;
		end;

		if (isMySlot) then
			if (s.MERGE ~= nil) then
				sgui_delete(s.MERGE);
				MULTIPLAYER_ROOM_PLAYERS[NUMBER].MERGE = nil;
			end;

			if (s.LOCK ~= nil) then
				sgui_delete(s.LOCK);
				MULTIPLAYER_ROOM_PLAYERS[NUMBER].LOCK = nil;
			end;

			local slotPlayerLock = clCheckbox(
				{ID = s.SLOT},
				659,
				6,
				'changeLockStatus(' .. boolToStr(not player.LOCKED) .. ');',
				{
					disabled = player.READY and not imHost,
					checked = player.LOCKED,
					hint = loc(829)
				}
			);

			MULTIPLAYER_ROOM_PLAYERS[NUMBER].LOCK = slotPlayerLock.ID;

			if (s.LOCKLABEL ~= nil) then
				sgui_delete(s.LOCKLABEL);
				MULTIPLAYER_ROOM_PLAYERS[NUMBER].LOCKLABEL = nil;
			end;

			local slotPlayerLockLabel = getLabelEX(
				{ID = s.SLOT},
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

			MULTIPLAYER_ROOM_PLAYERS[NUMBER].LOCKLABEL = slotPlayerLockLabel.ID;
		else
			if (s.MERGE ~= nil) then
				sgui_delete(s.MERGE);
				MULTIPLAYER_ROOM_PLAYERS[NUMBER].MERGE = nil;
			end;

			if (isMerged) then
				local leavePlayer = clButton(
					{ID = s.SLOT},
					660, 
					5, 
					84,
					18, 
					loc(844), -- separate
					'leaveTeam();',
					{
						texture = 'classic/edit/menu_button_small_l.png',
						texture2 = 'classic/edit/menu_button_small_c.png',
						texture3 = 'classic/edit/menu_button_small_r.png'
					}
				);

				MULTIPLAYER_ROOM_PLAYERS[NUMBER].MERGE = leavePlayer.ID;
			elseif (not player.LOCKED) then
				local joinToPlayer = clButton(
					{ID = s.SLOT},
					660, 
					5, 
					84,
					18, 
					loc(839), -- join
					'joinToTeam(' .. player.TEAM .. ', ' .. player.TEAMPOS .. ');',
					{
						texture = 'classic/edit/menu_button_small_l.png',
						texture2 = 'classic/edit/menu_button_small_c.png',
						texture3 = 'classic/edit/menu_button_small_r.png'
					}
				);

				MULTIPLAYER_ROOM_PLAYERS[NUMBER].MERGE = joinToPlayer.ID;
			end;
		end;
	else
		if (player.TEAM == 0) then -- player without team
			setParentID(s.SLOT, MULTIPLAYER_ROOM_TEAMS_INIT.SLOT);
		else
			setParentID(s.SLOT, MULTIPLAYER_ROOM_TEAMS_SPEC.SLOT);
		end;

		reloadTeamContainers();

		if (s.COLOUR ~= nil) then
			sgui_delete(s.COLOUR);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].COLOUR = nil;
		end;

		if (s.POSITION ~= nil) then
			sgui_delete(s.POSITION);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].POSITION = nil;
		end;

		if (s.NATION ~= nil) then
			sgui_delete(s.NATION);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].NATION = nil;
		end;

		if (s.LOCK ~= nil) then
			sgui_delete(s.LOCK);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].LOCK = nil;
		end;

		if (s.LOCKLABEL ~= nil) then
			sgui_delete(s.LOCKLABEL);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].LOCKLABEL = nil;
		end;

		if (s.MERGE ~= nil) then
			sgui_delete(s.MERGE);
			MULTIPLAYER_ROOM_PLAYERS[NUMBER].MERGE = nil;
		end;
	end;

	-- icon (status)
	local texture = 'notready';

	if (player.PLID > 1) then
		if (player.READY) then
			texture = 'ready';
		end;

		setTexture({ID = s.STATUS}, 'classic/edit/special/' .. texture .. '.png');

		if (isMySlot) then
			MULTIPLAYER_ROOM_IM_READY = player.READY;
			set_Callback(s.STATUS, CALLBACK_MOUSEDOWN, 'setReadyMultiplayerGame();');
			-- setChecked(menu.window_multiplayer_room.panel.ready, playerData.READY);
		else
			set_Callback(s.STATUS, CALLBACK_MOUSEDOWN, '');
		end;
	end;

	-- avatar
	if (s.AVATARNUM == 0 or s.AVATARNUM ~= getAvatarID(player.PLID)) then
		local avatar = generateAvatar(
			player.PLID, 
			player.AVATAR, 
			player.AVATARSEX, 
			player.NATION
		);

		SGUI_settextureid(
			s.AVATAR, 
			avatar,
			80, 
			100, 
			80, 
			100
		);

		MULTIPLAYER_ROOM_PLAYERS[NUMBER].AVATARNUM = avatar;

		if (isMySlot) then
			set_Callback(s.AVATAR, CALLBACK_MOUSEDOWN, 'showMultiplayerAvatarGenerator();');
		else
			set_Callback(s.AVATAR, CALLBACK_MOUSEDOWN, '');
		end;
	end;

	-- name
	setText({ID = s.NAME}, player.NAME);
end;

function recreateTeams()
    clearAvatarCache();
	createPlayerView();
	createTeams(true);

	if (#MULTIPLAYER_ROOM_PLAYERS) then
		for i = 1, #MULTIPLAYER_ROOM_PLAYERS do
			setParentID(MULTIPLAYER_ROOM_PLAYERS[i].SLOT, MULTIPLAYER_ROOM_TEAMS_INIT.SLOT);
		end;
	end;
end

function refreshPlayerView()
	--local stopwatch = STOPWATCH_ADD();
	--STOPWATCH_START(stopwatch);

	if (not MULTIPLAYER_ROOM_INIT_PLAYERS_LIST) then	
		createPlayerView();
		createTeams(true);
	else
		reloadPlayerView();
		reloadTeamContainers();
	end;

	--setText(menu.window_multiplayer_room.panel.watcher3, 'C: ' .. string.format("%.18f", STOPWATCH_STOP(stopwatch)));
	--STOPWATCH_DELETE(stopwatch);
end;

function reloadTeamContainers()
	local team = MULTIPLAYER_ROOM_TEAMS_INIT;
	local children = getChildernIDs(team.SLOT);
	local absY = 0;
	local y = 0;

	if (children ~= nil) then
		for c = 1, #children do
			local child = children[c];

			if (getVisible{ID = child}) then
				if (getY({ID = child}) ~= y) then
					setY({ID = child}, y);
				end;

				if (getX({ID = child}) > 0) then
					setX({ID = child}, 0);
				end;

				y = y + 30;
				absY = absY + 30;
			end;
		end;

		setHeight({ID = team.SLOT}, y);
	else
		if (getHeight({ID = team.SLOT}) > 0) then
			setHeight({ID = team.SLOT}, 0);
		end;
	end;


	for i = 1, #MULTIPLAYER_ROOM_TEAMS do
		local team = MULTIPLAYER_ROOM_TEAMS[i];

		setY({ID = team.SLOT}, absY);

		local children = getChildernIDs(team.SLOT);
		local y = 60;

		if (children ~= nil and #children > 2) then
			-- resort by checking merge status
			local resortedChildern = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {} };

			for c = 1, #children do
				local child = children[c];
				local slot = nil;

				for k = 1, #MULTIPLAYER_ROOM_PLAYERS do
					if (MULTIPLAYER_ROOM_PLAYERS[k].SLOT == child) then
						slot = MULTIPLAYER_ROOM_PLAYERS[k];
						break;
					end;
				end;

				if (slot) then
					resortedChildern[slot.TEAMPOS + 1] = addToArray(resortedChildern[slot.TEAMPOS + 1], child);
				end;
			end;

			for c = 1, #resortedChildern do
				for k = 1, #resortedChildern[c] do
					local child = resortedChildern[c][k];

					if (child ~= team.LABEL and child ~= team.BUTTON) then
						if (getY({ID = child}) ~= y) then
							setY({ID = child}, y);
						end;

						if (k > 1) then
							setX({ID = child}, 8);
						elseif (getX({ID = child}) > 0) then
							setX({ID = child}, 0);
						end;

						y = y + 30;
					end;
				end;
			end;

			setHeight({ID = team.SLOT}, 90 + (30 * (#children - 2)));
		else
			if (getHeight({ID = team.SLOT}) > 90) then
				setHeight({ID = team.SLOT}, 90);
			end;
		end;

		absY = absY + y;
	end;

	setHeight(menu.window_multiplayer_room.panel.page1.playerSlots, absY + 10);

	local team = MULTIPLAYER_ROOM_TEAMS_SPEC;
	local children = getChildernIDs(team.SLOT);
	y = 0;

	if (children ~= nil) then
		for c = 1, #children do
			local child = children[c];

			if (getVisible{ID = child}) then
				if (getY({ID = child}) ~= y) then
					setY({ID = child}, y);
				end;

				if (c > 2 and getX({ID = child}) > 0) then
					setX({ID = child}, 0);
				end;

				y = y + 30;
			end;
		end;

		setHeight({ID = team.SLOT}, y);
	else
		if (getHeight({ID = team.SLOT}) > 0) then
			setHeight({ID = team.SLOT}, 0);
		end;
	end;
end;

function createTeams(MODE)
	if MODE then
		MULTIPLAYER_ROOM_TEAMS_INIT = {};

		setHeight(menu.window_multiplayer_room.panel.page1.playerSlots, 320);

		local teamSlot = getElementEX(
			menu.window_multiplayer_room.panel.page1.playerSlots, 
			anchorT,
			XYWH(
				2,
				0,
				750,
				90
			),
			true,
			{
				colour1 = WHITEA()
			}
		);

		MULTIPLAYER_ROOM_TEAMS_INIT = {
			SLOT = teamSlot.ID
		}
	else
		for i = 1, #MULTIPLAYER_ROOM_TEAMS do
			sgui_delete(MULTIPLAYER_ROOM_TEAMS[i].SLOT);
		end;
	end;

	if (not MULTIPLAYER_ROOM_DATA.TEAMDEF) then
		return;
	end;

	MULTIPLAYER_ROOM_TEAMS = {};

	local posY = 0;

	-- generate team names
	for i = 1, MULTIPLAYER_ROOM_DATA.TEAMDEF[1].SIDESMAX do
		posY = posY + 90;

		-- get team allowed positions
		local allowedPositions = {
			{
				NAME = loc(808),
				POS = 0 
			}
		};

		for c = 1, 8 do
			if (MULTIPLAYER_ROOM_DATA.TEAMDEF[i+1].ASSIGNED_POSITIONS[c]) then
				allowedPositions = addToArray(allowedPositions, {
					NAME = MULTIPLAYER_ROOM_DATA.SIDEDEF[c].NAME,
					POS = c
				});
			end;
		end;

		-- nations
		local allowedNations = {
			loc(809)
		};

		if (#allowedPositions > 0) then
			local nations = MULTIPLAYER_ROOM_DATA.SIDEDEF[i].NATIONS;
		
			if (nations.US) then
				allowedNations = addToArray(allowedNations, loc(810));
			end;

			if (nations.AR) then
				allowedNations = addToArray(allowedNations, loc(811));
			end;

			if (nations.RU) then
				allowedNations = addToArray(allowedNations, loc(812));
			end;
		end;

		local teamSlot = getElementEX(
			menu.window_multiplayer_room.panel.page1.playerSlots, 
			anchorT,
			XYWH(
				2,
				posY,
				750,
				90
			),
			true,
			{
				colour1 = WHITEA()
			}
		);

		local teamLabel = getLabelEX(
			teamSlot,
			anchorT, 
			XYWH(0, 10, 750, 18), 
			Tahoma_18B, 
			MULTIPLAYER_ROOM_DATA.TEAMDEF[i+1].NAME,
			{
				wordwrap = true,
				text_halign = ALIGN_MIDDLE,
				text_valign = ALIGN_TOP,
				font_colour = RGB(231, 222, 214),
				shadowtext = true
			}
		);

		local teamBtn = clButton(
			teamSlot, 
			304, 
			36, 
			150,
			18, 
			loc(824), -- join
			'joinToTeam(' .. i .. ', -1);',
			{
				texture = 'classic/edit/menu_button_small_l.png',
				texture2 = 'classic/edit/menu_button_small_c.png',
				texture3 = 'classic/edit/menu_button_small_r.png',
				anchor = anchorT
			}
		);

		MULTIPLAYER_ROOM_TEAMS[i] = {
			SLOT = teamSlot.ID,
			LABEL = teamLabel.ID,
			BUTTON = teamBtn.ID,
			POSITIONS = allowedPositions,
			NATIONS = allowedNations
		}
	end;

	local teamSlot = getElementEX(
		menu.window_multiplayer_room.panel.page1.spectatorSlots, 
		anchorT,
		XYWH(
			2,
			0,
			750,
			130
		),
		true,
		{
			colour1 = WHITEA()
		}
	);

	local teamLabel = getLabelEX(
		teamSlot, 
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
		teamSlot, 
		304, 
		26, 
		150,
		18, 
		loc(839), -- join
		'joinAsSpectator();',
		{
			texture = 'classic/edit/menu_button_small_l.png',
			texture2 = 'classic/edit/menu_button_small_c.png',
			texture3 = 'classic/edit/menu_button_small_r.png'
		}
	);

	MULTIPLAYER_ROOM_TEAMS_SPEC = {
		SLOT = teamSlot.ID,
		LABEL = teamLabel.ID,
		BUTTON = teamBtn.ID
	}
end

function createPlayerView()
	deleteSlots();

	MULTIPLAYER_ROOM_PLAYERS = {};

	for i = 1, 12 do
		MULTIPLAYER_ROOM_PLAYERS[i] = createPlayerSlot(i);
	end;

	MULTIPLAYER_ROOM_INIT_PLAYERS_LIST = true;
end;

function reloadPlayerView()
	MULTIPLAYER_ROOM_MY_PLID = MULTIPLAYER_ROOM_DATA.Players[MULTIPLAYER_ROOM_DATA.PlayerMyPos + 1].PLID;
	MULTIPLAYER_ROOM_MERGED = { 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} },  
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }, 
		{ {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} } 
	};

	for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
		local player = MULTIPLAYER_ROOM_DATA.Players[i];

		if (player.TEAM < 9 and player.TEAMPOS < 11) then
			MULTIPLAYER_ROOM_MERGED[player.TEAM + 1][player.TEAMPOS + 1] = addToArray(
				MULTIPLAYER_ROOM_MERGED[player.TEAM + 1][player.TEAMPOS + 1],
				player.PLID
			);
		end;
	end;

	for i = 1, 12 do
		updatePlayerSlot(i);
	end;

	setMapPreview();
end;

function getMultiplayerNation(NATION, POSITION)
	NATION = parseInt(NATION);
	POSITION = parseInt(POSITION);

	if MULTIPLAYER_ROOM_RANDOM_POSITIONS then
		return NATION + 1;
	end;

	if POSITION < 1 or NATION < 1 or MULTIPLAYER_ROOM_DATA.SIDEDEF[POSITION] == nil then
		return 1;
	end;

	local nations = MULTIPLAYER_ROOM_DATA.SIDEDEF[POSITION].NATIONS;

	if nations.US and nations.AR and nations.RU then
		return NATION + 1;
	end;

	if nations.US and nations.AR and NATION == 2 then
		return 3;
	end;

	if (nations.US or nations.AR) and nations.RU and NATION == 3 then
		return 3;
	end;

	if nations.US and NATION == 1 then
		return 2;
	end;

	if nations.AR and NATION == 2 then
		return 2;
	end;

	if nations.RU and NATION == 3 then
		return 2;
	end; 

	return 1;
end;

function setMultiplayerNation(INDEX, POSITION)
	INDEX = parseInt(INDEX);
	POSITION = parseInt(POSITION);

	if (MULTIPLAYER_ROOM_RANDOM_POSITIONS) then
		return OW_MULTIROOM_SET_MYNATION(INDEX - 1);
	end;
	
	local nations = MULTIPLAYER_ROOM_DATA.SIDEDEF[POSITION].NATIONS;

	if (INDEX == 1) then
		return OW_MULTIROOM_SET_MYNATION(0);
	end;

	if INDEX == 2 then
		if nations.US then
			return OW_MULTIROOM_SET_MYNATION(1);
		end;

		if nations.AR then
			return OW_MULTIROOM_SET_MYNATION(2);
		end;

		if nations.RU then
			return OW_MULTIROOM_SET_MYNATION(3);
		end;
	end;

	if INDEX == 3 then
		if nations.AR then
			return OW_MULTIROOM_SET_MYNATION(2);
		end;

		if nations.RU then
			return OW_MULTIROOM_SET_MYNATION(3);
		end;
	end;

	return OW_MULTIROOM_SET_MYNATION(3); -- RU
end;

function setMyPosition(INDEX, TEAM)
	local positions = MULTIPLAYER_ROOM_TEAMS[TEAM].POSITIONS;
	OW_MULTIROOM_SET_MYSIDE(positions[parseInt(INDEX)].POS);
end

function deleteSlots()
	MULTIPLAYER_ROOM_INIT_PLAYERS_LIST = false;

	sgui_deletechildren(menu.window_multiplayer_room.panel.page1.playerSlots.ID);
	sgui_deletechildren(menu.window_multiplayer_room.panel.page1.spectatorSlots.ID);
end;

function isMerged(PLID, TEAM, TEAMPOS)
	if (#MULTIPLAYER_ROOM_MERGED == 0) then
		return false;
	end;

	if (TEAM > 9 or TEAMPOS == 99) then
		return false;
	end;

	return inArray(MULTIPLAYER_ROOM_MERGED[TEAM + 1][TEAMPOS + 1], parseInt(PLID)) 
		and #MULTIPLAYER_ROOM_MERGED[TEAM + 1][TEAMPOS + 1] > 1;
end;

function getPlayerByPLID(plid)
	local playersCount = #MULTIPLAYER_ROOM_DATA.Players;

	if (playersCount == 0) then
		return {};
	end;

	for i = 1, playersCount do
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

function joinAsSpectator() -- 99
	if MULTIPLAYER_ROOM_DATA.TeamGame then
		OW_MULTIROOM_SET_MYTEAMANDPOS(1, 99);
	else
		OW_MULTIROOM_SET_MYTEAMANDPOS(0, 99);
	end;

	OW_MULTIROOM_SET_MYISSPEC(true);
end

function leaveTeam()
	OW_MULTIROOM_SET_MYTEAMANDPOS(0, -1);
	OW_MULTIROOM_SET_MYISSPEC(false);
	resetPlayerData(true);
end;

-- reset player data
-- resetColour : bool
function resetPlayerData(resetColour)
	if resetColour then
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

	if MULTIPLAYER_ROOM_MAP_DATA == nil then
		return;
	end;

	if MULTIPLAYER_ROOM_MAP_DATA.GAMETYPE == nil then 
		return; 
	end;

	if MULTIPLAYER_ROOM_MAP_DATA.MAP == nil then 
		return;
	end;

	local mapName = string.upper(MULTIPLAYER_ROOM_MAP_DATA.MAP);
	local gameName = string.upper(MULTIPLAYER_ROOM_MAP_DATA.GAMETYPE);

	if gameName == nil then 
		gameName = ''; 
	end;

	if mapName == nil then 
		mapName = '';
	end;

	local PATH = "missions/_Multiplayer/" .. mapName .. "/MultiDesc" .. gameName .. "";

	MULTIPLAYER_ROOM_MAP_EXTRA_DATA = LOAD_TEXT_TO_TABLE(PATH);

	if not MULTIPLAYER_ROOM_MAP_EXTRA_DATA  then
		MULTIPLAYER_ROOM_MAP_EXTRA_DATA = {};
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
			HINT = param.ITEMS.HINTS[param.VALUE + 1]
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
		'changeMultiplayerOption(%id, ' .. OPTION.ID .. ', "INDEX")',
		{
			hint = OPTION.HINT,
			disabled = MODIFIABLE
		}
	);
end;

function changeMultiplayerOption(ELEMENT, ID, INDEX)
	OW_MULTIROOM_HOST_SET_MAPPARAM(ID - 1, INDEX - 1); -- for some reason it must be -1 lol..
	MULTIPLAYER_ROOM_DATA.MULTIMAP.MAPPARAMS[parseInt(ID)].VALUE = parseInt(INDEX) - 1;
	clComboBoxChangeHint(ELEMENT, MULTIPLAYER_ROOM_DATA.MULTIMAP.MAPPARAMS[parseInt(ID)].ITEMS.HINTS[parseInt(INDEX)]);
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
		font_name = Tahoma_14,
		wordwrap = true,
		text_halign = ALIGN_LEFT,
		text_valign = ALIGN_TOP,
		scissor = true
	}
);

function setMapList(mapList, selectedMap, isHost)
	if (mapList == nil) then
		return;
	end;

	sgui_deletechildren(menu.window_multiplayer_room.panel.page3.mapComboBox.ID);

	local list = {};

	for i = 1, #mapList do
		local name = mapList[i].NAME;
		local typ = '[PvP]';
		local amount = '';
		local char = string.sub(name, 1, 1);

		if (char == 'c') then
			typ = '[COOP]';
		end;

		if (MULTIPLAYER_ROOM_MAPS_PLAYERS[name]) then
			amount = MULTIPLAYER_ROOM_MAPS_PLAYERS[name].MAX;
		end;

		if (strlen(amount) > 0) then
			list = addToArray(list, typ .. ' ' .. '(' .. amount .. ') ' .. mapList[i].NAMELOC);
		else
			list = addToArray(list, typ .. ' ' .. mapList[i].NAMELOC);
		end;
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
			trimFrom = 1,
			disabled = (not isHost)
		}
	);
end;

function setGameTypeList(INDEX, selectedGameType, isHost)
	local gameTypeList = {};
	local gameType = nil;

	if INDEX < 1 or MULTIPLAYER_ROOM_DATA.MAPS == nil or MULTIPLAYER_ROOM_DATA.MAPS[INDEX] == nil then
		return;
	end;

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
			trimFrom = 1,
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

function setMapPictureDescription()
	local picture = '';
	local mapName = nil;

	if MULTIPLAYER_ROOM_DATA.MAPS ~= nil and MULTIPLAYER_ROOM_DATA.MAPS[MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX].NAME then
		mapName = MULTIPLAYER_ROOM_DATA.MAPS[MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX].NAME;
	end;

	if mapName == nil or mapName == '' then
		picture = 'skirmish_unknown.png';
	else
		picture = '%missions%/_multiplayer/' .. mapName .. '/mappic.png'
	end;

	setTexture(menu.window_multiplayer_room.panel.page3.mapPic, picture);
	setTextureFallback(menu.window_multiplayer_room.panel.page3.mapPic, 'skirmish_unknown.png');

	if MULTIPLAYER_ROOM_DATA.MULTIMAP == nil then
		return;
	end;

	local description = SGUI_widesub(splitstringfirst(MULTIPLAYER_ROOM_DATA.MULTIMAP.DESCRIPTION, ': '), 3) .. ':\n' .. SGUI_widesub(splitstringrest(MULTIPLAYER_ROOM_DATA.MULTIMAP.DESCRIPTION, ': '), 2);
	local rules = SGUI_widesub(splitstringfirst(MULTIPLAYER_ROOM_DATA.MULTIMAP.RULES, ': '), 3) .. ':\n' .. SGUI_widesub(splitstringrest(MULTIPLAYER_ROOM_DATA.MULTIMAP.RULES, ': '), 2);

	setText(menu.window_multiplayer_room.panel.page3.description, description:gsub("%$", '\n') .. '\n\n' .. rules:gsub("%$", '\n'));
end;

function setMapPreview()
	local picture = '';
	local mapName = nil;

	if MULTIPLAYER_ROOM_DATA.MAPS ~= nil and MULTIPLAYER_ROOM_DATA.MAPS[MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX].NAME then
		mapName = MULTIPLAYER_ROOM_DATA.MAPS[MULTIPLAYER_ROOM_ACTIVE_MAP_INDEX].NAME;
	end;

	if mapName == nil or mapName == '' then
		picture = 'skirmish_unknown.png';
	else
		picture = '%missions%/_multiplayer/' .. mapName .. '/mappic.png'
	end;

	setTexture(menu.window_multiplayer_room.panel.page1.previewMap, picture);
	setTextureFallback(menu.window_multiplayer_room.panel.page1.previewMap, 'skirmish_unknown.png');

	sgui_deletechildren(menu.window_multiplayer_room.panel.page1.previewMap.ID);

	MULTIPLAYER_MINIMAP_PLAYERS = {};

	if (MULTIPLAYER_ROOM_MAP_EXTRA_DATA.mapPosSides ~= nil and MULTIPLAYER_ROOM_DATA.Players ~= nil) then
		for i = 1, #MULTIPLAYER_ROOM_DATA.Players do
			if (MULTIPLAYER_ROOM_DATA.Players[i].SIDE > 0 and MULTIPLAYER_ROOM_DATA.Players[i].SIDE <= #MULTIPLAYER_ROOM_MAP_EXTRA_DATA.mapPosSides) then
				local coord = MULTIPLAYER_ROOM_MAP_EXTRA_DATA.mapPosSides[MULTIPLAYER_ROOM_DATA.Players[i].SIDE];
				local player = MULTIPLAYER_ROOM_DATA.Players[i];

				if (MULTIPLAYER_MINIMAP_PLAYERS[coord] == nil) then
					local border = getElementEX(
						menu.window_multiplayer_room.panel.page1.previewMap,
						anchorLTRB,
						XYWH(coord.X - 26, coord.Y - 9, 52, 19),
						true,
						{
							colour1 = BLACK()
						}
					);

					local label = getLabelEX(
						border,
						anchorLTRB,
						XYWH(1, 1, 50, 16),
						nil,
						string.sub(player.NAME, 1, 1),
						{
							colour1 = MULTIPLAYER_MINIMAP_PREVIEW_TEAM[player.TEAM],
							text_halign = ALIGN_MIDDLE,
							text_valign = ALIGN_MIDDLE,
							font_colour = MULTIPLAYER_MINIMAP_PREVIEW_COLOURS[player.COLOUR],
							nomouseevent = true,
							font_name = ADMUI3L,
							scissor = true,
							wordwrap = false,
							font_style_outline = true,
		        			shadowtext = true  			
						}
					);

					MULTIPLAYER_MINIMAP_PLAYERS[coord] = label.ID;
				else
					setText({ID = MULTIPLAYER_MINIMAP_PLAYERS[coord]}, getText({ID = MULTIPLAYER_MINIMAP_PLAYERS[coord]}) .. '+' .. string.sub(player.NAME, 1, 1));
				end;
			end;
		end; 
	end;
end;

function setMultiplayerRealPosition(POSITIONS)
	MULTIPLAYER_REAL_POSITIONS = { }; 

	local pos = stringNumberToArray(POSITIONS);

	for side = 1, #pos do
		for k, v in pairs(MULTI_PLAYERINFO_CURRENT_PLID) do
			if parseInt(v.COLOUR) == side then
				MULTIPLAYER_REAL_POSITIONS[parseInt(v.PLID)] = pos[side];
			end;
		end;
	end;
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

	-- set avatartex
	for i = 1, #Players do
		if #Players[i] then
			Players[i].Avatar = fixAVATAR(Players[i].AVATAR);
			Players[i].AVATARTEX = makeAVATARTEX(0, Players[i].AVATAR, Players[i].AVATARSEX, Players[i].NATION);
		end;
	end;


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

	LockedTeams = getChecked(menu.window_multiplayer_room.panel.lockTeam);

	mapDescription(
		MultiDef.MapName.MAPLOC .. ' - ' .. MultiDef.MapName.GAMETYPELOC,
		MultiDef.MultiMap.RULES,
		'%missions%/_multiplayer/' .. mapName .. '/mappic.png',
		Players,
		copytable(MULTIPLAYER_ROOM_MAP_EXTRA_DATA.mapPosSides),
		copytable(MULTIPLAYER_ROOM_DATA.MULTIMAP.MAPPARAMS)
	);
end;

-- override functions
function init_specBars()
	local sides = {};
	local yOffSet = 0;
	local icons = {
		[1] = 'rand', 
		[2] = 'am', 
		[3] = 'ar', 
		[4] = 'ru'
	};

	for i = 1, 9 do
		sides[i] = {};
	end;

	for k, v in pairs(MULTI_PLAYERINFO_CURRENT_PLID) do
		if v.ALIVE  then
			if v.COLOUR > 0 then
				sides[v.COLOUR].nat = 'SGUI/Alien/multiplayer/Nat/'.. icons[v.NATION + 1] .. '.png';

				if sides[v.COLOUR].name then
					sides[v.COLOUR].name = sides[v.COLOUR].name .. '+' .. v.NAME;
				else
					sides[v.COLOUR].name = v.NAME;
				end;
			end;
		end;
	end;

	for i = 1, 8 do
		if sides[i].nat then
			SpecBar.bars[i].isInGame = true;
			setText(SpecBar.bars[i].l[1], sides[i].name);
			setTexture(SpecBar.bars[i].logo[1].nat, sides[i].nat);

			for k = 2, 5 do
				setTexture(SpecBar.bars[i].logo[k], 'empty.png');
				SpecBar.bars[i].logo[k].iconName = "";
				setText(SpecBar.bars[i].l[k], '');
			end;

			setY(SpecBar.bars[i], yOffSet);
			yOffSet = yOffSet + interface.current.game.ui.specbar.h;
			
		else
			SpecBar.bars[i].isInGame = false;
		end;
	end;

	if MULTI_PLAYERINFO_CURRENT_PLID[MyID].ISSPEC == true then
		showSpecBar(true);
	else
		showSpecBar(false);
	end;
end;