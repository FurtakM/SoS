function showCredits()
    playCreditsMusic(1);
	menu.window.credits.content.y = ScrHeight + 20;
	sgui_set(menu.window.credits.content.ID, PROP_Y, menu.window.credits.content.y);
    setVisible(menu.window.credits, true);
    setVisible(menu.window.credits.content, true);
    showMenuButton(0);
end;

function hideCredits()
    if getVisible(menu.window.credits) then
        playCreditsMusic(0);
        setVisible(menu.window.credits, false);
        setVisible(menu.window.credits.content, false);
        showMenuButton(1);
    end;
end;

function playCreditsMusic(mode)
    if mode == 1 then
        OW_menumusic(false);
        creditsSound = OW_OAL_LOAD('Hudba/Credits.wav', true, true, '', VOLUME_MUSIC);
        OW_OAL_PLAY(creditsSound);
    else
        OW_OAL_FREE(creditsSound);
        OW_menumusic(true);
    end;
end;

OW_loadcredits(menu.window.credits.content.ID, 'credits/credits');