-- [ID] = {}   (image of badges have to have name as achiev have ID)
--         = {name,desc,show, request progress, type of progress}
-- if show is false, desc will be hidden until achieve achievement
-- type of progress - 0 set, 1 add, 2 task   (is ignored, when request progress is 0)
TID_Achievements_Gain = 6028;
TID_ACH_TROLL = 6300;
TID_ACH_TROLL_DESC = 6301;
TID_ACH_CYRUS = 6302;
TID_ACH_CYRUS_DESC = 6303;
TID_ACH_RADIO = 6304;
TID_ACH_RADIO_DESC = 6305;
TID_ACH_ASPEED_1 = 6306;
TID_ACH_ASPEED_1_DESC = 6307;
TID_ACH_CARGO = 6308;
TID_ACH_CARGO_DESC = 6309;
TID_ACH_JERRY = 6310;
TID_ACH_JERRY_DESC = 6311;
TID_ACH_TIGER = 6312;
TID_ACH_TIGER_DESC = 6313;
TID_ACH_ASPEED_2 = 6314;
TID_ACH_ASPEED_2_DESC = 6315;
TID_ACH_AMER = 6316;
TID_ACH_AMER_DESC = 6317;
TID_ACH_FAUST = 6318;
TID_ACH_FAUST_DESC = 6319;
TID_ACH_POKR = 6320;
TID_ACH_POKR_DESC = 6321;
TID_ACH_NOSCI = 6322;
TID_ACH_NOSCI_DESC = 6323;
TID_ACH_ASPEED_3 = 6324;
TID_ACH_ASPEED_3_DESC = 6325;
TID_ACH_BASE = 6326;
TID_ACH_BASE_DESC = 6327;
TID_ACH_GUN = 6328;
TID_ACH_GUN_DESC = 6329;
TID_ACH_INFANTRY = 6330;
TID_ACH_INFANTRY_DESC = 6331;
TID_ACH_ASPEED_4 = 6332;
TID_ACH_ASPEED_4_DESC = 6333;
TID_ACH_TAME = 6334;
TID_ACH_TAME_DESC = 6335;
TID_ACH_RADAR = 6336;
TID_ACH_RADAR_DESC = 6337;
TID_ACH_APEKILLER = 6338;
TID_ACH_APEKILLER_DESC = 6339;
TID_ACH_ASPEED_5 = 6340;
TID_ACH_ASPEED_5_DESC = 6341;
TID_ACH_BASEDESTROYER = 6342;
TID_ACH_BASEDESTROYER_DESC = 6343;
TID_ACH_SURV = 6344;
TID_ACH_SURV_DESC = 6345;
TID_ACH_FULLCARGO = 6346;
TID_ACH_FULLCARGO_DESC = 6347;
TID_ACH_ASPEED_6 = 6348;
TID_ACH_ASPEED_6_DESC = 6349;

achievements = {
    ['ACH_TROLL'] = {
    	loc(TID_ACH_TROLL), 
    	loc(TID_ACH_TROLL_DESC),
    	false,
    	0,
    	0
    },
    ['ACH_CYRUS'] = {
        loc(TID_ACH_CYRUS), 
        loc(TID_ACH_CYRUS_DESC),
        true,
        0,
        0
    },
    ['ACH_RADIO'] = {
        loc(TID_ACH_RADIO), 
        loc(TID_ACH_RADIO_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_1'] = {
        loc(TID_ACH_ASPEED_1), 
        loc(TID_ACH_ASPEED_1_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_2'] = {
        loc(TID_ACH_ASPEED_2), 
        loc(TID_ACH_ASPEED_2_DESC),
        true,
        0,
        0
    },
    ['ACH_CARGO'] = {
        loc(TID_ACH_CARGO), 
        loc(TID_ACH_CARGO_DESC),
        true,
        0,
        0
    },
    ['ACH_TIGER'] = {
        loc(TID_ACH_TIGER), 
        loc(TID_ACH_TIGER_DESC),
        false,
        0,
        0
    },
    ['ACH_JERRY'] = {
        loc(TID_ACH_JERRY), 
        loc(TID_ACH_JERRY_DESC),
        true,
        0,
        0
    },
    ['ACH_AMER'] = {
        loc(TID_ACH_AMER),
        loc(TID_ACH_AMER_DESC),
        true,
        19,
        2
    },
    ['ACH_POKR'] = {
        loc(TID_ACH_POKR), 
        loc(TID_ACH_POKR_DESC),
        false,
        0,
        0
    },
    ['ACH_FAUST'] = {
        loc(TID_ACH_FAUST), 
        loc(TID_ACH_FAUST_DESC),
        true,
        0,
        0
    },
    ['ACH_NOSCI'] = {
        loc(TID_ACH_NOSCI), 
        loc(TID_ACH_NOSCI_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_3'] = {
        loc(TID_ACH_ASPEED_3), 
        loc(TID_ACH_ASPEED_3_DESC),
        true,
        0,
        0
    },
    ['ACH_BASE'] = {
        loc(TID_ACH_BASE), 
        loc(TID_ACH_BASE_DESC),
        true,
        0,
        0
    },
    ['ACH_GUN'] = {
        loc(TID_ACH_GUN), 
        loc(TID_ACH_GUN_DESC),
        false,
        0,
        0
    },
    ['ACH_INFANTRY'] = {
        loc(TID_ACH_INFANTRY), 
        loc(TID_ACH_INFANTRY_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_4'] = {
        loc(TID_ACH_ASPEED_4), 
        loc(TID_ACH_ASPEED_4_DESC),
        true,
        0,
        0
    },
    ['ACH_TAME'] = {
        loc(TID_ACH_TAME), 
        loc(TID_ACH_TAME_DESC),
        false,
        0,
        0
    },
    ['ACH_RADAR'] = {
        loc(TID_ACH_RADAR), 
        loc(TID_ACH_RADAR_DESC),
        true,
        0,
        0
    },
    ['ACH_APEKILLER'] = {
        loc(TID_ACH_APEKILLER), 
        loc(TID_ACH_APEKILLER_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_5'] = {
        loc(TID_ACH_ASPEED_5), 
        loc(TID_ACH_ASPEED_5_DESC),
        true,
        0,
        0
    },
    ['ACH_BASEDESTROYER'] = {
        loc(TID_ACH_BASEDESTROYER), 
        loc(TID_ACH_BASEDESTROYER_DESC),
        false,
        0,
        0
    },
    ['ACH_SURV'] = {
        loc(TID_ACH_SURV), 
        loc(TID_ACH_SURV_DESC),
        true,
        0,
        0
    },
    ['ACH_FULLCARGO'] = {
        loc(TID_ACH_FULLCARGO), 
        loc(TID_ACH_FULLCARGO_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_6'] = {
        loc(TID_ACH_ASPEED_6), 
        loc(TID_ACH_ASPEED_6_DESC),
        true,
        0,
        0
    },
};

achievsCategory = {
    [1] = {
        'ACH_AMER',
        'ACH_TROLL', 
        'ACH_CYRUS', 
        'ACH_RADIO', 
        'ACH_ASPEED_1',
        'ACH_TIGER',
        'ACH_JERRY',
        'ACH_CARGO',
        'ACH_ASPEED_2',
        'ACH_FAUST',
        'ACH_POKR',
        'ACH_NOSCI',
        'ACH_ASPEED_3',
        'ACH_BASE',
        'ACH_GUN',
        'ACH_INFANTRY',
        'ACH_ASPEED_4',
        'ACH_TAME',
        'ACH_RADAR',
        'ACH_APEKILLER',
        'ACH_ASPEED_5',
        'ACH_BASEDESTROYER',
        'ACH_SURV',
        'ACH_FULLCARGO',
        'ACH_ASPEED_6',
    }
};

achievsCategoryName = { 
	[1] = loc(TID_Achievements_US), 
    [2] = loc(TID_Achievements_Skir),
	--[2] = loc(TID_Achievements_AR), 
	--[3] = loc(TID_Achievements_RU), 
	--[4] = loc(TID_Achievements_Ally), 
	--[5] = loc(TID_Achievements_Leg), 
	--[6] = loc(TID_Achievements_ACamp), 
	--[7] = loc(TID_Achievements_MP), 
	--[8] = loc(TID_Achievements_Skir),
	--[9] = loc(TID_Achievements_Any)
};  


-- achiv window ingame
achievWindowGain = getElementEX(
    nil,
    anchorLT,
    XYWH(-300, 180, 300, 85),
    false,
    {
        colour1 = RGB(0, 0, 0),
        border_size = 1,
        border_type = BORDER_TYPE_INNER,
        border_colour = WHITEA(200)
    }
);

achievWindowGain.Image = getElementEX(
	achievWindowGain,
    anchorNone,
    XYWH(0, 0, 85, 85),
    true,
    {
        texture = 'SGUI/Achiev/ACH_TROLL.png'
    }
);

achievWindowGain.Text = getLabelEX(
    achievWindowGain,
    anchorNone,
    XYWH(85, 4, 215, 16),
    nil,
    loc(TID_Achievements_Gain),
    {
        font_colour = WHITEA(210),
        nomouseevent = true,
        font_name = Tahoma_16,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
        scissor = true
    }
);

achievWindowGain.Name = getLabelEX(
    achievWindowGain,
    anchorNone,
    XYWH(85, 30, 215, 16),
    nil,
    '',
    {
        font_colour = WHITEA(210),
        nomouseevent = true,
        font_name = Tahoma_16B,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_MIDDLE,
        scissor = true,
    }
);

achievWindowGain2 = getElementEX(
    nil,
    anchorLT,
    XYWH(-300, 266, 300, 85),
    false,
    {
        colour1 = RGB(0, 0, 0),
        border_size = 1,
        border_type = BORDER_TYPE_INNER,
        border_colour = WHITEA(200)
    }
);

achievWindowGain2.Image = getElementEX(
    achievWindowGain2,
    anchorNone,
    XYWH(0, 0, 85, 85),
    true,
    {
        texture = 'SGUI/Achiev/ACH_TROLL.png'
    }
);

achievWindowGain2.Text = getLabelEX(
    achievWindowGain2,
    anchorNone,
    XYWH(85, 4, 215, 16),
    nil,
    loc(TID_Achievements_Gain),
    {
        font_colour = WHITEA(210),
        nomouseevent = true,
        font_name = Tahoma_16,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
        scissor = true
    }
);

achievWindowGain2.Name = getLabelEX(
    achievWindowGain2,
    anchorNone,
    XYWH(85, 30, 215, 16),
    nil,
    '',
    {
        font_colour = WHITEA(210),
        nomouseevent = true,
        font_name = Tahoma_16B,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_MIDDLE,
        scissor = true,
    }
);

achievWindowGain3 = getElementEX(
    nil,
    anchorLT,
    XYWH(-300, 352, 300, 85),
    false,
    {
        colour1 = RGB(0, 0, 0),
        border_size = 1,
        border_type = BORDER_TYPE_INNER,
        border_colour = WHITEA(200)
    }
);

achievWindowGain3.Image = getElementEX(
    achievWindowGain3,
    anchorNone,
    XYWH(0, 0, 85, 85),
    true,
    {
        texture = 'SGUI/Achiev/ACH_TROLL.png'
    }
);

achievWindowGain3.Text = getLabelEX(
    achievWindowGain3,
    anchorNone,
    XYWH(85, 4, 215, 16),
    nil,
    loc(TID_Achievements_Gain),
    {
        font_colour = WHITEA(210),
        nomouseevent = true,
        font_name = Tahoma_16,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
        scissor = true
    }
);

achievWindowGain3.Name = getLabelEX(
    achievWindowGain3,
    anchorNone,
    XYWH(85, 30, 215, 16),
    nil,
    '',
    {
        font_colour = WHITEA(210),
        nomouseevent = true,
        font_name = Tahoma_16B,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_MIDDLE,
        scissor = true,
    }
);


function displayAchivementWindow(NAME)
	if (NAME == nil) then
		return;
	end;

    if (getX(achievWindowGain) == -300) then
    	setVisible(achievWindowGain, true);
    	setTexture(achievWindowGain.Image, 'SGUI/Achiev/' .. NAME .. '.png');
    	setText(achievWindowGain.Name, achievements[NAME][1]);
    	AddEventSlideX(achievWindowGain.ID, 0, 2, nil);
    	AddSingleUseTimer(4, 'hideAchievmentWindow(' .. achievWindowGain.ID .. ')');
    elseif (getX(achievWindowGain2) == -300) then
        setVisible(achievWindowGain2, true);
        setTexture(achievWindowGain2.Image, 'SGUI/Achiev/' .. NAME .. '.png');
        setText(achievWindowGain2.Name, achievements[NAME][1]);
        AddEventSlideX(achievWindowGain2.ID, 0, 2, nil);
        AddSingleUseTimer(4, 'hideAchievmentWindow(' .. achievWindowGain2.ID .. ')');
    else
        setVisible(achievWindowGain3, true);
        setTexture(achievWindowGain3.Image, 'SGUI/Achiev/' .. NAME .. '.png');
        setText(achievWindowGain3.Name, achievements[NAME][1]);
        AddEventSlideX(achievWindowGain3.ID, 0, 2, nil);
        AddSingleUseTimer(4, 'hideAchievmentWindow(' .. achievWindowGain3.ID .. ')');
    end;
end;

function hideAchievmentWindow(ID)
	AddEventSlideX(ID, -300, 2, 'setVisibleID(' .. ID .. ', 0);');
end;

-- events (display)
function FROMOW_SETACHIEVEMENTEX(NAME, PROGRESS)
    AchievProgress(NAME, PROGRESS);
end;

function FROMOW_SETACHIEVEMENT(NAME)
    AchievProgress(NAME, 0);
    displayAchivementWindow(NAME);
end;

--override old!
function achieveAchievment_openclose(saID,bool)
end;