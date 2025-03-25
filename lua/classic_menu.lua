----------- MAIN MENU ----------
-- version check
if (not compareVersions(getvalue(OWV_VERSION), MOD_DATA.Req_Ver)) then
    getCustomDialog({
        COUNT = 2,
        QUESTION = loc(TID_Main_Menu_Mod_Old_Ver) .. ' ' .. MOD_DATA.Req_Ver,
        LIST = {
            {
                NAME = loc(5066),
                CALLBACK = 'OW_SOS_CLICKED("patches");',
                PREVENT_CLOSE = true
            },
            {
                NAME = loc(TID_Main_Menu_Quit),
                CALLBACK = 'exit();'
            }
        },
        INSTANT = 1
    });
end;

-- version
setFontName(version, ADMUI3LB);
-- mod version
setFontName(mod_version, Tahoma_10);

-- background
classic_logo = getElementEX(
    menu,
    anchorT,
    XYWH(LayoutWidth / 2 - 290, 75, 580, 58),
    true,
    {
        texture = 'logos/logo.png'
    }
);

-- old window
menu.window = getElementEX(
    menu,
    anchorNone,
    XYWH(LayoutWidth / 2 - 135, LayoutHeight / 2 - 155, 270, 310),
    true,
    {}
);

setTexture(menu.window, 'classic/edit/mainmenu-7.png');

menu.window2 = getElementEX(
    menu,
    anchorNone,
    XYWH(LayoutWidth / 2 - 135, LayoutHeight / 2 - 92, 270, 184),
    true,
    {}
);

setTexture(menu.window2, 'classic/edit/mainmenu-4.png');
setVisible(menu.window2, false);

-- buttons
menu.window.user = clButton(
    menu.window, 
    12, 
    19, 
    248,
    30,
    loc(TID_Main_Menu_User) .. ': ' .. PROFILE_NAME,
    'showProfile(1);',
    {}
);

menu.window.play = clButton(
    menu.window, 
    12, 
    61, 
    248,
    30,
    loc(TID_Main_Menu_Play), 
    'showMenuButton(2);',
    {}
);

menu.window.mods = clButton(
    menu.window, 
    12, 
    103,
    248,
    30, 
    loc(TID_MODS), 
    'showMods(1);',
    {}
);

menu.window.options = clButton(
    menu.window, 
    12, 
    145, 
    248,
    30, 
    loc(TID_Main_Menu_Options), 
    'showOptions(1);',
    {}
);

menu.window.achivs = clButton(
    menu.window, 
    12, 
    187, 
    248,
    30, 
    loc(TID_ACHIEVEMENTS), 
    'showAchivs(1);',
    {}
);

menu.window.credits = clButton(
    menu.window, 
    12, 
    229, 
    248,
    30, 
    loc(TID_Main_Menu_Extras_Credits), 
    'showCredits();',
    {}
);

menu.window.quit = clButton(
    menu.window, 
    12, 
    271,
    248,
    30,  
    loc(TID_Main_Menu_Quit), 
    'exit();',
    {}
);

menu.window2.campaign = clButton(
    menu.window2, 
    12, 
    19,
    248,
    30,  
    loc(TID_Main_Menu_Campaign), 
    'showCampaign(1)',
    {}
);

menu.window2.multiplayer = clButton(
    menu.window2, 
    12, 
    61, 
    248,
    30, 
    loc(TID_Main_Menu_Multiplayer), 
    'showMultiplayerWindow(1);',
    {}
);

menu.window2.skirmish = clButton(
    menu.window2, 
    12, 
    103,
    248,
    30,  
    loc(TID_Main_Menu_Skirmish), 
    'showSkirmishWindow(1);',
    {
        disabled = (#SKIRMISH_DATA == 0)
    }
);

menu.window2.back = clButton(
    menu.window2, 
    12, 
    145,
    248,
    30,  
    loc(TID_Main_Menu_Campaign_Back), 
    'showMenuButton(1);',
    {}
);


-- steam
function steam_init()
	steam_username = getLabelEX(
        profilebar, 
        anchorLT, 
        XYWH(64 + 10, 0, profilebar.width - 64 - 5, 32), 
        nil, 
        getvalue(OWV_STEAMUSERNAME), 
        {
            nomouseevent = true
        }
    );

	setFontName(steam_username, ADMUI3LB);
    setFontName(profile_label, ADMUI3LB);

    setFontColour(steam_username, RGB(0,0,0));
    setFontColour(profile_label, RGB(0,0,0));

	setXYV(profile_label, 64 + 10, 15);

	SteamInitialized = true;
end;

setVisible(profilebar, false);

profilebar = getElementEX(
    menu,
    anchorTR,
    XYWH(LayoutWidth - 300, 0, 300, 70),
    true,
    {
        texture = 'classic/edit/steam.png'
    }
);

profile_avatar = getElementEX(
    profilebar,
    anchorL,
    XYWH(3, 3, 67, 65),
    true,
	{
        texture = 'profile_select.png', 
        --callback_mouseclick ='changeProfileAvatar()', 
        bevel = true
    }
);

profile_label = getLabelEX(
    profilebar,
    anchorLT,
    XYWH(64 + 5, 0, profilebar.width - 64 - 5, 32),
    nil,
    'default',
    {
        nomouseevent = true,
        font_colour = BLACK()
    }
);

profile_button = clButton(
    profilebar, 
    82, 
    42,
    198,
    32,  
    loc(TID_Main_Menu_Change_Player), 
    'showProfile(1);',
    {
        texture = 'classic/edit/menu_button_small_l.png',
        texture2 = 'classic/edit/menu_button_small_c.png',
        texture3 = 'classic/edit/menu_button_small_r.png'
    }
);

function showMenuButton(windowNumber)
    setVisible(menu.window, false);
    setVisible(menu.window2, false);
    setVisible(profilebar, false);
    ChangeInterface(0);

    if (windowNumber == 0) then
        if (getvalue(OWV_ISMOD)) then
            setVisible(mod_version, false);
        end;

        setVisible(version, false);
        setVisible(classic_logo, false);
    else
        if (getvalue(OWV_ISMOD)) then
            setVisible(mod_version, true);
        end;

        setVisible(version, true);
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
end;

-- hide modern sgui menu
logoVisible(false);
setVisible(menu.side, false);
setVisible(menu.window, true);
setVisible(classic_logo, true);
setVisible(profilebar, getSetting(OPTION_STEAMOVERLAY));

SGUI_INIT_CLASSIC_OLD = Init;
function Init()
    setText(menu.window.user, loc(TID_Main_Menu_User) .. ': ' .. getvalue(OWV_PROFILENAME));
    SGUI_INIT_CLASSIC_OLD();
end;