-- menu logo
setVisible(version, false);
setVisible(mod_version, false);
setTexture(menu, 'mainbackground-l.png');
logoVisible(false);

-- footer
footer = getElementEX(
    menu,
    anchorLRB,
    XYWH(0, LayoutHeight - 30, LayoutWidth, 30),
    true,
    {
        colour1 = BLACKA(120)
    }
);

footer.gameVer = getLabelEX(
    footer,
    anchorR,
    XYWH(footer.width - 190, 14, 180, 12),
    Tahoma_12, 
    loc_format(TID_Main_Menu_Version, {getvalue(OWV_VERSION)}),
    {
        font_colour = RGB(255, 255, 255),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true,
        font_size = 14
    }
);

footer.modVer = getLabelEX(
    footer,
    anchorR,
    XYWH(footer.width - 190, 0, 180, 14),
    Tahoma_14B, 
    loc_format(TID_Main_Menu_ModVersion, {getvalue(OWV_MODVER)}),
    {
        font_colour = RGB(255, 255, 255),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true,
        font_size = 14
    }
);

footer.website = getLabelEX(
	footer,
	anchorL,
	XYWH(10, 0, 320, 14),
	Tahoma_14B,
	loc(TID_Website),
	{
		font_colour = RGB(255, 255, 255),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true,
        font_size = 14
	}
);

footer.contact = getLabelEX(
	footer,
	anchorNone,
	XYWH(footer.width / 2 - 140, 0, 280, 14),
	Tahoma_14B,
	loc(TID_Contact),
	{
		font_colour = RGB(255, 255, 255),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true,
        font_size = 14
	}
);

-- @override
function showMenuButton(windowNumber)
    setVisible(menu.window, false);
    setVisible(menu.window2, false);
    setVisible(profilebar, false);

    if (windowNumber == 0) then
        setVisible(footer, false);
    else
        setVisible(footer, true);
    end;

    if (windowNumber > 0) then
        setVisible(profilebar, getSetting(OPTION_STEAMOVERLAY));
    end;

    if (windowNumber == 1) then
        setVisible(menu.window, true);
    end;

    if (windowNumber == 2) then
        setVisible(menu.window2, true);
    end;
end;