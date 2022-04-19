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
    OW_COMM_BUTTON_PRESS(
        IT_TARGETABLESAIL_NOUNIT, 
        301, 
        HUMAN_ACTIVE_NATION, 
        HUMAN_ACTIVE_CLASS, 
        HUMAN_ACTIVE_SKILL
    );
end;

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
    '(RU) Heavy M. Gun', -- 42
    '(RU) Gatling Gun', -- 43
    '(RU) Gun', -- 44
    '(RU) Rocket Launcher', -- 45
    '(RU) Heavy Gun', -- 46
    '(RU) Rocket', -- 47
    '(RU) Sib Rocket', -- 48
    '(RU) Time Lapser', -- 49
    '(RU) Cargo', -- 51
    '(RU) Crane', -- 52
    '(RU) Bulldozer', -- 53
    '(RU) Flame Thrower', -- 93
    '(RU) Radar', -- 98
};

function changeVehicleChassis(ID, INDEX)
    local CHASSIS = parseInt(INDEX);
    local LIST = {
        1, 2, 3, 4, 5, -- US
        11, 12, 13, 14, -- AR
        21, 22, 23, 24 -- RU
    };

    VEHICLE_ACTIVE_CHASSIS = LIST[CHASSIS];
end;

function changeVehicleEngine(ID, INDEX)
    VEHICLE_ACTIVE_ENGINE = parseInt(INDEX);
end;

function changeVehicleControl(ID, INDEX)
    local CONTROL = parseInt(INDEX);
    local LIST = {
        1, 2, 3, 4, 5, -- US
        11, 12, 13, 14, -- AR
        21, 22, 23, 24 -- RU
    };

    VEHICLE_ACTIVE_CONTROL = LIST[CONTROL];
end;

function changeVehicleWeapon(ID, INDEX)
    local WEAPON = parseInt(INDEX);
    local LIST = {
        2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 97, 99, -- US
        22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 91, 92, -- AR
        42, 43, 44, 45, 46, 47, 48, 49, 51, 52, 53, 93, 98 -- RU
    };

    VEHICLE_ACTIVE_WEAPON = LIST[WEAPON];
end;

function spawnVehicle()
    OW_COMM_BUTTON_PRESS(
        IT_TARGETABLESAIL_NOUNIT, 
        302, 
        VEHICLE_ACTIVE_CHASSIS, 
        VEHICLE_ACTIVE_ENGINE, 
        VEHICLE_ACTIVE_CONTROL, 
        VEHICLE_ACTIVE_WEAPON
    );
end;

BASE_ACTIVE_NATION = 1;
BASE_ACTIVE_BUILDING = 1;
BASE_BUILDING_LIST = {
    'Depot',
    'Warehouse',
    'Lab',
    'Lab (Weapon)',
    'Lab (Sib)',
    'Lab (Comp)',
    'Lab (Opto)',
    'Lab (Space)',
    'Lab (Bio)',
    'Lab (Weapon + Sib)',
    'Lab (Comp + Opto)',
    'Lab (Space + Comp)',
    'Lab (Bio + Opto)',
    'Workshop',
    'Factory',
    'Ext. Gun',
    'Ext. Cargo',
    'Ext. Radar',
    'Ext. Radio',
    'Ext. Sib',
    'Ext. Comp',
    'Ext. Track',
    'Ext. Laser',
    'Control Tower',
    'Bunker',
    'Tower',
    'Automatic Turret',
    'Armoury',
    'Barracks',
    'Solar Plant',
    'Oil Plant',
    'Sib Plant',
    'Oil Mine',
    'Sib Mine'
};

BASE_DIRECTION_TEXTURES = {
    'up-right-',
    'right-',
    'down-right-',
    'down-left-',
    'left-',
    'up-left-'
};
BASE_ACTIVE_DIRECTION_LAST = -1;
BASE_ACTIVE_DIRECTION = 0;
BASE_ACTIVE_WEAPON = 1;
BASE_WEAPON_LIST = {
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
    '(US) Artillery', -- 97
    '(AR) Ballista', -- 22
    '(AR) Light Gun', -- 23
    '(AR) Double M. Gun', -- 24
    '(AR) Gatling Gun', -- 25
    '(AR) Flame Thrower', -- 26
    '(AR) Gun', -- 27
    '(AR) Rocket Launcher', -- 28
    '(AR) Radar', -- 30
    '(AR) Mortar', -- 92,
    '(RU) Heavy M. Gun', -- 42
    '(RU) Gatling Gun', -- 43
    '(RU) Gun', -- 44
    '(RU) Rocket Launcher', -- 45
    '(RU) Heavy Gun', -- 46
    '(RU) Rocket', -- 47
    '(RU) Sib Rocket', -- 48
    '(RU) Time Lapser', -- 49
    '(RU) Flame Thrower', -- 93
    '(RU) Radar', -- 98
};

function changeBaseNation(ID, INDEX)
    BASE_ACTIVE_NATION = parseInt(INDEX);
end;

function changeBaseBuilding(ID, INDEX)
    BASE_ACTIVE_BUILDING = parseInt(INDEX);
end;

function changeBaseWeapon(ID, INDEX)
    local WEAPON = parseInt(INDEX);
    local LIST = {
        2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 97, -- US
        22, 23, 24, 25, 26, 27, 28, 30, 91, -- AR
        42, 43, 44, 45, 46, 47, 48, 49, 93, 98 -- RU
    };

    BASE_ACTIVE_WEAPON = LIST[WEAPON];
end;

function changeBaseDirection(ID, DIR)
    DIR = parseInt(DIR);
    setTextureID(BASE_ACTIVE_DIRECTION_LAST, 'SGUI/Hack/arrows/' .. BASE_DIRECTION_TEXTURES[BASE_ACTIVE_DIRECTION + 1] .. '2');
    
    BASE_ACTIVE_DIRECTION = DIR;
    BASE_ACTIVE_DIRECTION_LAST = ID;

    setTextureID(BASE_ACTIVE_DIRECTION_LAST, 'SGUI/Hack/arrows/' .. BASE_DIRECTION_TEXTURES[DIR + 1] .. '1');
end;

function spawnBuilding()
    OW_COMM_BUTTON_PRESS(
        IT_TARGETABLESAIL_NOUNIT, 
        303, 
        BASE_ACTIVE_NATION,
        BASE_ACTIVE_BUILDING,
        BASE_ACTIVE_DIRECTION,
        BASE_ACTIVE_WEAPON
    );
end;

-- behaviour functions
function teleportUnit()
    OW_COMM_BUTTON_PRESS(
        IT_TARGETABLESAIL, 
        304
    );
end;

function unitInvincible()
    OW_CUSTOM_COMMAND(101, 4);
end;

function unitInvisible()
    OW_CUSTOM_COMMAND(101, 5);
end;

function unitSide()
    OW_CUSTOM_COMMAND(101, 7);
end;

function unitLevelMax()
    OW_CUSTOM_COMMAND(101, 2);
end;

function unitYourLevelMax()
    OW_CUSTOM_COMMAND(101, 3);
end;

-- map functions
function mapFog()
    OW_CUSTOM_COMMAND(101, 8);
end;

function mapChangeSide()
    OW_CUSTOM_COMMAND(101, 6);
end;

function mapResources()
    OW_CUSTOM_COMMAND(101, 1);
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
    if (MODE == 1) then
        setVisible(game.hackPanel.vehiclePanel, true);
        setVisible(game.hackPanel.main, false);
    else
        setVisible(game.hackPanel.vehiclePanel, false);
        setVisible(game.hackPanel.main, true);
    end;
end;

function showBasePanel(MODE)
    if (MODE == 1) then
        setVisible(game.hackPanel.basePanel, true);
        setVisible(game.hackPanel.main, false);
    else
        setVisible(game.hackPanel.basePanel, false);
        setVisible(game.hackPanel.main, true);
    end;
end;

function showBehaviourPanel(MODE)
    if (MODE == 1) then
        setVisible(game.hackPanel.behavPanel, true);
        setVisible(game.hackPanel.main, false);
    else
        setVisible(game.hackPanel.behavPanel, false);
        setVisible(game.hackPanel.main, true);
    end;
end;

function showMapPanel(MODE)
    if (MODE == 1) then
        setVisible(game.hackPanel.mapPanel, true);
        setVisible(game.hackPanel.main, false);
    else
        setVisible(game.hackPanel.mapPanel, false);
        setVisible(game.hackPanel.main, true);
    end;
end;

function displayHackPanel()
    if (not getVisible(game)) then
        return;
    end;

    local MODE = getVisible(game.hackPanel);

    if (not MODE) then
        setVisible(game.hackPanel, true);
    else
        setVisible(game.hackPanel, false);
    end;
end;

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
    loc(5800), -- Choose panel
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
    loc(5801), -- Human
    'showHumanPanel(1);',
    {}
);

game.hackPanel.main.buttonVehiclePanel = clButton(
    game.hackPanel.main,
    10, 
    80, 
    280, 
    20,
    loc(5802), -- Vehicle
    'showVehiclePanel(1);',
    {}
);

game.hackPanel.main.buttonBasePanel = clButton(
    game.hackPanel.main,
    10,
    120, 
    280, 
    20,
    loc(5803), -- Base
    'showBasePanel(1);',
    {}
);

game.hackPanel.main.buttonBehaviourPanel = clButton(
    game.hackPanel.main,
    10,
    160, 
    280, 
    20,
    loc(5804), -- Behaviour
    'showBehaviourPanel(1);',
    {}
);

game.hackPanel.main.buttonMapPanel = clButton(
    game.hackPanel.main,
    10,
    200, 
    280, 
    20,
    loc(5805), -- Map
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
        colour1 = WHITEA()
    }
);

game.hackPanel.humanPanel.name = getLabelEX(
    game.hackPanel.humanPanel,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    loc(5806), -- Human Panel
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

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
    loc(5807), -- Nation
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
    loc(5808), -- Class
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
    loc(5809), -- Skill
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
    loc(5810), -- Spawn human
    'spawnHuman();',
    {}
);

game.hackPanel.humanPanel.buttonBack = clButton(
    game.hackPanel.humanPanel,
    10, 
    260, 
    280, 
    20,
    loc(5811), -- Back
    'showHumanPanel(0);',
    {}
);

-- vehicle spawn panel
game.hackPanel.vehiclePanel = getElementEX(
    game.hackPanel, 
    anchorNone, 
    XYWH(0, 30, getWidth(game.hackPanel), getHeight(game.hackPanel) - 30), 
    false,
    {
        colour1 = WHITEA()
    }
);

game.hackPanel.vehiclePanel.name = getLabelEX(
    game.hackPanel.vehiclePanel,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    loc(5812), -- Vehicle Panel
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.vehiclePanel.chassisLabel = getLabelEX(
    game.hackPanel.vehiclePanel,
    anchorT, 
    XYWH(
        10,
        30,
        240,
        14
    ), 
    nil,
    loc(5813), -- Chassis
    {
        nomouseevent = true
    }
);

game.hackPanel.vehiclePanel.chassisCombo = clComboBox(
    game.hackPanel.vehiclePanel,
    10,
    50,
    VEHICLE_CHASSIS_LIST,
    1,
    'changeVehicleChassis(%id, "INDEX")',
    {}
);

game.hackPanel.vehiclePanel.engineLabel = getLabelEX(
    game.hackPanel.vehiclePanel,
    anchorT, 
    XYWH(
        10,
        70,
        240,
        14
    ), 
    nil,
    loc(5814), -- Engine
    {
        nomouseevent = true
    }
);

game.hackPanel.vehiclePanel.engineCombo = clComboBox(
    game.hackPanel.vehiclePanel,
    10,
    90,
    VEHICLE_ENGINE_LIST,
    1,
    'changeVehicleEngine(%id, "INDEX")',
    {}
);

game.hackPanel.vehiclePanel.controlLabel = getLabelEX(
    game.hackPanel.vehiclePanel,
    anchorT, 
    XYWH(
        10,
        110,
        240,
        14
    ), 
    nil,
    loc(5815), -- Control
    {
        nomouseevent = true
    }
);

game.hackPanel.vehiclePanel.controlCombo = clComboBox(
    game.hackPanel.vehiclePanel,
    10,
    130,
    VEHICLE_CONTROL_LIST,
    1,
    'changeVehicleControl(%id, "INDEX")',
    {}
);

game.hackPanel.vehiclePanel.weaponLabel = getLabelEX(
    game.hackPanel.vehiclePanel,
    anchorT, 
    XYWH(
        10,
        150,
        240,
        14
    ), 
    nil,
    loc(5816), -- Weapon
    {
        nomouseevent = true
    }
);

game.hackPanel.vehiclePanel.weaponCombo = clComboBox(
    game.hackPanel.vehiclePanel,
    10,
    170,
    VEHICLE_WEAPON_LIST,
    1,
    'changeVehicleWeapon(%id, "INDEX")',
    {}
);

game.hackPanel.vehiclePanel.buttonSpawn = clButton(
    game.hackPanel.vehiclePanel,
    10, 
    220, 
    280, 
    20,
    loc(5817), -- Spawn vehicle
    'spawnVehicle();',
    {}
);

game.hackPanel.vehiclePanel.buttonBack = clButton(
    game.hackPanel.vehiclePanel,
    10, 
    260, 
    280, 
    20,
    loc(5811), -- Back
    'showVehiclePanel(0);',
    {}
);

-- base panel
game.hackPanel.basePanel = getElementEX(
    game.hackPanel, 
    anchorNone, 
    XYWH(0, 30, getWidth(game.hackPanel), getHeight(game.hackPanel) - 30), 
    false,
    {
        colour1 = WHITEA()
    }
);

game.hackPanel.basePanel.name = getLabelEX(
    game.hackPanel.basePanel,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    loc(5818), -- Base Panel
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.basePanel.nationLabel = getLabelEX(
    game.hackPanel.basePanel,
    anchorT, 
    XYWH(
        10,
        30,
        240,
        14
    ), 
    nil,
    loc(5807), -- Nation
    {
        nomouseevent = true
    }
);

game.hackPanel.basePanel.nationCombo = clComboBox(
    game.hackPanel.basePanel,
    10,
    50,
    HUMAN_NATION_LIST,
    1,
    'changeBaseNation(%id, "INDEX")',
    {}
);

game.hackPanel.basePanel.btypeLabel = getLabelEX(
    game.hackPanel.basePanel,
    anchorT, 
    XYWH(
        10,
        70,
        240,
        14
    ), 
    nil,
    loc(5819), -- Building
    {
        nomouseevent = true
    }
);

game.hackPanel.basePanel.btypeCombo = clComboBox(
    game.hackPanel.basePanel,
    10,
    90,
    BASE_BUILDING_LIST,
    1,
    'changeBaseBuilding(%id, "INDEX")',
    {}
);

game.hackPanel.basePanel.bweaponLabel = getLabelEX(
    game.hackPanel.basePanel,
    anchorT, 
    XYWH(
        10,
        110,
        240,
        14
    ), 
    nil,
    loc(5820), -- Weapon
    {
        nomouseevent = true
    }
);

game.hackPanel.basePanel.bweaponCombo = clComboBox(
    game.hackPanel.basePanel,
    10,
    130,
    BASE_WEAPON_LIST,
    1,
    'changeBaseWeapon(%id, "INDEX")',
    {}
);

game.hackPanel.basePanel.directionLabel = getLabelEX(
    game.hackPanel.basePanel,
    anchorT, 
    XYWH(
        10,
        150,
        240,
        14
    ), 
    nil,
    loc(5821), -- Direction
    {
        nomouseevent = true
    }
);

game.hackPanel.basePanel.direction1 = getElementEX(
    game.hackPanel.basePanel, 
    anchorNone, 
    XYWH(10, 175, 30, 30), 
    true,
    {
        texture = 'SGUI/Hack/arrows/up-right-2.png',
        callback_mousedown = 'changeBaseDirection(%id, 0);'
    }
);

game.hackPanel.basePanel.direction2 = getElementEX(
    game.hackPanel.basePanel, 
    anchorNone, 
    XYWH(50, 175, 30, 30), 
    true,
    {
        texture = 'SGUI/Hack/arrows/right-2.png',
        callback_mousedown = 'changeBaseDirection(%id, 1);'
    }
);

game.hackPanel.basePanel.direction3 = getElementEX(
    game.hackPanel.basePanel, 
    anchorNone, 
    XYWH(90, 175, 30, 30), 
    true,
    {
        texture = 'SGUI/Hack/arrows/down-right-2.png',
        callback_mousedown = 'changeBaseDirection(%id, 2);'
    }
);

game.hackPanel.basePanel.direction4 = getElementEX(
    game.hackPanel.basePanel, 
    anchorNone, 
    XYWH(130, 175, 30, 30), 
    true,
    {
        texture = 'SGUI/Hack/arrows/down-left-2.png',
        callback_mousedown = 'changeBaseDirection(%id, 3);'
    }
);

game.hackPanel.basePanel.direction5 = getElementEX(
    game.hackPanel.basePanel, 
    anchorNone, 
    XYWH(170, 175, 30, 30), 
    true,
    {
        texture = 'SGUI/Hack/arrows/left-2.png',
        callback_mousedown = 'changeBaseDirection(%id, 4);'
    }
);

game.hackPanel.basePanel.direction6 = getElementEX(
    game.hackPanel.basePanel, 
    anchorNone, 
    XYWH(210, 175, 30, 30), 
    true,
    {
        texture = 'SGUI/Hack/arrows/up-left-2.png',
        callback_mousedown = 'changeBaseDirection(%id, 5);'
    }
);

game.hackPanel.basePanel.buttonSpawn = clButton(
    game.hackPanel.basePanel,
    10, 
    220, 
    280, 
    20,
    loc(5822), -- Create building
    'spawnBuilding();',
    {}
);

game.hackPanel.basePanel.buttonBack = clButton(
    game.hackPanel.basePanel,
    10, 
    260, 
    280, 
    20,
    loc(5811), -- Back
    'showBasePanel(0);',
    {}
);

-- base panel
game.hackPanel.behavPanel = getElementEX(
    game.hackPanel, 
    anchorNone, 
    XYWH(0, 30, getWidth(game.hackPanel), getHeight(game.hackPanel) - 30), 
    false,
    {
        colour1 = WHITEA()
    }
);

game.hackPanel.behavPanel.name = getLabelEX(
    game.hackPanel.behavPanel,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    loc(5823), -- Behaviour Panel
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.behavPanel.buttonTeleport = clButton(
    game.hackPanel.behavPanel,
    10, 
    40, 
    280, 
    20,
    'Teleport',
    'teleportUnit();',
    {}
);

game.hackPanel.behavPanel.buttonInvincible = clButton(
    game.hackPanel.behavPanel,
    10, 
    70, 
    280, 
    20,
    loc(5824), -- Invincible
    'unitInvincible();',
    {}
);

game.hackPanel.behavPanel.buttonInvisible = clButton(
    game.hackPanel.behavPanel,
    10, 
    100, 
    280, 
    20,
    loc(5825), -- Invisible
    'unitInvisible();',
    {}
);

game.hackPanel.behavPanel.buttonSide = clButton(
    game.hackPanel.behavPanel,
    10, 
    130, 
    280, 
    20,
    loc(5826), -- Change Unit Side
    'unitSide();',
    {}
);

game.hackPanel.behavPanel.buttonLevel = clButton(
    game.hackPanel.behavPanel,
    10, 
    160, 
    280, 
    20,
    loc(5827), -- Set level 10 for selected units
    'unitLevelMax();',
    {}
);

game.hackPanel.behavPanel.buttonYourLevel = clButton(
    game.hackPanel.behavPanel,
    10, 
    190, 
    280, 
    20,
    loc(5828), -- Set level 10 for your units
    'unitYourLevelMax();',
    {}
);

game.hackPanel.behavPanel.buttonBack = clButton(
    game.hackPanel.behavPanel,
    10, 
    260, 
    280, 
    20,
    loc(5811), -- Back
    'showBehaviourPanel(0);',
    {}
);

-- map panel
game.hackPanel.mapPanel = getElementEX(
    game.hackPanel, 
    anchorNone, 
    XYWH(0, 30, getWidth(game.hackPanel), getHeight(game.hackPanel) - 30), 
    false,
    {
        colour1 = WHITEA()
    }
);

game.hackPanel.mapPanel.name = getLabelEX(
    game.hackPanel.mapPanel,
    anchorNone,
    XYWH(0, 10, 300, 10), 
    nil,
    loc(5829), -- Map Panel
    {
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
    }
);

game.hackPanel.mapPanel.buttonResources = clButton(
    game.hackPanel.mapPanel,
    10, 
    40, 
    280, 
    20,
    loc(5830), -- Resources
    'mapResources();',
    {}
);

game.hackPanel.mapPanel.buttonChangeSide = clButton(
    game.hackPanel.mapPanel,
    10, 
    70, 
    280, 
    20,
    loc(5831), -- Change Your Side
    'mapChangeSide();',
    {}
);

game.hackPanel.mapPanel.buttonFog = clButton(
    game.hackPanel.mapPanel,
    10, 
    100, 
    280, 
    20,
    loc(5832), -- Fog Off,
    'mapFog();',
    {}
);

game.hackPanel.mapPanel.buttonBack = clButton(
    game.hackPanel.mapPanel,
    10, 
    260, 
    280, 
    20,
    loc(5811), -- Back
    'showMapPanel(0);',
    {}
);