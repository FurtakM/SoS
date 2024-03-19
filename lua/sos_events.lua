-- EVENTS
-- When user press key in mainmenu
--VK_RETURN     = 13;
--VK_SHIFT      = 16;
--VK_CTRL       = 17;
--VK_ESC        = 27;
--VK_SPACE      = 32;
--VK_F1         = 112;
--VK_F2         = 113;
--VK_F3         = 114;
--VK_F4         = 115;
--VK_F5         = 116;
--VK_F6         = 117;
--VK_CTRL_LEFT  = 162;
--VK_CTRL_RIGHT = 163;
--VK_TILDE      = 192;
--
function onMenuKeyPress(key)
    --if (key == VK_F1) then
    --    if mask == nil then
    --       mask = netMask();
    --    else
    --        if getVisible(mask) then
    --           setVisible(mask, false);
    --        else
    --           setVisible(mask, true);
    --        end;
    --    end;
    --
    --    return;
    --end;

    if (key == VK_RETURN) then
       -- credits
       if (getVisible(credits)) then
           hideCredits();
           return;
       end;
    end;

    if (key == VK_SPACE) then
        if (getVisible(streamPanel)) then
            showStreamPanel();
            return;
        end;
        
       -- credits
       if (getVisible(credits)) then
           hideCredits();
           return;
       end;
    end;

    if (key == VK_ESC) then
        if (getVisible(streamPanel)) then
            showStreamPanel();
            return;
        end;

        -- combobox
        if (getOneOfVisible(COMBOBOX_LIST)) then
            clHideAllComboBoxList();
            return;
        end;

        if (not getVisible(menu)) then
            return;
        end;

        -- dialog
        if (classicDialog and getVisible(classicDialog)) then
            return;
        end;

        -- achivs
        if (getVisible(menu.window_achivs)) then
            showAchivs(0);
            return;
        end;

        -- credits
        if (getVisible(menu.window.credits)) then
            hideCredits();
            return;
        end;

        -- options
        if (getVisible(menu.window_options)) then
            showOptions(0);
            return;
        end;

        -- mods
        if (getVisible(menu.window_mods)) then
            showMods(0);
            return;
        end;

        -- profile
        if (getVisible(menu.window_profile.panel.promptNew)) then
            clClosePrompt(menu.window_profile.panel.promptNew.ID);
            return;
        end;

        -- profile
        if (getVisible(menu.window_profile.panel.promptEdit)) then
            clClosePrompt(menu.window_profile.panel.promptEdit.ID);
            return;
        end;

        if (getVisible(menu.window_profile)) then
            showProfile(0);
            return;
        end;
    end;

    if (key == VK_F1) then
        -- combobox
        if (getOneOfVisible(COMBOBOX_LIST)) then
            clHideAllComboBoxList();
            return;
        end;
    end;

    if ((not isMultiplayer()) and STREAM_MODE == 1 and HACK_MODE == 0 and (key == VK_TILDE or key == VK_F1)) then
        showStreamPanel();
    end;

    if ((not isMultiplayer()) and HACK_MODE == 1 and (key == VK_TILDE or key == VK_F1)) then
        showHackPanel();
    end;
end;

function FROMSGUI_KEYDOWN(KEY)
    if (KEY == VK_ESC) and (getVisible(game)) then
        if not OW_FORM_CLOSE_TOP((KEY == VK_ESC)) then
            if getVisible(dialog.options) then --In-Game Options doesn't use the forms to pause the game. So we need to handle it.
                dialog.options.Hide();
            elseif getVisible(dialog.achievs) then
                HideDialog(dialog.achievs);
            elseif getVisible(dialog.customDialog) then
                HideDialog(dialog.customDialog);
            elseif SOS_LOCKER_ID ~= nil and getVisible({ID=SOS_LOCKER_ID}) then
                destroyLocker();
            else
                OW_TOOLBARBUTTON(1);
            end;
        end;
    end;
end;


-- event
set_Callback(0, CALLBACK_KEYPRESS, 'onMenuKeyPress(%k)');