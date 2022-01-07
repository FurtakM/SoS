HACK_MODE = parseInt(MOD_DATA.Hack_Mode); -- define if hack mode is active (check mod.ini)

game.hackPanel = getElementEX(
    game, 
    anchorNone, 
    XYWH(0, 60, 300, 530), 
    false,
    {
        colour1 = RGB(20, 25, 30),
    }
);

game.hackPanel.name = getLabelEX(
	game.hackPanel,
	anchorNone,
	XYWH(0, 10, 300, 10), 
	nil,
	'Hack Console - by Serpent',
	{
		nomouseevent = true,
		text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
	}
);

game.hackPanel.button1 = clButton(
	game.hackPanel,
	10,
    40, 
    280, 
    20,
	'Add resources',
	'OW_CUSTOM_COMMAND(101, 1);',
    {}
);

game.hackPanel.button2 = clButton(
	game.hackPanel,
	10, 
    80, 
    280, 
    20,
	'10 level for selected units',
	'OW_CUSTOM_COMMAND(101, 2);',
    {}
);

game.hackPanel.button3 = clButton(
	game.hackPanel,
	10, 
    120,
    280, 
    20,
	'10 level for all your units',
	'OW_CUSTOM_COMMAND(101, 3);',
    {}
);

game.hackPanel.button4 = clButton(
	game.hackPanel,
	10, 
    160, 
    280, 
    20,
	'Create human',
	'showHumanPanel(1);', -- OW_CUSTOM_COMMAND(4);
    {}
);

game.hackPanel.button5 = clButton(
	game.hackPanel,
	10, 
    200, 
    280, 
    20,
	'Spawn vehicle',
	'OW_CUSTOM_COMMAND(101, 5);',
    {}
);

game.hackPanel.button11 = clButton(
    game.hackPanel,
    10, 
    240, 
    280, 
    20,
    'Spawn apeman',
    'OW_CUSTOM_COMMAND(101, 11);',
    {}
);

game.hackPanel.button6 = clButton(
	game.hackPanel,
    10, 
    280, 
    280, 
    20,
	'Set selected units invincible',
	'OW_CUSTOM_COMMAND(101, 6);',
    {}
);

game.hackPanel.button7 = clButton(
	game.hackPanel,
	10,
    320, 
    280, 
    20,
	'Set selected units invisible',
	'OW_CUSTOM_COMMAND(101, 7);',
    {}
);

game.hackPanel.button8 = clButton(
	game.hackPanel,
	10, 
    360,
    280, 
    20,
    'Change your side',
	'OW_CUSTOM_COMMAND(101, 8);',
    {}
);

game.hackPanel.button9 = clButton(
	game.hackPanel,
	10, 
    400, 
    280, 
    20,
	'Change selected units side',
	'OW_CUSTOM_COMMAND(101, 9);',
    {}
);

game.hackPanel.button10 = clButton(
	game.hackPanel,
	10, 
    440, 
    280, 
    20,
	'Fog Off',
	'OW_CUSTOM_COMMAND(101, 10);',
    {}
);

game.hackPanel.button12 = clButton(
    game.hackPanel,
    10, 
    480,
    280, 
    20,
    'Boom!',
    'OW_CUSTOM_COMMAND(101, 12);',
    {}
);

-- human spawn panel
game.hackPanel.humanPanel = getElementEX(
    game, 
    anchorNone, 
    XYWH(0, 60, 300, 530), 
    false,
    {
        colour1 = RGB(20, 25, 30),
    }
);

game.hackPanel.humanPanel.name = getLabelEX(
    game.hackPanel.humanPanel,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    'Hack Console - by Serpent\nHuman Panel',
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.humanPanel.class = getLabelEX(
    game.hackPanel.humanPanel,
    anchorNone,
    XYWH(0, 60, 140, 10), 
    nil,
    'Class: Soldier',
    {
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.humanPanel.buttonChangeClass = clButton(
    game.hackPanel.humanPanel,
    140, 
    60, 
    140, 
    20,
    'Change',
    'changeClass();',
    {}
);

HUMAN_ACTIVE_CLASS = 1;
HUMAN_ACTIVE_CLASS_INDEX = 0;
HUMAN_CLASS = {
    {
        ID = 1,
        NAME = 'Soldier'
    },
    {
        ID = 2,
        NAME = 'Engineer'
    },
    {
        ID = 3,
        NAME = 'Mechanic'
    },
    {
        ID = 4,
        NAME = 'Scientist'
    },
    {
        ID = 5,
        NAME = 'Sniper'
    },
    {
        ID = 8,
        NAME = 'Mortar'
    },
    {
        ID = 9,
        NAME = 'Bazooka'
    },
    {
        ID = 11,
        NAME = 'Sheik'
    }
}

function changeClass()
    HUMAN_ACTIVE_CLASS_INDEX = HUMAN_ACTIVE_CLASS_INDEX + 1;

    if (HUMAN_ACTIVE_CLASS_INDEX > #HUMAN_CLASS) then
        HUMAN_ACTIVE_CLASS_INDEX = 1;
    end;

    HUMAN_ACTIVE_CLASS = HUMAN_CLASS[HUMAN_ACTIVE_CLASS_INDEX].ID;

    setText(game.hackPanel.humanPanel.class, 'Class: ' .. HUMAN_CLASS[HUMAN_ACTIVE_CLASS_INDEX].NAME);
end;

game.hackPanel.humanPanel.nation = getLabelEX(
    game.hackPanel.humanPanel,
    anchorNone,
    XYWH(0, 100, 140, 10), 
    nil,
    'Nation: American',
    {
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.humanPanel.buttonChangeNation = clButton(
    game.hackPanel.humanPanel,
    140,
    100,
    140,
    20,
    'Change',
    'changeNation();',
    {}
);

HUMAN_ACTIVE_NATION = 1;
HUMAN_ACTIVE_NATION_INDEX = 0;
HUMAN_NATION = {
    {
        ID = 1,
        NAME = 'American'
    },
    {
        ID = 2,
        NAME = 'Arabian'
    },
    {
        ID = 3,
        NAME = 'Russian'
    }
}

function changeNation()
    HUMAN_ACTIVE_NATION_INDEX = HUMAN_ACTIVE_NATION_INDEX + 1;

    if (HUMAN_ACTIVE_NATION_INDEX > #HUMAN_NATION) then
        HUMAN_ACTIVE_NATION_INDEX = 1;
    end;

    HUMAN_ACTIVE_NATION = HUMAN_NATION[HUMAN_ACTIVE_NATION_INDEX].ID;

    setText(game.hackPanel.humanPanel.nation, 'Nation: ' .. HUMAN_NATION[HUMAN_ACTIVE_NATION_INDEX].NAME);
end;

game.hackPanel.humanPanel.skill = getLabelEX(
    game.hackPanel.humanPanel,
    anchorNone,
    XYWH(0, 140, 140, 10), 
    nil,
    'Skill: 0',
    {
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.humanPanel.buttonChangeNation = clButton(
    game.hackPanel.humanPanel,
    140, 
    140, 
    140, 
    20,
    'Change',
    'changeSkill();',
    {}
);

HUMAN_ACTIVE_SKILL = 0;
HUMAN_ACTIVE_SKILL_INDEX = 0;
HUMAN_SKILL = {
    {
        ID = 1,
        NAME = '0'
    },
    {
        ID = 2,
        NAME = '1'
    },
    {
        ID = 3,
        NAME = '2'
    },
    {
        ID = 4,
        NAME = '3'
    },
    {
        ID = 5,
        NAME = '4'
    },
    {
        ID = 6,
        NAME = '5'
    },
    {
        ID = 7,
        NAME = '6'
    },
    {
        ID = 8,
        NAME = '7'
    },
    {
        ID = 9,
        NAME = '8'
    },
    {
        ID = 10,
        NAME = '9'
    },
    {
        ID = 11,
        NAME = '10'
    }
}

function changeSkill()
    HUMAN_ACTIVE_SKILL_INDEX = HUMAN_ACTIVE_SKILL_INDEX + 1;

    if (HUMAN_ACTIVE_SKILL_INDEX > #HUMAN_SKILL) then
        HUMAN_ACTIVE_SKILL_INDEX = 1;
    end;

    HUMAN_ACTIVE_SKILL = HUMAN_SKILL[HUMAN_ACTIVE_SKILL_INDEX].ID - 1;

    setText(game.hackPanel.humanPanel.skill, 'Skill: ' .. HUMAN_SKILL[HUMAN_ACTIVE_SKILL_INDEX].NAME);
end;

function spawnHuman()
    -- OW_CUSTOM_COMMAND(101, 4, HUMAN_ACTIVE_NATION, HUMAN_ACTIVE_CLASS, HUMAN_ACTIVE_SKILL);
    OW_COMM_BUTTON_PRESS(IT_TARGETABLESAIL, 256);
end;

game.hackPanel.humanPanel.button1 = clButton(
    game.hackPanel.humanPanel,
    10, 
    220, 
    280, 
    20,
    'Spawn human',
    'spawnHuman();',
    {}
);

game.hackPanel.humanPanel.button2 = clButton(
    game.hackPanel.humanPanel,
    10, 
    260, 
    280, 
    20,
    'Back',
    'showHumanPanel(0);',
    {}
);

function showHumanPanel(MODE)
    if (MODE == 1) then
        setVisible(game.hackPanel.humanPanel, true);
        setVisible(game.hackPanel, false);
    else
        setVisible(game.hackPanel.humanPanel, false);
        setVisible(game.hackPanel, true);
    end;
end;


function showHackPanel()
	if (not getVisible(game)) then
		return;
	end;

	local MODE = getVisible(game.hackPanel);

	if (not MODE) then
		setVisible(game.hackPanel, true);
		setX(game.hackPanel, 0);
	else
		setVisible(game.hackPanel, false);
	end;
end;