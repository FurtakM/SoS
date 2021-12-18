function showCredits()
    playCreditsMusic(1);
	menu.window_credits.content.y = ScrHeight + 20;
	sgui_set(menu.window_credits.content.ID, PROP_Y, menu.window_credits.content.y);
    setVisible(menu.window_credits, true);
    setVisible(menu.window_credits.content, true);
    showMenuButton(0);
end;

function hideCredits()
    if getVisible(menu.window_credits) then
        playCreditsMusic(0);
        setVisible(menu.window_credits, false);
        setVisible(menu.window_credits.content, false);
        showMenuButton(1);
    end;
end;

OW_loadcredits(menu.window_credits.content.ID, 'credits/credits');