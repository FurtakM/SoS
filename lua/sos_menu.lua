include('Extensions/transition');

TEXTURE1 = loadOGLTexture('mainbackground1.png', true);
TEXTURE2 = loadOGLTexture('mainbackground2.png', true);
TEXTURE3 = loadOGLTexture('mainbackground3.png', true);
TEXTURE4 = loadOGLTexture('mainbackground4.png', true);

LAST_USED_TEXTURE = 1;

function animateMenu()
    transition:init(getWidth({ID=menu.ID}), getHeight({ID=menu.ID}));
    transition:doTransition(TEXTURE1:getTextureID(), TEXTURE1:getTextureID(), 3);
    SGUI_settextureid(menu.ID, transition:getTextureID());
end;

function changeBackgroundMenuImage();
    local tmp = {TEXTURE1, TEXTURE2, TEXTURE3, TEXTURE4};
    local texture = tmp[LAST_USED_TEXTURE];
    LAST_USED_TEXTURE = LAST_USED_TEXTURE + 1;

    if (LAST_USED_TEXTURE > #tmp) then
        LAST_USED_TEXTURE = 1;
    end;

    transition:repeatTransition(texture:getTextureID());
end;

animateMenu();

-- menu logo
setVisible(version, false);
setVisible(mod_version, false);
-- setTexture(menu, 'mainbackground-0.png');
logoVisible(false);

setVisible(classic_logo, true);
setWidth(classic_logo, 768);
setHeight(classic_logo, 78);
setX(classic_logo, LayoutWidth / 2 - 384);

local logoHeight = LayoutHeight / 2 - (155 + 92 * 2);

if (logoHeight < 80) then
    logoHeight = 80;
end;

setY(classic_logo, logoHeight);

playMenuMusic(1);

-- override menu
sgui_deletechildren(menu.window.ID);

menu.window2 = getElementEX(
    menu,
    anchorNone,
    XYWH(LayoutWidth / 2 - 97, LayoutHeight / 2 - 92, 194, 184),
    true,
    {}
);

setTexture(menu.window2, 'classic/edit/mainmenu2.png');
setVisible(menu.window2, false);

menu.window3 = getElementEX(
    menu,
    anchorNone,
    XYWH(LayoutWidth / 2 - 97, LayoutHeight / 2 - 92, 194, 184),
    true,
    {}
);

setTexture(menu.window3, 'classic/edit/mainmenu2.png');
setVisible(menu.window3, false);

-- buttons
menu.window.user = clButton(
    menu.window, 
    12, 
    19, 
    170,
    30,
    loc(TID_Main_Menu_User) .. ': ' .. PROFILE_NAME,
    'showProfile(1);',
    {}
);

menu.window.play = clButton(
    menu.window, 
    12, 
    61, 
    170,
    30,
    loc(TID_Main_Menu_Play), 
    'showMenuButton(2);',
    {}
);

menu.window.options = clButton(
    menu.window, 
    12, 
    145, 
    170,
    30, 
    loc(TID_Main_Menu_Options), 
    'showOptions(1);',
    {}
);

menu.window.mods = clButton(
    menu.window, 
    12, 
    187,
    170,
    30, 
    loc(TID_MODS), 
    'showMods(1);',
    {}
);

menu.window.sospedia = clButton(
    menu.window, 
    12, 
    103, 
    170,
    30, 
    'Sospedia', 
    'showMenuButton(3);',
    {}
);

menu.window.credits = clButton(
    menu.window, 
    12, 
    229, 
    170,
    30, 
    loc(TID_Main_Menu_Extras_Credits), 
    'showCredits();',
    {}
);

menu.window.quit = clButton(
    menu.window, 
    12, 
    271,
    170,
    30,  
    loc(TID_Main_Menu_Quit), 
    'exit();',
    {}
);

menu.window2.campaign = clButton(
    menu.window2, 
    12, 
    19,
    170,
    30,  
    loc(TID_Main_Menu_Campaign), 
    'showCampaign(1)',
    {}
);

menu.window2.multiplayer = clButton(
    menu.window2, 
    12, 
    61, 
    170,
    30, 
    loc(TID_Main_Menu_Multiplayer), 
    'showMultiplayer(1);',
    {
        disabled = true
    }
);

menu.window2.skirmish = clButton(
    menu.window2, 
    12, 
    103,
    170,
    30,  
    loc(TID_Main_Menu_Skirmish), 
    'showSkirmishWindow(1);',
    {}
);

menu.window2.back = clButton(
    menu.window2, 
    12, 
    145,
    170,
    30,  
    loc(TID_Main_Menu_Campaign_Back), 
    'showMenuButton(1);',
    {}
);

menu.window3.web = clButton(
    menu.window3, 
    12, 
    19, 
    170,
    30, 
    loc(TID_Website), 
    'OW_SOS_CLICKED("");',
    {}
);

menu.window3.biographies = clButton(
    menu.window3, 
    12, 
    61, 
    170,
    30, 
    loc(TID_Biographies), 
    '',
    {
        disabled = true
    }
);

menu.window3.achivs = clButton(
    menu.window3, 
    12, 
    103, 
    170,
    30, 
    loc(TID_ACHIEVEMENTS), 
    'showAchivs(1);',
    {}
);

menu.window3.back = clButton(
    menu.window3, 
    12, 
    145,
    170,
    30,  
    loc(TID_Main_Menu_Campaign_Back), 
    'showMenuButton(1);',
    {}
);


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

--[[footer.website = getLabelEX(
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
);--]]

-- @override
function showMenuButton(windowNumber)
    setVisible(menu.window, false);
    setVisible(menu.window2, false);
    setVisible(menu.window3, false);
    setVisible(profilebar, false);

    if (windowNumber == 0) then
        ChangeInterface(0);
        setVisible(footer, false);
        setVisible(classic_logo, false);
    else
        setVisible(footer, true);
        setVisible(classic_logo, true);
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

    if (windowNumber == 3) then
        setVisible(menu.window3, true);
    end;
end;

function endLogos() -- Called by lua when logos are over
    clearFocus();
    setVisible(logos, false);
    setVisible(menu, true);
    OW_menumusic(false);
    -- playMenuMusic(1);
    OW_hidemouse(false);
    OW_SET_VSYNC_VIDEOMODE(false);
end;

function FROMOW_DOLOGOS() -- Called by game when Skip is false
    setVisible(menu,false)
    setVisible(logos,true);
    OW_menumusic(false);
    -- playMenuMusic(1);
    setFocus(logos);
    playLogo(0); -- See logos.lua
    OW_SET_VSYNC_VIDEOMODE(true);
end;

function backToMenu_lite()
    setVisible(game, false);
    setVisible(menu, true);
    -- loadMenuThings();
    OW_menumusic(false);  

    playMenuMusic(0);
end;

function backToMenu()
    playMenuMusic(1);

    setVisible(game, false);
    setVisible(menu, true);

    if not getvalue(OWV_SKIRMISH) then
        showCampaign(1);
        runCampaign(CAMPAIGN_ID - 1);
    end;        
end;