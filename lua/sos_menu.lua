-- function override
function ShowCredits()
	credits.y = ScrHeight + 20;
	sgui_set(credits.ID, PROP_Y, credits.y);
    setVisible(credits, true);
    showMenuButton(0);
end;

-- function override
function HideCredits()
    if getVisible(credits) then
        setVisible(credits, false);
        showMenuButton(1);
    end;
end;


-- menu logo
setTexture(menu, 'mainbackground-l.png');
logoVisible(false);