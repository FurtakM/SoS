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
    if (key == VK_F1) then
        if mask == nil then
           mask = netMask();
        else
            if getVisible(mask) then
               setVisible(mask, false);
            else
               setVisible(mask, true);
            end;
        end;

        return;
    end;

    if (key == VK_RETURN) then
       -- credits
       if (getVisible(credits)) then
           hideCredits();
           return;
       end;
    end;

    if (key == VK_SPACE) then
       -- credits
       if (getVisible(credits)) then
           hideCredits();
           return;
       end;
    end;

    if (key == VK_ESC) then
        if (not getVisible(menu)) then
            return;
        end;

        -- combobox
        if (getOneOfVisible(COMBOBOX_LIST)) then
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
end;

function FROMOW_SGUI_RESTART() -- Called just before SGUI is restarted
    clearAvatarCache();

    if (MULTIPLAYER_ROOM_ACTIVE) then
        hideMultiplayerGame();
    end;
end;

-- event
set_Callback(0, CALLBACK_KEYPRESS, 'onMenuKeyPress(%k)');