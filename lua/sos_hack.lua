HACK_MODE = parseInt(MOD_DATA.Hack_Mode); -- define if hack mode is active (check mod.ini)

game.hackPanel = getElementEX(
    game, 
    anchorNone, 
    XYWH(0, 60, 300, 330), 
    false,
    {
        -- colour1 = RGB(20, 25, 30),
        texture = 'SGUI/Hack/hackBackground.png'
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

game.hackPanel.main = getElementEX(
    game.hackPanel, 
    anchorNone, 
    XYWH(0, 30, getWidth(game.hackPanel), getHeight(game.hackPanel) - 30), 
    true,
    {
        colour1 = WHITEA()
    }
);

game.hackPanel.main.name = getLabelEX(
    game.hackPanel.main,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    'Choose panel',
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.main.buttonHumanPanel = clButton(
    game.hackPanel.main,
    10, 
    40, 
    280, 
    20,
    'Human',
    'showHumanPanel(1);',
    {}
);

game.hackPanel.main.buttonVehiclePanel = clButton(
    game.hackPanel.main,
    10, 
    80, 
    280, 
    20,
    'Vehicle',
    'showVehiclePanel(1);',
    {}
);

game.hackPanel.main.buttonBasePanel = clButton(
    game.hackPanel.main,
    10,
    120, 
    280, 
    20,
    'Base',
    'showBasePanel(1);',
    {}
);

game.hackPanel.main.buttonBehaviourPanel = clButton(
    game.hackPanel.main,
    10,
    160, 
    280, 
    20,
    'Behaviour',
    'showBehaviourPanel(1);',
    {}
);

game.hackPanel.main.buttonMapPanel = clButton(
    game.hackPanel.main,
    10,
    200, 
    280, 
    20,
    'Map',
    'showMapPanel(1);',
    {}
);

-- human spawn panel
game.hackPanel.humanPanel = getElementEX(
    game.hackPanel, 
    anchorNone, 
    XYWH(0, 30, getWidth(game.hackPanel), getHeight(game.hackPanel) - 30), 
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
    'Human Panel',
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

HUMAN_ACTIVE_CLASS = 1;
HUMAN_CLASS_LIST = {
    'Soldier',
    'Engineer',
    'Mechanic',
    'Scientist',
    'Sniper',
    'Mortar',
    'Bazooka',
    'Sheik'
};

HUMAN_ACTIVE_NATION = 1;
HUMAN_NATION_LIST = {
    'American',
    'Arabian',
    'Russian'
};

HUMAN_ACTIVE_SKILL = 0;
HUMAN_SKILL_LIST = {
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
};

game.hackPanel.humanPanel.nationLabel = getLabelEX(
    game.hackPanel.humanPanel,
    anchorT, 
    XYWH(
        10,
        30,
        240,
        14
    ), 
    nil,
    'Nation',
    {
        nomouseevent = true
    }
);

game.hackPanel.humanPanel.nationCombo = clComboBox(
    game.hackPanel.humanPanel,
    10,
    50,
    HUMAN_NATION_LIST,
    1,
    'changeHumanNation(%id, "INDEX")',
    {}
);

game.hackPanel.humanPanel.classLabel = getLabelEX(
    game.hackPanel.humanPanel,
    anchorT, 
    XYWH(
        10,
        70,
        240,
        14
    ), 
    nil,
    'Class',
    {
        nomouseevent = true
    }
);

game.hackPanel.humanPanel.classCombo = clComboBox(
    game.hackPanel.humanPanel,
    10,
    90,
    HUMAN_CLASS_LIST,
    1,
    'changeHumanClass(%id, "INDEX")',
    {}
);

game.hackPanel.humanPanel.skillLabel = getLabelEX(
    game.hackPanel.humanPanel,
    anchorT, 
    XYWH(
        10,
        110,
        240,
        14
    ), 
    nil,
    'Skill',
    {
        nomouseevent = true
    }
);

game.hackPanel.humanPanel.skillCombo = clComboBox(
    game.hackPanel.humanPanel,
    10,
    130,
    HUMAN_SKILL_LIST,
    1,
    'changeHumanSkill(%id, "INDEX")',
    {}
);

game.hackPanel.humanPanel.buttonSpawn = clButton(
    game.hackPanel.humanPanel,
    10, 
    220, 
    280, 
    20,
    'Spawn human',
    'spawnHuman();',
    {}
);

game.hackPanel.humanPanel.buttonBack = clButton(
    game.hackPanel.humanPanel,
    10, 
    260, 
    280, 
    20,
    'Back',
    'showHumanPanel(0);',
    {}
);

function changeHumanNation(ID, INDEX)
    HUMAN_ACTIVE_NATION = parseInt(INDEX);
end;

function changeHumanClass(ID, INDEX)
    local CLASS = parseInt(INDEX);

    if (CLASS < 6) then
        HUMAN_ACTIVE_CLASS = CLASS;
    elseif (CLASS == 6) then
        HUMAN_ACTIVE_CLASS = 8; -- mortar
    elseif (CLASS == 7) then
        HUMAN_ACTIVE_CLASS = 9; -- bazooka
    else
        HUMAN_ACTIVE_CLASS = 11; -- sheik
    end;
end;

function changeHumanSkill(ID, INDEX)
    local SKILL = parseInt(INDEX);
    HUMAN_ACTIVE_SKILL = SKILL - 1;
end;

function spawnHuman()
    --OW_CUSTOM_COMMAND(101, 4, HUMAN_ACTIVE_NATION, HUMAN_ACTIVE_CLASS, HUMAN_ACTIVE_SKILL);
    OW_COMM_BUTTON_PRESS(IT_TARGETABLESAIL_NOUNIT, 301, HUMAN_ACTIVE_NATION, HUMAN_ACTIVE_CLASS, HUMAN_ACTIVE_SKILL);
end;

-- vehicle spawn panel
game.hackPanel.vehiclePanel = getElementEX(
    game.hackPanel, 
    anchorNone, 
    XYWH(0, 30, getWidth(game.hackPanel), getHeight(game.hackPanel) - 30), 
    false,
    {
        colour1 = RGB(20, 25, 30),
    }
);

game.hackPanel.vehiclePanel.name = getLabelEX(
    game.hackPanel.vehiclePanel,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    'Vehicle Panel',
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

VEHICLE_ACTIVE_CHASSIS = 1;
VEHICLE_CHASSIS_LIST = {
    '(US) Light Wheel', -- 1
    '(US) Medium Wheel', -- 2
    '(US) Medium Track', -- 3
    '(US) Heavy Track', -- 4
    '(US) Morph', -- 5
    '(AR) Hovercraft', -- 11
    '(AR) Trike', -- 12
    '(AR) Wheel', -- 13
    '(AR) Track', -- 14
    '(RU) Medium Wheel', -- 21
    '(RU) Medium Track', -- 22
    '(RU) Heavy Wheel', -- 23
    '(RU) Heavy Track' -- 24
};

VEHICLE_ACTIVE_ENGINE = 1;
VEHICLE_ENGINE_LIST = {
    'Combustion', -- 1
    'Solar', -- 2
    'Siberite' -- 3
};

VEHICLE_ACTIVE_CONTROL = 1;
VEHICLE_CONTROL_LIST = {
    'Manual', -- 1
    'Remote', -- 2
    'Computer', -- 3
    'Ape' -- 5
};

VEHICLE_ACTIVE_WEAPON = 1;
VEHICLE_WEAPON_LIST = {
    '(US) Machine Gun', -- 2
    '(US) Light Gun', -- 3
    '(US) Gatling Gun', -- 4
    '(US) Double Gun', -- 5
    '(US) Heavy Gun', -- 6
    '(US) Rocket Launcher', -- 7
    '(US) Sib Rocket', -- 8
    '(US) Laser', -- 9
    '(US) Double Laser', -- 10
    '(US) Radar', -- 11
    '(US) Cargo', -- 12
    '(US) Crane', -- 13
    '(US) Bulldozer', -- 14
    '(US) Artillery', -- 97
    '(US) Hack', -- 99
    '(AR) Ballista', -- 22
    '(AR) Light Gun', -- 23
    '(AR) Double M. Gun', -- 24
    '(AR) Gatling Gun', -- 25
    '(AR) Flame Thrower', -- 26
    '(AR) Gun', -- 27
    '(AR) Rocket Launcher', -- 28
    '(AR) Self-propelled Bomb', -- 29
    '(AR) Radar', -- 30
    '(AR) Control Tower', -- 31
    '(AR) Cargo', -- 32
    '(AR) Bio Bomb', -- 91,
    '(AR) Mortar', -- 92,
    '(RU) '
};

game.hackPanel.humanPanel.nationLabel = getLabelEX(
    game.hackPanel.humanPanel,
    anchorT, 
    XYWH(
        10,
        30,
        240,
        14
    ), 
    nil,
    'Nation',
    {
        nomouseevent = true
    }
);

game.hackPanel.humanPanel.nationCombo = clComboBox(
    game.hackPanel.humanPanel,
    10,
    50,
    HUMAN_NATION_LIST,
    1,
    'changeHumanNation(%id, "INDEX")',
    {}
);

game.hackPanel.humanPanel.classLabel = getLabelEX(
    game.hackPanel.humanPanel,
    anchorT, 
    XYWH(
        10,
        70,
        240,
        14
    ), 
    nil,
    'Class',
    {
        nomouseevent = true
    }
);

game.hackPanel.humanPanel.classCombo = clComboBox(
    game.hackPanel.humanPanel,
    10,
    90,
    HUMAN_CLASS_LIST,
    1,
    'changeHumanClass(%id, "INDEX")',
    {}
);

game.hackPanel.humanPanel.skillLabel = getLabelEX(
    game.hackPanel.humanPanel,
    anchorT, 
    XYWH(
        10,
        110,
        240,
        14
    ), 
    nil,
    'Skill',
    {
        nomouseevent = true
    }
);

game.hackPanel.humanPanel.skillCombo = clComboBox(
    game.hackPanel.humanPanel,
    10,
    130,
    HUMAN_SKILL_LIST,
    1,
    'changeHumanSkill(%id, "INDEX")',
    {}
);

game.hackPanel.humanPanel.buttonSpawn = clButton(
    game.hackPanel.humanPanel,
    10, 
    220, 
    280, 
    20,
    'Spawn human',
    'spawnHuman();',
    {}
);

game.hackPanel.humanPanel.buttonBack = clButton(
    game.hackPanel.humanPanel,
    10, 
    260, 
    280, 
    20,
    'Back',
    'showHumanPanel(0);',
    {}
);

function changeHumanNation(ID, INDEX)
    HUMAN_ACTIVE_NATION = parseInt(INDEX);
end;

function changeHumanClass(ID, INDEX)
    local CLASS = parseInt(INDEX);

    if (CLASS < 6) then
        HUMAN_ACTIVE_CLASS = CLASS;
    elseif (CLASS == 6) then
        HUMAN_ACTIVE_CLASS = 8; -- mortar
    elseif (CLASS == 7) then
        HUMAN_ACTIVE_CLASS = 9; -- bazooka
    else
        HUMAN_ACTIVE_CLASS = 11; -- sheik
    end;
end;

function changeHumanSkill(ID, INDEX)
    local SKILL = parseInt(INDEX);
    HUMAN_ACTIVE_SKILL = SKILL - 1;
end;

function spawnHuman()
    --OW_CUSTOM_COMMAND(101, 4, HUMAN_ACTIVE_NATION, HUMAN_ACTIVE_CLASS, HUMAN_ACTIVE_SKILL);
    OW_COMM_BUTTON_PRESS(IT_TARGETABLESAIL_NOUNIT, 301, HUMAN_ACTIVE_NATION, HUMAN_ACTIVE_CLASS, HUMAN_ACTIVE_SKILL);
end;


-- main functions
function showHumanPanel(MODE)
    if (MODE == 1) then
        setVisible(game.hackPanel.humanPanel, true);
        setVisible(game.hackPanel.main, false);
    else
        setVisible(game.hackPanel.humanPanel, false);
        setVisible(game.hackPanel.main, true);
    end;
end;

function showVehiclePanel(MODE)

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