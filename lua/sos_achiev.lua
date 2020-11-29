-- [ID] = {}   (image of badges have to have name as achiev have ID)
--         = {name,desc,show, request progress, type of progress}
-- if show is false, desc will be hidden until achieve achievement
-- type of progress - 0 set, 1 add, 2 task   (is ignored, when request progress is 0)
TID_Achievements_Gain = 6028;
TID_ACH_TROLL = 6300;
TID_ACH_TROLL_DESC = 6301;

achievements = {
    ['ACH_TROLL'] = {
    	loc(TID_ACH_TROLL), 
    	loc(TID_ACH_TROLL_DESC),
    	false,
    	0,
    	0
    },
};

achievsCategory = {
    [1] = {'ACH_TROLL'},
};

achievsCategoryName = { 
	[1] = loc(TID_Achievements_US), 
	[2] = loc(TID_Achievements_AR), 
	[3] = loc(TID_Achievements_RU), 
	[4] = loc(TID_Achievements_Ally), 
	[5] = loc(TID_Achievements_Leg), 
	[6] = loc(TID_Achievements_ACamp), 
	[7] = loc(TID_Achievements_MP), 
	[8] = loc(TID_Achievements_Skir),
	[9] = loc(TID_Achievements_Any)
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
    XYWH(85, 24, 215, 30),
    nil,
    '',
    {
        font_colour = WHITEA(210),
        nomouseevent = true,
        font_name = Tahoma_30B,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_MIDDLE,
        scissor = true
    }
);

function displayAchivementWindow(NAME)
	if (NAME == nil) then
		return;
	end;

	setVisible(achievWindowGain, true);
	setTexture(achievWindowGain.Image, 'SGUI/Achiev/' .. NAME .. '.png');
	setText(achievWindowGain.Name, achievements[NAME][1]);
	AddEventSlideX(achievWindowGain.ID, 0, 2, nil);
	AddSingleUseTimer(4, 'hideAchievmentWindow()');
end;

function hideAchievmentWindow()
	AddEventSlideX(achievWindowGain.ID, -300, 2, 'setVisibleID(' .. achievWindowGain.ID .. ', 0);');
end;

-- events (display)
function FROMOW_SETACHIEVEMENTEX(NAME, PROGRESS)
    AchievProgress(NAME, PROGRESS);
end;

function FROMOW_SETACHIEVEMENT(NAME)
    AchievProgress(NAME, 0);
    displayAchivementWindow(NAME);
end;