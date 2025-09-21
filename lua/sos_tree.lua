SOS_TREE_BONUS_LAST_TICK = 0;

function displayTreeBonusDetails(ID, SKILL, VALUE)
    local mySide = getvalue(OWV_MYSIDE);

    --[[if mySide < 9 then
        return;
    end;--]]

    local tick = OW_GET_TICK();

    if (SOS_TREE_BONUS_LAST_TICK + 35 > tick) then
        AddSingleUseTimer(1, 'displayTreeBonusDetails(' .. ID .. ',' .. SKILL .. ',' .. VALUE .. ')');
        return;
    end;

    SOS_TREE_BONUS_LAST_TICK = tick;

    local info = OW_GET_UNIT_INFO(parseInt(ID));

    if (info == nil or info.INFO == nil) then
        return;
    end;

    local LOGOS = {'am', 'ar', 'ru'};
    local SIDE = parseInt(info.SIDE);
    local NATION = parseInt(info.NATION);
    local NAME = info.INFO[1];

    if (mySide < 9 and SIDE ~= mySide) then
        return;
    end;

    treeWindowGain = getElementEX(
        nil,
        anchorLT,
        XYWH(-300, 250, 300, 85),
        true,
        {
            colour1 = RGB(0, 0, 0),
            border_size = 1,
            border_type = BORDER_TYPE_INNER,
            border_colour = WHITEA(200)
        }
    );

    treeWindowGain.Image = getElementEX(
    	treeWindowGain,
        anchorNone,
        XYWH(8, 4, 64, 80),
        true,
        {
            texture = 'classic/edit/avatar/placeholder.PNG'
        }
    );

    SGUI_settextureid(treeWindowGain.Image.ID, parseInt(info.TEXTURE));

    treeWindowGain.Image.Nation = getElementEX(
        treeWindowGain.Image,
        anchorNone,
        XYWH(0, 50, 30, 30),
        true,
        {
            texture = 'SGUI/tags/' .. LOGOS[NATION] .. '-' .. SIDE .. '.png'
        }
    );

    treeWindowGain.Text = getLabelEX(
        treeWindowGain,
        anchorNone,
        XYWH(85, 4, 215, 16),
        nil,
        loc(6095),
        {
            font_colour = WHITEA(210),
            nomouseevent = true,
            font_name = Tahoma_16,
            text_halign = ALIGN_MIDDLE,
            text_valign = ALIGN_TOP,
            scissor = true
        }
    );

    treeWindowGain.Name = getLabelEX(
        treeWindowGain,
        anchorNone,
        XYWH(85, 30, 215, 16),
        nil,
        NAME,
        {
            font_colour = WHITEA(210),
            nomouseevent = true,
            font_name = Tahoma_16B,
            text_halign = ALIGN_MIDDLE,
            text_valign = ALIGN_MIDDLE,
            scissor = true,
        }
    );

    treeWindowGain.Image.Skill = getElementEX(
        treeWindowGain,
        anchorNone,
        XYWH(155, 50, 30, 30),
        true,
        {
            texture = 'SGUI/Alien/multiplayer/skill-' .. SKILL .. '.png'
        }
    );

    treeWindowGain.Value = getLabelEX(
        treeWindowGain,
        anchorNone,
        XYWH(185, 58, 100, 16),
        nil,
        '+' .. VALUE .. ' lvl',
        {
            font_colour = WHITEA(210),
            nomouseevent = true,
            font_name = Tahoma_16,
            text_halign = ALIGN_LEFT,
            text_valign = ALIGN_TOP,
            scissor = true
        }
    );

    AddEventSlideX(treeWindowGain.ID, 0, 1, 'AddEventSlideY(' .. treeWindowGain.ID .. ', 335, 1, nil);');
    AddSingleUseTimer(3, 'hideAndDestroyTreeBonusWindow(' ..  treeWindowGain.ID .. ')');
end;


function hideAndDestroyTreeBonusWindow(ID)
    AddEventSlideX(ID, -300, 1, 'sgui_delete(' .. ID .. ');');
end;