-- SoS Stream Mode by Serpent
-- Idea: Jakes
-- 29-03-2021

STREAM_MODE = parseInt(MOD_DATA.Stream_Mode); -- define if stream mode is active (check mod.ini)
STREAM_MODE_BLOCK = 1;
STREAM_ITEMS_INIT_NORMAL = {
	{
		NAME = 'sRocket', ITEM_ID = 1, PROB = 15, LABEL = loc(6211),
	},
	{
		NAME = 'sSpeed', ITEM_ID = 2, PROB = 5, LABEL = loc(6213),
	},
	{
		NAME = 'sEngine', ITEM_ID = 3, PROB = 10, LABEL = loc(6212),
	},
	{
		NAME = 'sSpec', ITEM_ID = 4, PROB = 10, LABEL = loc(6210),
	},
	{
		NAME = 'sLevel', ITEM_ID = 5, PROB = 15, LABEL = loc(6217),
	},
	{
		NAME = 'sArmoury', ITEM_ID = 6, PROB = 8, LABEL = loc(6219),
	},
	{
		NAME = 'sRadar', ITEM_ID = 7, PROB = 15, LABEL = loc(6220),
	},
	{
		NAME = 'sBunker', ITEM_ID = 8, PROB = 15, LABEL = loc(6221),
	},
	{
		NAME = 'sHack', ITEM_ID = 9, PROB = 3, LABEL = loc(6222),
	},
	{
		NAME = 'sFire', ITEM_ID = 10, PROB = 20, LABEL = loc(6224),
	},
	{
		NAME = 'sRefresh', ITEM_ID = 11, PROB = 20, LABEL = loc(6226),
	},
	{
		NAME = 'sExp', ITEM_ID = 12, PROB = 10, LABEL = loc(6227),
	},
	{
		NAME = 'sDepot', ITEM_ID = 13, PROB = 5, LABEL = loc(6228),
	},
	{
		NAME = 'sFlag', ITEM_ID = 14, PROB = 5, LABEL = loc(6230),
	},
	{
		NAME = 'sKamikadze', ITEM_ID = 15, PROB = 5, LABEL = loc(6231),
	},
	{
		NAME = 'sTroll', ITEM_ID = 16, PROB = 10, LABEL = loc(6232),
	},
	{
		NAME = 'sSlow', ITEM_ID = 17, PROB = 6, LABEL = loc(6233),
	},
	{
		NAME = 'sLack', ITEM_ID = 18, PROB = 12, LABEL = loc(6234),
	},
	{
		NAME = 'sTank', ITEM_ID = 19, PROB = 5, LABEL = loc(6236),
	},
	{
		NAME = 'sRemote', ITEM_ID = 20, PROB = 3, LABEL = loc(6237),
	},
	{
		NAME = 'sPowell', ITEM_ID = 21, PROB = 8, LABEL = loc(6238),
	},
	{
		NAME = 'sTeleport', ITEM_ID = 22, PROB = 4, LABEL = loc(6241),
	},
	{
		NAME = 'sOilTower', ITEM_ID = 23, PROB = 8, LABEL = loc(6243),
	},
	{
		NAME = 'sShovel', ITEM_ID = 24, PROB = 6, LABEL = loc(6244),
	},
	{
		NAME = 'sSheik', ITEM_ID = 25, PROB = 5, LABEL = loc(6245),
	},
	{
		NAME = 'sEarthquake', ITEM_ID = 26, PROB = 10, LABEL = loc(6247),
	},
	{
		NAME = 'sAI', ITEM_ID = 27, PROB = 6, LABEL = loc(6248),
	},
	{
		NAME = 'sCargo', ITEM_ID = 28, PROB = 3, LABEL = loc(6251),
	},
	{
		NAME = 'sDLaser', ITEM_ID = 29, PROB = 10, LABEL = loc(6252),
	},
	{
		NAME = 'sExchange', ITEM_ID = 30, PROB = 5, LABEL = loc(6253),
	},
	{
		NAME = 'sFac', ITEM_ID = 31, PROB = 9, LABEL = loc(6254),
	},
	{
		NAME = 'sPower', ITEM_ID = 32, PROB = 9, LABEL = loc(6255),
	},
	{
		NAME = 'sRandom', ITEM_ID = 33, PROB = 5, LABEL = loc(6256),
	},
	{
		NAME = 'sShield', ITEM_ID = 34, PROB = 5, LABEL = loc(6258),
	},
	{
		NAME = 'sTime', ITEM_ID = 35, PROB = 5, LABEL = loc(6259),
	},
	{
		NAME = 'sTools', ITEM_ID = 36, PROB = 9, LABEL = loc(6260),
	},
};
STREAM_ITEMS_INIT_HARDCORE = {
	{
		NAME = 'sSold', ITEM_ID = 101, PROB = 6, LABEL = loc(6214),
	},
	{
		NAME = 'sDiff', ITEM_ID = 102, PROB = 6, LABEL = loc(6215),
	},
	{
		NAME = 'sFog', ITEM_ID = 103, PROB = 6, LABEL = loc(6216),
	},
	{
		NAME = 'sReset', ITEM_ID = 104, PROB = 3, LABEL = loc(6218),
	},
	{
		NAME = 'sSun', ITEM_ID = 105, PROB = 6, LABEL = loc(6223),
	},
	{
		NAME = 'sTiger', ITEM_ID = 106, PROB = 6, LABEL = loc(6225),
	},
	{
		NAME = 'sBomb', ITEM_ID = 107, PROB = 8, LABEL = loc(6229),
	},
	{
		NAME = 'sWound', ITEM_ID = 108, PROB = 6, LABEL = loc(6235),
	},
	{
		NAME = 'sBetray', ITEM_ID = 109, PROB = 6, LABEL = loc(6239),
	},
	{
		NAME = 'sContamin', ITEM_ID = 110, PROB = 8, LABEL = loc(6240),
	},
	{
		NAME = 'sOil', ITEM_ID = 111, PROB = 8, LABEL = loc(6242),
	},
	{
		NAME = 'sStu', ITEM_ID = 112, PROB = 6, LABEL = loc(6246),
	},
	{
		NAME = 'sBazooka', ITEM_ID = 113, PROB = 6, LABEL = loc(6249),
	},
	{
		NAME = 'sMortar', ITEM_ID = 114, PROB = 6, LABEL = loc(6250),
	},
	{
		NAME = 'sRanger', ITEM_ID = 115, PROB = 8, LABEL = loc(6257),
	},
	{
		NAME = 'sComputer', ITEM_ID = 116, PROB = 10, LABEL = loc(6261),
	},
	{
		NAME = 's30', ITEM_ID = 117, PROB = 6, LABEL = loc(6262),
	},
	{
		NAME = 's60', ITEM_ID = 118, PROB = 6, LABEL = loc(6263),
	}
};
STREAM_ITEMS_NORMAL = {};
STREAM_ITEMS_HARDCORE = {};
STREAM_ITEMS = {}; -- tmp list of items
STREAM_ITEMS_ACTIVE = {}; -- list of active items
STREAM_QUEUE = {}; -- queue of items
STREAM_TARGET = 0; -- selected item
STREAM_HARDCORE_MODE = 0; -- if 1 then HARDCORE items are active
STREAM_LABEL_ACTIVE = '';
STREAM_ITEMS_COUNT = 32; -- default: 32

streamPanel = getElementEX(
    nil, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = BLACKA(125)
    }
);

streamPanel.background = getElementEX(
    streamPanel, 
    anchorL, 
    XYWH(streamPanel.width / 2 - 220, streamPanel.height / 2 - 60, 440, 256), 
    true,
    {
        texture = 'SGUI/Stream/streamPanel.png',
        scissor = true
    }
);

streamPanel.activeLabel = getLabelEX(
    streamPanel.background, 
    anchorLT, 
    XYWH(20, 96, 400, 16), 
    nil, 
    '', 
    {
        nomouseevent = true,
        font_colour = RGBA(0, 0, 0, 255),
        text_halign = ALIGN_LEFT,
        font_name = BankGotic_14,
        scissor = true
    }
);

streamPanel.content = getElementEX(
    streamPanel.background, 
    anchorL, 
    XYWH(0, 21, 53 * 25, 53), 
    true,
    {
        colour1 = WHITEA()
    }
);


streamPanel.center = getElementEX(
    streamPanel.background, 
    anchorL, 
    XYWH(streamPanel.background.width / 2, 21, 2, 53), 
    true,
    {
        colour1 = RGB(0, 255, 250)
    }
);

streamPanel.run = clButton(
	streamPanel.background, 
	8, 
	122, 
	streamPanel.background.width - 14, 
	30, 
	loc(6200),
	'startStreamRoullete();', 
	{}
);

streamPanel.reset = clButton(
	streamPanel.background, 
	8, 
	153, 
	streamPanel.background.width - 14, 
	30, 
	loc(6201),
	'resetStreamRoullete();', 
	{}
);

streamPanel.hardcore = clButton(
	streamPanel.background, 
	8, 
	184, 
	streamPanel.background.width - 14, 
	30, 
	loc(6202) .. ' ' .. 'NORMAL',
	'switchStreamMode();', 
	{}
);

streamPanel.list = clButton(
	streamPanel.background, 
	8, 
	215, 
	streamPanel.background.width - 14, 
	30, 
	loc(6203),
	'showActiveList();', 
	{}
);

streamPanel.activeList = getElementEX(
    streamPanel, 
    anchorL, 
    XYWH(streamPanel.width / 2 - 240, 120, 480, 600), 
    false,
    {
        texture = 'SGUI/Stream/streamPanelActiveList.png'
    }
);

streamPanel.activeList.text = getLabelEX(
    streamPanel.activeList, 
    anchorLT, 
    XYWH(6, 1, streamPanel.activeList.width - 6, 15), 
    nil, 
    '', 
    {
        nomouseevent = true,
        wordwrap = true,
        font_colour = RGBA(0, 0, 0, 255),
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        font_name = BankGotic_14
    }
);

streamPanel.activeList.list = getScrollboxEX(
    streamPanel.activeList, 
    anchorL, 
    XYWH(10, 24, 446, 540), 
    {
        colour1 = WHITEA()
    }
);

set_Property(streamPanel.activeList.list.ID, PROP_AUTOHIDESCROLL, false);

streamPanel.activeList.scroll = clScrollBarEX2(
    streamPanel.activeList, 
    anchorTRB,
    XYWH(
        streamPanel.activeList.list.x + streamPanel.activeList.list.width + 1,
        streamPanel.activeList.list.y, 
        12, 
        streamPanel.activeList.list.height
    ),
    streamPanel.activeList.list, 
    SKINTYPE_NONE,
    false,
    {}
);

streamPanel.activeList.back = clButton(
	streamPanel.activeList, 
	12, 
	566, 
	streamPanel.activeList.width / 2 - 16, 
	30, 
	'<<<',
	'hideActiveList();', 
	{}
);

streamPanel.activeList.next = clButton(
	streamPanel.activeList, 
	streamPanel.activeList.width / 2 + 2, 
	566, 
	streamPanel.activeList.width / 2 - 16, 
	30, 
	'>>>',
	'showActivatorPanel();', 
	{}
);

streamPanel.activatorPanel = getElementEX(
    streamPanel, 
    anchorL, 
    XYWH(streamPanel.width / 2 - 160, 120, 480, 600), 
    false,
    {
        texture = 'SGUI/Stream/streamPanelActiveList.png'
    }
);

streamPanel.activatorPanel.text = getLabelEX(
    streamPanel.activatorPanel, 
    anchorLT, 
    XYWH(6, 1, streamPanel.activatorPanel.width - 6, 15), 
    nil, 
    'Activator Panel', 
    {
        nomouseevent = true,
        wordwrap = true,
        font_colour = RGBA(0, 0, 0, 255),
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        font_name = BankGotic_14
    }
);

streamPanel.activatorPanel.list = getScrollboxEX(
    streamPanel.activatorPanel, 
    anchorL, 
    XYWH(10, 24, 446, 540), 
    {
        colour1 = WHITEA()
    }
);

set_Property(streamPanel.activatorPanel.list.ID, PROP_AUTOHIDESCROLL, false);

streamPanel.activatorPanel.scroll = clScrollBarEX2(
    streamPanel.activatorPanel, 
    anchorTRB,
    XYWH(
        streamPanel.activatorPanel.list.x + streamPanel.activatorPanel.list.width + 1,
        streamPanel.activatorPanel.list.y, 
        12, 
        streamPanel.activatorPanel.list.height
    ),
    streamPanel.activatorPanel.list, 
    SKINTYPE_NONE,
    false,
    {}
);

streamPanel.activatorPanel.back = clButton(
	streamPanel.activatorPanel, 
	12, 
	566, 
	streamPanel.activatorPanel.width / 2 - 16, 
	30, 
	'<<<',
	'hideActivatorPanel();', 
	{}
);

for i = 1, #STREAM_ITEMS_INIT_NORMAL do
	clButton(
		streamPanel.activatorPanel.list, 
		0, 
		32 * (i - 1) + 6, 
		streamPanel.activatorPanel.list.width, 
		30, 
		STREAM_ITEMS_INIT_NORMAL[i].LABEL,
		'addStreamBonus(' .. STREAM_ITEMS_INIT_NORMAL[i].ITEM_ID .. ')', 
		{
			--text_halign = ALIGN_LEFT
		}
	);
end;

for i = 1, #STREAM_ITEMS_INIT_HARDCORE do
	clButton(
		streamPanel.activatorPanel.list, 
		0, 
		32 * (i + #STREAM_ITEMS_INIT_HARDCORE - 1) + 6, 
		streamPanel.activatorPanel.list.width, 
		30, 
		STREAM_ITEMS_INIT_HARDCORE[i].LABEL,
		'addStreamBonus(' .. STREAM_ITEMS_INIT_HARDCORE[i].ITEM_ID .. ')',
		{
			--text_halign = ALIGN_LEFT
		}
	);
end;

streamPanel.troll = getElementEX(
    game.ui.minimap, 
    anchorL, 
    XYWH(10, 10, 198, 159), 
    false,
    {
        texture = 'SGUI/Stream/troll.png'
    }
);

streamPanel.powell = getElementEX(
    game, 
    anchorL, 
    XYWH(getWidth(game) + 160, getHeight(game) / 2 - 174, 320, 348), 
    false,
    {
        texture = 'SGUI/Stream/powell.png'
    }
);

streamPanel.stucuk = getElementEX(
    game, 
    anchorL, 
    XYWH(getWidth(game) + 240, getHeight(game) / 2 - 240, 480, 480), 
    false,
    {
        colour1 = WHITEA()
    }
);

for i = 1, 14 do
	getElementEX(
		streamPanel.stucuk,
		anchorNone,
		XYWH(i * 40, (i % 4) * 80, 120, 166),
		true,
		{
			texture = 'SGUI/Stream/stucuk.png'
		}
	);
end;

-- stream bonuses
function displayTroll()
	setVisible(streamPanel.troll, true);
	bringToFront(streamPanel.troll);
	sound.play('Sound/Stream/TrollLaugh.wav', '', VOLUME_EFFECTS);
end;

function hideTroll()
	setVisible(streamPanel.troll, false);
end;

function displayPowell()
	setX(streamPanel.powell, getWidth(game) + 160);
	setVisible(streamPanel.powell, true);
	bringToFront(streamPanel.powell);
	sound.play('Sound/Stream/Powell.wav', '', VOLUME_SPEECH);
	AddEventSlideX(streamPanel.powell.ID, - 320, 4, 'hidePowell();');
end;

function hidePowell()
	setVisible(streamPanel.powell, false);
end;

function displayStucuk()
	setX(streamPanel.stucuk, getWidth(game) + 240);
	setVisible(streamPanel.stucuk, true);
	bringToFront(streamPanel.stucuk);
	sound.play('Sound/Stream/Stucuk.wav', '', VOLUME_SPEECH);
	AddEventSlideX(streamPanel.stucuk.ID, - 480, 4, 'hideStucuk();');
end;

function hideStucuk()
	setVisible(streamPanel.stucuk, false);
end;

function playSibBomb()
	sound.play('Sound/Stream/SibExplosion.wav', '', VOLUME_EFFECTS);
end;

function playRanger()
	sound.play('Sound/Stream/Ranger.wav', '', VOLUME_EFFECTS);
end;

function playComputer()
	sound.play('Sound/Stream/Computer.wav', '', VOLUME_EFFECTS);
end;

function earthquake(gamePos, point, lastPoint)
	local moveTo = 0;

	if (point % 2 == 0) then
		moveTo = -30;
	else
		moveTo = 30;
	end;

	if (point % 4 == 0) then
		sound.play('Sound/Stream/Earthquake.wav', '', VOLUME_EFFECTS);
	end;

	if getVisible(gamewindow.pause) then
		OW_PAUSE();
	end;

	point = point + 1;

	if (point < lastPoint) then
		AddEventSlideX(game.ID, moveTo, 0.5, 'earthquake(' .. gamePos .. ',' .. point .. ',' .. lastPoint .. ');');
	else
		AddEventSlideX(game.ID, gamePos, 0.5, '');
	end;
end;

function addStreamBonus(bonus)
	OW_CUSTOM_COMMAND(100, parseInt(bonus), parseInt(STREAM_HARDCORE_MODE));

	for i = 1, #STREAM_ITEMS do
		if (parseInt(bonus) == parseInt(STREAM_ITEMS[i].ITEM_ID)) then
			STREAM_ITEMS_ACTIVE = addToArray(STREAM_ITEMS_ACTIVE, STREAM_ITEMS[i]);
			STREAM_LABEL_ACTIVE = STREAM_ITEMS[i].LABEL;
			--table.remove(STREAM_ITEMS, i);
			break;
		end;
	end;

	saveStreamToFile();
	hideActivatorPanel();
	hideActiveList();
end;

function getStreamItemByID(ID)
	if (#STREAM_ITEMS_NORMAL > 0) then
		for i = 1, #STREAM_ITEMS_NORMAL do
			if STREAM_ITEMS_NORMAL[i].ITEM_ID == ID then
				return STREAM_ITEMS_NORMAL[i];
			end;
		end;
	end;	

	if (#STREAM_ITEMS_HARDCORE > 0) then
		for i = 1, #STREAM_ITEMS_HARDCORE do
			if STREAM_ITEMS_HARDCORE[i].ITEM_ID == ID then
				return STREAM_ITEMS_HARDCORE[i];
			end;
		end;
	end;	

	return nil;
end;

-- sail function
function getStreamItemsFromMission(normal, hardcore, active)
	local _normal = stringBitToArray(normal);
	local _hardcore = stringBitToArray(hardcore);
	local _active = stringNumberToArray(active);

	STREAM_ITEMS_NORMAL = {};
	STREAM_ITEMS_HARDCORE = {};
	STREAM_ITEMS_ACTIVE = {};

	if (#_normal > 0) then
		for i = 1, #STREAM_ITEMS_INIT_NORMAL do
			if (parseInt(_normal[i]) == 1) then
				STREAM_ITEMS_NORMAL = addToArray(STREAM_ITEMS_NORMAL, STREAM_ITEMS_INIT_NORMAL[i]);
			end;
		end;
	end;

	if (#_hardcore > 0) then		
		for i = 1, #STREAM_ITEMS_INIT_HARDCORE do
			if (parseInt(_hardcore[i]) == 1) then
				STREAM_ITEMS_HARDCORE = addToArray(STREAM_ITEMS_HARDCORE, STREAM_ITEMS_INIT_HARDCORE[i]);
			end;
		end;
	end;

	if (#_active > 0) then
		for i = 1, #_active do
			local item = getStreamItemByID(parseInt(_active[i]));

			if item then
				STREAM_ITEMS_ACTIVE = addToArray(STREAM_ITEMS_ACTIVE, item);
			end;
		end;

		saveStreamToFile();
	end;

	STREAM_MODE_BLOCK = 0;
end;

function initStreamRollete()
	STREAM_MODE_BLOCK = 1;
	STREAM_ITEMS_ACTIVE = {};

	saveStreamToFile();
	hideTroll();
end;


function startStreamRoullete()
	STREAM_MODE_BLOCK = 1;	

	setEnabled(streamPanel.run, false);
	setEnabled(streamPanel.reset, false);
	setEnabled(streamPanel.hardcore, false);
	setEnabled(streamPanel.list, false);

	STREAM_TARGET = math.random(1, #STREAM_QUEUE);

	animateRoullete(0, 0.2);
end;

function animateRoullete(point, time)
	local finalPos = 53 * #STREAM_ITEMS;
	local oneStepPos = 53;

	if (point == STREAM_TARGET) then
		sound.play('Sound/Stream/ItemSelect.wav', '', VOLUME_EFFECTS);
		showReward();
		return;
	end;

	sound.play('Sound/Stream/ItemChange.wav', '', VOLUME_EFFECTS);

	if (point % 6 == 0) then
		time = time + 0.05;
	end;

	AddEventSlideX(streamPanel.content.ID, 160 - (oneStepPos * point), time, 'animateRoullete(' .. (point + 1) .. ', '.. time .. ')');
end;

function resetStreamRoullete()
	STREAM_ITEMS_ACTIVE = {};
	newStreamInstance();
end;

function switchStreamMode()
	STREAM_HARDCORE_MODE = (STREAM_HARDCORE_MODE + 1) % 2;
	local types = {'NORMAL', 'HARDCORE'};

	setText(streamPanel.hardcore, loc(6202) .. ' ' .. types[STREAM_HARDCORE_MODE + 1]);

	newStreamInstance();
end;

function showActiveList()
	STREAM_MODE_BLOCK = 1;

	setVisible(streamPanel.background, false);
	setVisible(streamPanel.activeList, true);

	setText(streamPanel.activeList.text, loc(6204) .. ' ' .. #STREAM_ITEMS_ACTIVE);

	sgui_deletechildren(streamPanel.activeList.list.ID);

	for i = 1, #STREAM_ITEMS_ACTIVE do
		getLabelEX(
		    streamPanel.activeList.list, 
		    anchorLT, 
		    XYWH(3, (i - 1) * 32, streamPanel.activeList.list.width, 30), 
		    nil, 
		    '- ' .. STREAM_ITEMS_ACTIVE[i].LABEL, 
		    {
		        nomouseevent = true,
		        wordwrap = true,
		        font_colour = RGBA(0, 0, 0, 255),
		        text_halign = ALIGN_LEFT,
		        text_valign = ALIGN_TOP,
		        font_name = BankGotic_14
		    }
		);
	end;
end;

function hideActiveList()
	STREAM_MODE_BLOCK = 0;

	setVisible(streamPanel.background, true);
	setVisible(streamPanel.activeList, false);
end;

function showActivatorPanel()
	setVisible(streamPanel.activeList, false);
	setVisible(streamPanel.activatorPanel, true);
end;

function hideActivatorPanel()
	setVisible(streamPanel.activeList, true);
	setVisible(streamPanel.activatorPanel, false);
end;

function showReward()
	STREAM_MODE_BLOCK = 0;

	for i = 1, #STREAM_ITEMS do
		if (parseInt(STREAM_QUEUE[STREAM_TARGET].ITEM_ID) == parseInt(STREAM_ITEMS[i].ITEM_ID)) then
			STREAM_ITEMS_ACTIVE = addToArray(STREAM_ITEMS_ACTIVE, STREAM_ITEMS[i]);
			STREAM_LABEL_ACTIVE = STREAM_ITEMS[i].LABEL;
			break;
		end;
	end;

	setBorder({ID = STREAM_QUEUE[STREAM_TARGET].ID}, BORDER_TYPE_INNER, 2, RGB(0, 255, 0));
	setText(streamPanel.activeLabel, STREAM_LABEL_ACTIVE);
	setVisible(streamPanel.center, false);
	setEnabled(streamPanel.list, true);

	saveStreamToFile();

	OW_CUSTOM_COMMAND(100, parseInt(STREAM_QUEUE[STREAM_TARGET].ITEM_ID), parseInt(STREAM_HARDCORE_MODE));
end;

function showStreamPanel()
	if (not getVisible(game)) then
		setVisible(streamPanel, false);
		return;
	end;

	if (STREAM_MODE_BLOCK == 1) then
		return;
	end;

	setX(streamPanel, 0);
	setY(streamPanel, 0);
	setWidth(streamPanel, ScrWidth);
	setHeight(streamPanel, ScrHeight);

	setX(streamPanel.background, ScrWidth / 2 - 220);
	setY(streamPanel.background, ScrHeight / 2 - 128);

	setX(streamPanel.activeList, ScrWidth / 2 - 160);

	local mode = getVisible(streamPanel);

	if (not mode) then
		if not getVisible(gamewindow.pause) then
			OW_PAUSE();
		end;

		sound.play('Sound/Stream/ShowPanel.wav', '', VOLUME_EFFECTS);

		newStreamInstance();
	else
		OW_PAUSE();
	end;

	setVisible(streamPanel, (not mode));
end;

function saveStreamToFile()
	TXT = OW_TXT_CREATE();
	TXT2 = OW_TXT_CREATE();

	for i = 1, #STREAM_ITEMS_ACTIVE do
		OW_TXT_ADD(TXT, i .. '. ' .. STREAM_ITEMS_ACTIVE[i].LABEL);
		OW_TXT_ADD(TXT2, STREAM_ITEMS_ACTIVE[i].NAME);
	end;
	
	OW_TXT_SAVE(TXT, '/mods/SoS/Data/stream');
	OW_TXT_SAVE(TXT2, 'mods/SoS/Data/stream_id');

	OW_TXT_FREE(TXT); -- Free the memory
	OW_TXT_FREE(TXT2);
end;

function newStreamInstance()
	sgui_deletechildren(streamPanel.content.ID);

	setX(streamPanel.content, STREAM_ITEMS_COUNT * 10);
	
	setEnabled(streamPanel.run, true);
	setEnabled(streamPanel.reset, true);
	setEnabled(streamPanel.hardcore, true);
	
	setVisible(streamPanel.center, true);

	setText(streamPanel.activeLabel, '');	

	local tmp = {};

	if (STREAM_HARDCORE_MODE == 0) then
		tmp = STREAM_ITEMS_NORMAL;
	else
		tmp = STREAM_ITEMS_HARDCORE;
	end;

	STREAM_ITEMS = {};

	if (#tmp > 0) then
		for i = 1, #tmp do
			if not inArray(STREAM_ITEMS_ACTIVE, tmp[i]) then
				STREAM_ITEMS = addToArray(STREAM_ITEMS, tmp[i]);
			end;
		end;
	end;

	if (#STREAM_ITEMS_ACTIVE == #STREAM_ITEMS_NORMAL + #STREAM_ITEMS_HARDCORE or #STREAM_ITEMS == 0) then
		setEnabled(streamPanel.run, false);
		return;
	end;

	STREAM_QUEUE = {};

	math.randomseed(os.clock() * 100000000000);

	local i = 0;
	local j = 0;

	repeat
		local chance = math.random(1, 100);

		if (STREAM_ITEMS[j % #STREAM_ITEMS + 1].PROB > chance) then
			item = getElementEX(
			    streamPanel.content, 
			    anchorL, 
			    XYWH((53 * i), 0, 53, streamPanel.content.height), 
			    true,
			    {
			        texture = 'SGUI/Stream/Items/' .. STREAM_ITEMS[j % #STREAM_ITEMS + 1].NAME .. '.png',
			    }
			);

			STREAM_QUEUE = addToArray(STREAM_QUEUE, {
				INDEX = (j % #STREAM_ITEMS) + 1, 
				ITEM_ID = STREAM_ITEMS[j % #STREAM_ITEMS + 1].ITEM_ID,
				ID = item.ID
			});

			i = i + 1;
		end;

		j = j + 1;
	until i == STREAM_ITEMS_COUNT;
end;