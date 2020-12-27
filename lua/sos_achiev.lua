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
TID_ACH_COMMANDO = 6350;
TID_ACH_COMMANDO_DESC = 6351;
TID_ACH_TANKACE = 6352;
TID_ACH_TANKACE_DESC = 6353;
TID_ACH_HITMAN = 6354;
TID_ACH_HITMAN_DESC = 6355;
TID_ACH_ASPEED_7 = 6356;
TID_ACH_ASPEED_7_DESC = 6357;
TID_ACH_HEAVYGUN = 6358;
TID_ACH_HEAVYGUN_DESC = 6359;
TID_ACH_BLITZKRIEG = 6360;
TID_ACH_BLITZKRIEG_DESC = 6361;
TID_ACH_ARMOR = 6362;
TID_ACH_ARMOR_DESC = 6363;
TID_ACH_ASPEED_8 = 6364;
TID_ACH_ASPEED_8_DESC = 6365;
TID_ACH_BULLDOZER = 6366;
TID_ACH_BULLDOZER_DESC = 6367;
TID_ACH_COUNTERSTRIKE = 6368;
TID_ACH_COUNTERSTRIKE_DESC = 6369;
TID_ACH_SIBMINE = 6370;
TID_ACH_SIBMINE_DESC = 6371;
TID_ACH_ASPEED_9 = 6372;
TID_ACH_ASPEED_9_DESC = 6373;
TID_ACH_POWER = 6374;
TID_ACH_POWER_DESC = 6375;
TID_ACH_SNIPER = 6376;
TID_ACH_SNIPER_DESC = 6377;
TID_ACH_ARCH = 6378;
TID_ACH_ARCH_DESC = 6379;
TID_ACH_ASPEED_10 = 6380;
TID_ACH_ASPEED_10_DESC = 6381;
TID_ACH_ARABTECH = 6382;
TID_ACH_ARABTECH_DESC = 6383;
TID_ACH_EAST = 6384;
TID_ACH_EAST_DESC = 6385;
TID_ACH_GENERAL = 6386;
TID_ACH_GENERAL_DESC = 6387;
TID_ACH_ASPEED_11 = 6388;
TID_ACH_ASPEED_11_DESC = 6389;


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
    ['ACH_COMMANDO'] = {
        loc(TID_ACH_COMMANDO), 
        loc(TID_ACH_COMMANDO_DESC),
        true,
        0,
        0
    },
    ['ACH_TANKACE'] = {
        loc(TID_ACH_TANKACE), 
        loc(TID_ACH_TANKACE_DESC),
        true,
        0,
        0
    },
    ['ACH_HITMAN'] = {
        loc(TID_ACH_HITMAN), 
        loc(TID_ACH_HITMAN_DESC),
        false,
        0,
        0
    },
    ['ACH_ASPEED_7'] = {
        loc(TID_ACH_ASPEED_7), 
        loc(TID_ACH_ASPEED_7_DESC),
        true,
        0,
        0
    },
    ['ACH_HEAVYGUN'] = {
        loc(TID_ACH_HEAVYGUN), 
        loc(TID_ACH_HEAVYGUN_DESC),
        true,
        0,
        0
    },
    ['ACH_BLITZKRIEG'] = {
        loc(TID_ACH_BLITZKRIEG), 
        loc(TID_ACH_BLITZKRIEG_DESC),
        false,
        0,
        0
    },
    ['ACH_ARMOR'] = {
        loc(TID_ACH_ARMOR), 
        loc(TID_ACH_ARMOR_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_8'] = {
        loc(TID_ACH_ASPEED_8), 
        loc(TID_ACH_ASPEED_8_DESC),
        true,
        0,
        0
    },
    ['ACH_BULLDOZER'] = {
        loc(TID_ACH_BULLDOZER), 
        loc(TID_ACH_BULLDOZER_DESC),
        true,
        0,
        0
    },
    ['ACH_SIBMINE'] = {
        loc(TID_ACH_SIBMINE), 
        loc(TID_ACH_SIBMINE_DESC),
        false,
        0,
        0
    },
    ['ACH_COUNTERSTRIKE'] = {
        loc(TID_ACH_COUNTERSTRIKE), 
        loc(TID_ACH_COUNTERSTRIKE_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_9'] = {
        loc(TID_ACH_ASPEED_9), 
        loc(TID_ACH_ASPEED_9_DESC),
        true,
        0,
        0
    },
    ['ACH_POWER'] = {
        loc(TID_ACH_POWER), 
        loc(TID_ACH_POWER_DESC),
        true,
        0,
        0
    },
    ['ACH_SNIPER'] = {
        loc(TID_ACH_SNIPER), 
        loc(TID_ACH_SNIPER_DESC),
        false,
        0,
        0
    },
    ['ACH_ARCH'] = {
        loc(TID_ACH_ARCH), 
        loc(TID_ACH_ARCH_DESC),
        true,
        0,
        0
    },
    ['ACH_ASPEED_10'] = {
        loc(TID_ACH_ASPEED_10), 
        loc(TID_ACH_ASPEED_10_DESC),
        true,
        0,
        0
    },
    ['ACH_ARABTECH'] = {
        loc(TID_ACH_ARABTECH), 
        loc(TID_ACH_ARABTECH_DESC),
        true,
        0,
        0
    },
    ['ACH_EAST'] = {
        loc(TID_ACH_EAST), 
        loc(TID_ACH_EAST_DESC),
        true,
        0,
        0
    },
    ['ACH_GENERAL'] = {
        loc(TID_ACH_GENERAL), 
        loc(TID_ACH_GENERAL_DESC),
        false,
        0,
        0
    },
    ['ACH_ASPEED_11'] = {
        loc(TID_ACH_ASPEED_11), 
        loc(TID_ACH_ASPEED_11_DESC),
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
        'ACH_COMMANDO',
        'ACH_TANKACE',
        'ACH_HITMAN',
        'ACH_ASPEED_7',
        'ACH_HEAVYGUN',
        'ACH_BLITZKRIEG',
        'ACH_ARMOR',
        'ACH_ASPEED_8',
        'ACH_BULLDOZER',
        'ACH_COUNTERSTRIKE',
        'ACH_SIBMINE',
        'ACH_ASPEED_9',
        'ACH_POWER',
        'ACH_SNIPER',
        'ACH_ARCH',
        'ACH_ASPEED_10',
        'ACH_ARABTECH',
        'ACH_EAST',
        'ACH_GENERAL',
        'ACH_ASPEED_11',
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
    XYWH(-300, 250, 300, 85),
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
    XYWH(-300, 336, 300, 85),
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
    XYWH(-300, 422, 300, 85),
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
--function FROMOW_SETACHIEVEMENTEX(NAME, PROGRESS)
--    AchievProgress(NAME, PROGRESS);
--end;

--function FROMOW_SETACHIEVEMENT(NAME)
--    AchievProgress(NAME, 0);
--end;

--override old!
function showAchievment(name, hidden, cP, gP)
    local y = 0;

    for i= 1, sAchievsCount + 1 do
        if (sAchievs[i] == nil) then
            y = i;
            break;
        end;
    end;

    if y > sAchievsCount then
        sAchievsCount = y;
    end;

    if cP == nil or gP == nil then
        local text = loc(TID_Achiev_Achieved);

        if not hidden then
            text = loc(TID_Achiev_HiddenAchieved);
        end;

        sAchievs[y] = createdSAchiev(y, name, text);
        displayAchivementWindow(name);         
    else
        sAchievs[y] = createdSProgresAchiev(y, name, cP, gP);
        -- displayAchivementWindow(name);
    end;
end;