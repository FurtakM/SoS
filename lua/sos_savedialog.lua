-- gamesave counter
SOS_GAME_SAVECOUNTER = 0;
SOS_GAME_SAVECOUNTER_LIMIT = 3;

dialog.gameSaveLimit = getDialogEX(
    dialog.back, 
    anchorNone,
    XYWH(LayoutWidth / 2 - 200, 125, 400, 180), 
    SKINTYPE_DIALOG1,
    {
        tile = true
    }
);

dialog.gameSaveLimit.caption = getLabelEX(
    dialog.gameSaveLimit,
    anchorLTR,
    XYWH(0, 20, dialog.gameSaveLimit.width, 20),
    Trebuchet_20,
    loc(TID_InGame_Save_Game_Limit),
    {
        wordwrap = true,
        nomouseevent = true,
        text_halign = ALIGN_MIDDLE,
    }
);

dialog.gameSaveLimit.content = getElementEX(
    dialog.gameSaveLimit, 
    anchorNone,
    XYWH(0, 0, 400, 180), 
    true,
    {
        colour1 = WHITEA()
    }
);

dialog.gameSaveLimit.content.panel = getElementEX(
    dialog.gameSaveLimit.content,
    anchorLTRB,
    XYWH(20, 25, dialog.gameSaveLimit.content.width - 40, dialog.gameSaveLimit.content.height - 95),
    true,
    {
        colour1 = BLACKA(0)
    }
);

dialog.gameSaveLimit.content.panel.description = getLabelEX(
    dialog.gameSaveLimit.content.panel, 
    anchorNone, 
    XYWH(20, 20, dialog.gameSaveLimit.content.width, dialog.gameSaveLimit.content.height),
    nil, 
    loc(TID_InGame_Save_Game_Limit_Desc),
    {
        nomouseevent = true,
        font_colour = WHITE(),
        font_name = Arial_12,
        text_halign = ALIGN_MIDDLE,
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
    }
);

dialog.gameSaveLimit.content.ok = getImageButtonEX(
    dialog.gameSaveLimit.content,
    anchorB,
    XYWH(dialog.gameSaveLimit.width / 2 - 75, dialog.gameSaveLimit.height - 45, 150, 24),
    loc(TID_InGame_Mission_objectives_Continue),
    '',
    'HideDialog(dialog.gameSaveLimit);',
    SKINTYPE_BUTTON,
    {
        font_colour_disabled = GRAY(127),
    }
);

function dialog.save.savelist.loadbutton.onClick()
    if SOS_GAME_DIFFICULTY == 4 then
        if SOS_GAME_SAVECOUNTER < SOS_GAME_SAVECOUNTER_LIMIT then
            setText(dialog.save.savelist.loadbutton, loc(TID_msg_Ok) .. ' (' .. (SOS_GAME_SAVECOUNTER_LIMIT - (SOS_GAME_SAVECOUNTER + 1)) .. ')');
        end;

        if SOS_GAME_SAVECOUNTER >= SOS_GAME_SAVECOUNTER_LIMIT then
            ShowDialog(dialog.gameSaveLimit);
            return;
        end;
    end;

    if dialog.save.savelist.SAVENAME ~= nil then
        if dialog.save.savelist.SAVENAME == '' then
            dialog.savename.PREFIX = OW_SAVEGAME_PREFIX();
            setText(dialog.savename.edit, '');
            setEnabled(dialog.save, false);
            setEnabled(dialog.savename.ok, false);
            ShowDialog(dialog.savename);
            setFocus(dialog.savename.edit);
            return;
        end;

        setEnabled(dialog.save, false);

        if (OW_SAVEGAME_SAVE(dialog.save.savelist.SAVENAME)) then
            SOS_GAME_SAVECOUNTER = SOS_GAME_SAVECOUNTER + 1;
            OW_CUSTOM_COMMAND(102, 1, SOS_GAME_SAVECOUNTER);

            dialog.save.close();
        end;

        setEnabled(dialog.save, true);
    end;
end;

function setGameSaveCounter(COUNTER)
    SOS_GAME_SAVECOUNTER = parseInt(COUNTER);
end;