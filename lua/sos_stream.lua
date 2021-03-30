-- SoS Stream Mode by Serpent
-- Idea: Jakes
-- 29-03-2021

STREAM_MODE = parseInt(MOD_DATA.Stream_Mode);
STREAM_MODE_BLOCK = 0;

streamPanel = getElementEX(
    nil, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = BLACKA(30)
    }
);

streamPanel.background = getElementEX(
    streamPanel, 
    anchorL, 
    XYWH(LayoutWidth / 2 - 220, LayoutHeight / 2 - 60, 440, 160), 
    true,
    {
        texture = 'SGUI/Stream/streamPanel.png',
        scissor = true
    }
);

streamPanel.content = getElementEX(
    streamPanel.background, 
    anchorL, 
    XYWH(240, 21, 720, 53), 
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
        colour1 = RGB(140, 132, 99)
    }
);

streamPanel.run = clButton(
	streamPanel.background, 
	8, 
	120, 
	streamPanel.background.width - 14, 
	30, 
	'Run',
	'startStreamRoullete();', 
	{}
);

function startStreamRoullete()
	STREAM_MODE_BLOCK = 1;
	setEnabled(streamPanel.run, false);
	AddEventSlideX(streamPanel.content.ID, 0, 4, 'showReward();');
end;

function showReward()
	STREAM_MODE_BLOCK = 0;
end;

function showStreamPanel()
	if (STREAM_MODE_BLOCK == 1) then
		return;
	end;

	local mode = getVisible(streamPanel);

	if (not mode) then
		newStreamInstance();
	end;

	setVisible(streamPanel, (not mode));
end;

function newStreamInstance()
	sgui_deletechildren(streamPanel.content.ID);
	setX(streamPanel.content, 240);
	setEnabled(streamPanel.run, true);

	streamPanel.content.element1 = getElementEX(
	    streamPanel.content, 
	    anchorL, 
	    XYWH(0, 0, 53, streamPanel.content.height), 
	    true,
	    {
	        texture = 'SGUI/Stream/Items/sSpec.png',
	    }
	);

	streamPanel.content.element2 = getElementEX(
	    streamPanel.content, 
	    anchorL, 
	    XYWH(70, 0, 53, streamPanel.content.height), 
	    true,
	    {
	        colour1 = RGB(0, 0, 0)
	    }
	);

	streamPanel.content.element3 = getElementEX(
	    streamPanel.content, 
	    anchorL, 
	    XYWH(140, 0, 53, streamPanel.content.height), 
	    true,
	    {
	        colour1 = RGB(0, 0, 0)
	    }
	);

	streamPanel.content.element4 = getElementEX(
	    streamPanel.content, 
	    anchorL, 
	    XYWH(210, 0, 53, streamPanel.content.height), 
	    true,
	    {
	        colour1 = RGB(0, 0, 0)
	    }
	);
end;