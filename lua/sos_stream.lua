-- SoS Stream Mode by Serpent
-- Idea: Jakes
-- 29-03-2021

STREAM_MODE = parseInt(MOD_DATA.Stream_Mode); -- define if stream mode is active (check mod.ini)
STREAM_MODE_BLOCK = 0;
STREAM_ITEMS_INIT_NORMAL = {
	{
		NAME = 'sRocket', ITEM_ID = 1, PROB = 3, LABEL = loc(6211),
	},
	{
		NAME = 'sSpeed', ITEM_ID = 2, PROB = 10, LABEL = loc(6213),
	},
	{
		NAME = 'sEngine', ITEM_ID = 3, PROB = 10, LABEL = loc(6212),
	},
	{
		NAME = 'sSpec', ITEM_ID = 4, PROB = 5, LABEL = loc(6210),
	}
};
STREAM_ITEMS_INIT_HARDCORE = {
	{
		NAME = 'sRocket', ITEM_ID = 10, PROB = 3, LABEL = loc(6211),
	},
	{
		NAME = 'sSpeed', ITEM_ID = 11, PROB = 10, LABEL = loc(6213),
	},
};
STREAM_ITEMS = copy(STREAM_ITEMS_INIT_NORMAL, STREAM_ITEMS); -- tmp list of items
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
	{
		disabled = true
	}
);

streamPanel.activeList = getElementEX(
    streamPanel, 
    anchorL, 
    XYWH(streamPanel.width / 2 - 160, 120, 320, 600), 
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
    XYWH(10, 24, 286, 540), 
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
	16, 
	566, 
	streamPanel.activeList.width - 32, 
	30, 
	'<<<',
	'hideActiveList();', 
	{}
);


-- sail function
function initStreamRollete()
	STREAM_MODE_BLOCK = 0;
	STREAM_ITEMS_ACTIVE = {};

	if (STREAM_HARDCORE_MODE == 0) then
		STREAM_ITEMS = copy(STREAM_ITEMS_INIT_NORMAL, STREAM_ITEMS);
	else
		STREAM_ITEMS = copy(STREAM_ITEMS_INIT_HARDCORE, STREAM_ITEMS);
	end;
end;


function startStreamRoullete()
	STREAM_MODE_BLOCK = 1;	

	STREAM_TARGET = math.random(1, #STREAM_QUEUE - 1);

	for i = 1, #STREAM_ITEMS do
		if (parseInt(STREAM_QUEUE[STREAM_TARGET].ITEM_ID) == parseInt(STREAM_ITEMS[i].ITEM_ID)) then
			STREAM_ITEMS_ACTIVE = addToArray(STREAM_ITEMS_ACTIVE, STREAM_ITEMS[i]);
			STREAM_LABEL_ACTIVE = STREAM_ITEMS[i].LABEL;
			table.remove(STREAM_ITEMS, i);
			break;
		end;
	end;

	setEnabled(streamPanel.run, false);
	setEnabled(streamPanel.reset, false);
	setEnabled(streamPanel.hardcore, false);
	setEnabled(streamPanel.list, false);

	AddEventSlideX(streamPanel.content.ID, (-STREAM_TARGET * 53) + (streamPanel.background.width / 2) + math.random(11, 26), STREAM_TARGET / 2, 'showReward();');
end;

function resetStreamRoullete()
	STREAM_MODE_BLOCK = 0;
	STREAM_ITEMS_ACTIVE = {};

	if (STREAM_HARDCORE_MODE == 0) then
		STREAM_ITEMS = copy(STREAM_ITEMS_INIT_NORMAL, STREAM_ITEMS);
	else
		STREAM_ITEMS = copy(STREAM_ITEMS_INIT_HARDCORE, STREAM_ITEMS);
	end;

	OW_CUSTOM_COMMAND(100, 0, parseInt(STREAM_HARDCORE_MODE));

	newStreamInstance();
end;

function switchStreamMode()
	STREAM_HARDCORE_MODE = (STREAM_HARDCORE_MODE + 1) % 2;
	local types = {'NORMAL', 'HARDCORE'};

	setText(streamPanel.hardcore, loc(6202) .. ' ' .. types[STREAM_HARDCORE_MODE + 1]);

	if (STREAM_HARDCORE_MODE == 0) then
		STREAM_ITEMS = copy(STREAM_ITEMS_INIT_NORMAL, STREAM_ITEMS);
	else
		STREAM_ITEMS = copy(STREAM_ITEMS_INIT_HARDCORE, STREAM_ITEMS);
	end;

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
		    XYWH(3, (i - 1) * 36, streamPanel.activeList.list.width, 30), 
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

function showReward()
	STREAM_MODE_BLOCK = 0;

	setBorder({ID = STREAM_QUEUE[STREAM_TARGET].ID}, BORDER_TYPE_INNER, 2, RGB(0, 255, 0));
	setText(streamPanel.activeLabel, STREAM_LABEL_ACTIVE);
	setVisible(streamPanel.center, false);
	setEnabled(streamPanel.list, true);

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

	OW_PAUSE();

	local mode = getVisible(streamPanel);

	if (not mode) then
		newStreamInstance();
	end;

	setVisible(streamPanel, (not mode));
end;

function newStreamInstance()
	sgui_deletechildren(streamPanel.content.ID);

	setX(streamPanel.content, STREAM_ITEMS_COUNT * 10);
	
	setEnabled(streamPanel.run, true);
	setEnabled(streamPanel.reset, true);
	setEnabled(streamPanel.hardcore, true);
	
	setVisible(streamPanel.center, true);

	setText(streamPanel.activeLabel, '');	

	if (#STREAM_ITEMS <= 1) then
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