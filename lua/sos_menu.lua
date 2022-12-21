if (parseInt(MOD_DATA.Static_Menu) == 0) then
    include('Extensions/transition');

    TEXTURE1 = loadOGLTexture('mainbackground1.png', true);
    TEXTURE2 = loadOGLTexture('mainbackground2.png', true);
    TEXTURE3 = loadOGLTexture('mainbackground3.png', true);
    TEXTURE4 = loadOGLTexture('mainbackground4.png', true);
    TEXTURE5 = loadOGLTexture('mainbackground5.png', true);
    TEXTURE6 = loadOGLTexture('mainbackground6.png', true);

    LAST_USED_TEXTURE = 1;

    function animateMenu()
        transition:init(getWidth({ID=menu.ID}), getHeight({ID=menu.ID}));
        transition:doTransition(TEXTURE1:getTextureID(), TEXTURE1:getTextureID(), 3);
        SGUI_settextureid(menu.ID, transition:getTextureID());
    end;

    function changeBackgroundMenuImage();
        local tmp = {TEXTURE1, TEXTURE2, TEXTURE3, TEXTURE4, TEXTURE5, TEXTURE6};
        local texture = tmp[LAST_USED_TEXTURE];
        LAST_USED_TEXTURE = LAST_USED_TEXTURE + 1;

        if (LAST_USED_TEXTURE > #tmp) then
            LAST_USED_TEXTURE = 1;
        end;

        transition:repeatTransition(texture:getTextureID());
    end;

    animateMenu();
else
    setTexture(menu, 'mainbackground1.png');

    function changeBackgroundMenuImage();
        -- not support
    end;
end;

-- menu logo
setVisible(version, false);
setVisible(mod_version, false);
logoVisible(false);

setVisible(classic_logo, true);

local logoY;

if ScrWidth < 1366 then
	setWidth(classic_logo, 660);
	setX(classic_logo, LayoutWidth / 2 - 330);
	setHeight(classic_logo, 91);
	logoY = LayoutHeight / 2 - (91 + 92 * 2);
else
	setWidth(classic_logo, 1320);
	setX(classic_logo, LayoutWidth / 2 - 660);
	setHeight(classic_logo, 182);
	logoY = LayoutHeight / 2 - (182 + 92 * 2);
end;

if (logoY < 80) then
    logoY = 80;
end;

setY(classic_logo, logoY);

InitMusicTimer = timer:repeatable(0.5, 'playMenuMusic(1);', -1);

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
    'showMultiplayerWindow(1);',
    {}
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
    'showBiographic(1);',
    {}
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

function displayChangeLogMessage()
    local dialogSave;
    local version = parseInt(MOD_DATA.Mod_Main_Ver);

    if (not saveExists('sos_changelog')) then
        dialogSave = OW_CUSTOMSAVE_NEW();
    else
        dialogSave = OW_CUSTOMSAVE_LOAD('sos_changelog');
    end;

    local hasBeenRead = OW_CUSTOMSAVE_READ(dialogSave, version);

    if hasBeenRead then
        OW_CUSTOMSAVE_CLOSE(dialogSave);
        return;
    end;

    OW_CUSTOMSAVE_WRITE(dialogSave, version, true);
    OW_CUSTOMSAVE_SAVE(dialogSave, 'sos_changelog');
    OW_CUSTOMSAVE_CLOSE(dialogSave);

    local ELEMENT = getElementEX(
        nil,
        anchorLTRB,
        XYWH(0, 0, ScrWidth, ScrHeight),
        true,
        {
            colour1 = BLACKA(150)
        }
    );

    -- w: 450
    -- h: 600
    ELEMENT.dialog = getElementEX(
        ELEMENT,
        anchorNone,
        XYWH(ScrWidth / 2 - 225, ScrHeight / 2 - 300, 450, 600),
        true,
        {
            texture = 'classic/edit/query_changelog.png'
        }
    );

    ELEMENT.dialog.label = getLabelEX(
        ELEMENT.dialog, 
        anchorLT, 
        XYWH(16, 28, 200, 24),
        ADMUI3L, 
        'Lista zmian',
        {
            wordwrap = true,
            font_colour = BLACK(),
            text_halign = ALIGN_LEFT,
            text_valign = ALIGN_TOP
        }
    );

    ELEMENT.dialog.content = getElementEX(
        ELEMENT.dialog,
        anchorNone,
        XYWH(20, 62, 410, 520),
        true,
        {
            colour1 = WHITEA()
        }
    );

    ELEMENT.dialog.content.text = getLabelEX(
        ELEMENT.dialog.content, 
        anchorLT, 
        XYWH(0, 0, 410, 520),
        ADMUI3L, 
        loc(TID_Changelog),
        {
            wordwrap = true,
            autosize = true,
            font_colour = BLACK(),
            scissor = true,
            text_halign = ALIGN_LEFT,
            text_valign = ALIGN_TOP,
        }
    );

    ELEMENT.close = getElementEX(
        ELEMENT,
        anchorLTRB,
        XYWH(0, 0, LayoutWidth, LayoutHeight),
        true,
        {
            colour1 = WHITEA()
        }
    );

    set_Callback(
        ELEMENT.close.ID,
        CALLBACK_MOUSEDOWN,
        'setVisibleID(' .. ELEMENT.ID .. ', false);'
    );
end;

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
        displayChangeLogMessage();
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
    timer:stop(InitMusicTimer);
    setVisible(menu,false)
    setVisible(logos,true);
    OW_menumusic(false);
    setFocus(logos);
    playLogo(0); -- See logos.lua
    OW_SET_VSYNC_VIDEOMODE(true);
    playMenuMusic(1);
end;

function backToMenu_lite()
    setVisible(game, false);
    setVisible(menu, true);
    -- loadMenuThings();
    OW_menumusic(false);  

    playMenuMusic(0);

    if getVisible(Multi_Debrief) then
        bringToFront(Multi_Debrief);
    end;
end;

function backToMenu()
    playMenuMusic(1);

    setVisible(game, false);
    setVisible(menu, true);

    if not isSkirmish() then
        showCampaign(1);
        runCampaign(CAMPAIGN_ID - 1);
    end;        
end;