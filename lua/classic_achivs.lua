--[[
    Author: Serpent
    06-2020
--]]

-- functions
function showAchivs(mode)
    if mode > 0 then
        -- categories
        achivCategoryclButton(10, 30, loc(TID_Main_Menu_AllAchivs), 'displayAchivsByCategory(0)', 0);

        -- achievsCategoryName = { [1] = loc(TID_Achievements_US), [2] = loc(TID_Achievements_AR), [3] = loc(TID_Achievements_RU), [4] = loc(TID_Achievements_Ally), [5] = loc(TID_Achievements_Leg), [6] = loc(TID_Achievements_ACamp), [7] = loc(TID_Achievements_MP), [8] = loc(TID_Achievements_Skir) ,[9] = loc
        for i = 1, table.getn(achievsCategoryName) do
            achivCategoryclButton(10, 30 + i * 40, achievsCategoryName[i], 'displayAchivsByCategory(' .. i .. ')', i);
        end;

        displayAchivsByCategory(0);

        showMenuButton(0);
        setVisible(menu.window_achivs, true);
    else
        showMenuButton(1);
        setVisible(menu.window_achivs, false);
    end;
end;

function displayAchivsByCategory(category)
    local imgsize = 96;

    index = 0;

    sgui_deletechildren(menu.window_achivs.panel.scroll.ID);

    achievAllGained = 0;
    achievAllTotal = 0;
    achievGained = 0;
    achievTotal = 0;

    for i, _ in pairs(achievsCategory) do
        local categoryCount = 0;

        if (category == 0 or category == i) then
            categoryCount = table.getn(achievsCategory[i]);
        end;

        if categoryCount > 0 then
            for j, k in pairs(achievsCategory[i]) do
                achieved = checkAchieved(k, true);
                achievAllTotal = achievAllTotal + 1;

                if achieved then
                    achievAllGained = achievAllGained + 1;
                end;

                if (i == category) then
                    achievTotal = achievTotal + 1;
                    
                    if achieved then
                        achievGained = achievGained + 1;
                    end;
                end;

           		menu.window_achivs.panel.scroll.row = getElementEX(
                    menu.window_achivs.panel.scroll, 
                    anchorL, 
                    XYWH(5, index * 120, 710, 120), 
                    true,
                    {
                       texture = 'classic/edit/achiv_seg.png'
                    }
                );

                menu.window_achivs.panel.scroll.row.title = getLabelEX(
                    menu.window_achivs.panel.scroll.row,
                    anchorLT,
                    XYWH(122, 12, 405, 40),
                    Tahoma_16B, 
                    achievements[k][1],
                    {
                        font_colour = RGBA(231, 222, 214, 255),
                        shadowtext = true,
                        nomouseevent = true,
                        text_halign = ALIGN_LEFT,
                        text_valign = ALIGN_TOP,
                        wordwrap = true
                    }
                );

                menu.window_achivs.panel.scroll.row.category = getLabelEX(
                    menu.window_achivs.panel.scroll.row,
                    anchorLT,
                    XYWH(122, 30, 205, 20),
                    Tahoma_10,
                    achievsCategoryName[i],
                    {
                        font_colour = RGBA(231, 222, 214, 255),
                        shadowtext = true,
                        nomouseevent = true,
                        text_halign = ALIGN_LEFT,
                        text_valign = ALIGN_TOP,
                        wordwrap = false
                    }
                );

                local desc = loc(TID_Achiev_Hidden);

                -- desc will be hidden until achieve achievement
                if (achievements[k][3] or achieved) then
                    desc = achievements[k][2];
                end;

           		menu.window_achivs.panel.scroll.row.desc = getLabelEX(
                    menu.window_achivs.panel.scroll.row,
                    anchorLT,
                    XYWH(130, 48, 605, 30),
                    BankGotic_14, 
                    desc,
    				{
                        font_colour = BLACK(200),
                        nomouseevent = true,
                        shadowtext = false,
                        text_halign = ALIGN_LEFT,
                        text_valign = ALIGN_TOP,
                        wordwrap = true
                    }
                );

                local achivImageColor = WHITE();

                if (not achieved) then
                    achivImageColor = BLACK();
                end; 

           		menu.window_achivs.panel.scroll.row.img = getImageEX(
                    menu.window_achivs.panel.scroll.row,
                    anchorLT,
                    XYWH(18, 14, imgsize, imgsize),
                    true,
                    false,
           			{
                        nomouseevent = true,
                        colour1 = achCol,
                        texture_fallback = 'sgui/achiev/fallback.png',
                        texture = 'sgui/achiev/' .. k .. '.png',
                        colour1 = achivImageColor
                    }
                );

                -- check progress
                local currentProgress = 0;
                local achivProgress = achievements[k][4];

                if achivProgress > 0 then
                    if achieved then
                       currentProgress = achivProgress;
                    else
                        if achievements[k][5] < 2 then
                            currentProgress = OW_SETTING_READ_NUMBER('ACHIEVS', k .. '_progress', 0);
                        else
                            currentProgress = '';
                            
                            for i = 1, achivProgress do
                                currentProgress = currentProgress .. 'O';
                            end;

                            currentProgress = OW_SETTING_READ_STRING('ACHIEVS', k .. '_progress', currentProgress);

                            local progress = 0;
                            
                            for i = 1, achivProgress do
                                if string.sub(currentProgress, i, i) == 'X' then
                                    progress = progress + 1;
                                end;
                            end;
                            
                            currentProgress = progress;
                        end;
                    end;
                end;

                if achivProgress > 0 then
                    menu.window_achivs.panel.scroll.row.progress_bar = getProgressBarEX_NoLabel(
                        menu.window_achivs.panel.scroll.row,
                        anchorLT,
                        XYWH(530, 12, 164, 30),
                        {
                            nomouseevent = true,
                            bevel = false,
                            colour1 = RGB(231, 223, 214),
                            colour2 = RGB(165, 138, 99),
                            minmax = {
                                min = 0,
                                max = achivProgress
                            },
                            progress = currentProgress,
                            border_size = 1,
                            border_type = BORDER_TYPE_OUTER,
                            border_colour = RGB(0, 0, 0)
                        }
                    );

                    menu.window_achivs.panel.scroll.row.progress_bar.label = getLabelEX(
                        menu.window_achivs.panel.scroll.row.progress_bar,
                        anchorLT,
                        XYWH(0,0, getWidth(menu.window_achivs.panel.scroll.row.progress_bar), getHeight(menu.window_achivs.panel.scroll.row.progress_bar)),
                        BankGotic_14,
                        math.floor(currentProgress / achivProgress * 100) .. '%',
                        {
                            text_halign = ALIGN_MIDDLE,
                            font_colour = RGB(0, 0, 0),
                            nomouseevent = true,
                            shadowtext = false
                        }
                    );
                end;

                index = index + 1;
            end;          
        end;
    end;

    if category == 0 then
        updateAchievCounter(achievAllGained, achievAllTotal);
    else
        updateAchievCounter(achievGained, achievTotal);
    end;  
end;

function achivCategoryclButton(X, Y, CAPTION, EVENT, CATEGORY)
    local count = 1;

    if (CATEGORY > 0) then
        count = length(achievsCategory[CATEGORY]);
    end;

    return clButton(
        menu.window_achivs.list, 
        X,
        Y, 
        220, 
        30,
        CAPTION, 
        EVENT,
        {
            disabled = (count == 0)
        }
    );
end;

-- init achivs
menu.window_achivs = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

menu.window_achivs.counter = getLabelEX(
    menu.window_achivs, 
    anchorR, 
    XYWH(880, 32, 120, 18),
    nil, 
    '0/0',
    {
        nomouseevent = true,
        font_colour = RGBA(255, 255, 255, 255),
        text_halign = ALIGN_MIDDLE,
        font_name = Trebuchet_18,
        wordwrap = false,
        scissor = true,
        colour1 = RGB(140, 130, 99)
    }
);

menu.window_achivs.list = getElementEX(
    menu.window_achivs, 
    anchorL, 
    XYWH(10, 50, 240, 600), 
    true,
    {
        texture = 'classic/edit/mod_list.png'
    }
);

menu.window_achivs.list.title = getLabelEX(
    menu.window_achivs.list, 
    anchorT, 
    XYWH(0, 0, menu.window_achivs.list.width, 12),
    nil, 
    loc(TID_ACHIEVEMENTS),
    {
        nomouseevent = true,
        font_colour = RGBA(0, 0, 0, 255),
        text_halign = ALIGN_MIDDLE,
        font_name = BankGotic_14
    }
);

menu.window_achivs.list.button_quit = clButton(
    menu.window_achivs.list, 
    5, 
    568, 
    230, 
    18, 
    loc(TID_Main_Menu_Campaign_Back), 
    'showAchivs(0);', 
    {}
);

menu.window_achivs.panel = getElementEX(
    menu.window_achivs, 
    anchorL, 
    XYWH(260, 50, 740, 600), 
    true,
    {
        texture = 'classic/edit/achiv_panel.png'
    }
);

menu.window_achivs.panel.scroll = getScrollboxEX(
    menu.window_achivs.panel, 
    anchorLTBR,
    XYWH(0, 4, 716, 592), 
    {
        colour1 = WHITEA()
    }
);

set_Property(menu.window_achivs.panel.scroll.ID, PROP_AUTOHIDESCROLL, false);

menu.window_achivs.panel.scrollV = clScrollBarEX2(
    menu.window_achivs.panel, 
    anchorTRB,
    XYWH(
        menu.window_achivs.panel.scroll.x + menu.window_achivs.panel.scroll.width + 1,
        menu.window_achivs.panel.scroll.y, 
        12, 
        menu.window_achivs.panel.scroll.height
    ),
    menu.window_achivs.panel.scroll, 
    SKINTYPE_NONE,
    false,
    {}
);

function updateAchievCounter(VALUE, TOTAL_VALUE)
    setText(menu.window_achivs.counter, VALUE .. '/' .. TOTAL_VALUE .. ' (' .. math.floor((100 * VALUE) / TOTAL_VALUE) .. '%)');
end;