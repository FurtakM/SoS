-- OW_SETTING_READ_BOOLEAN('ACHIEVS', name, false);
-- OW_SETTING_READ_NUMBER('ACHIEVS', k..'_progress', 0);
-- OW_SETTING_READ_STRING ('ACHIEVS', k..'_progress', aProgress);
-- OW_SETTING_WRITE('ACHIEVS', name, true);
--[[ 
SETTING_SPECIAL_RESOLUTION=0;
SETTING_SPECIAL_TEXTLANG=1;
SETTING_SPECIAL_AUDIOLANG=2;
SETTING_SPECIAL_WINDOWED=3;
SETTING_SPECIAL_VSYNC=4;
SETTING_SPECIAL_FPS=5;
SETTING_SPECIAL_LIMITMOUSE=6;
SETTING_PERMSTANDGROUND=8;
--]]

OPTION_STEAMOVERLAY = 1;
OPTION_BEHAV_WOUNDED = 2;
OPTION_BEHAV_NONCOMBAT = 3;
OPTION_BEHAV_VEHICLES = 4;
OPTION_GAME_OBJECTIVES = 5;
OPTION_GAME_SUBTITLES = 6;
OPTION_GRAPHICS_GRAPH = 7;
OPTION_GRAPHICS_GRAPH_TRANS = 8;
OPTION_SOUND_MUSIC = 9;
OPTION_SOUND_SPEECH = 10;
OPTION_SOUND_EFFECTS = 11;
OPTION_LANG_TEXT = 12;
OPTION_LANG_AUDIO = 13;
OPTION_GRAPHICS_RESOLUTION = 14;
OPTION_GRAPHICS_WINDOWED = 15;
OPTION_GRAPHICS_VSYNC = 16;
OPTION_GRAPHICS_FPS = 17;
OPTION_GRAPHICS_LIMITMOUSE = 18;
OPTION_GAME_STANDGROUND = 19;

function getSetting(setting)
    if setting == OPTION_STEAMOVERLAY then
        return OW_SETTING_READ_BOOLEAN('OPTIONS', 'OPTION_STEAMOVERLAY', true);
    end;

    if setting == OPTION_BEHAV_WOUNDED then
        return OW_get(SETTING_RAWOUNDED);
    end;

    if setting == OPTION_BEHAV_NONCOMBAT then
        return OW_get(SETTING_RANONCOMBAT);
    end;

    if setting == OPTION_BEHAV_VEHICLES then
        return OW_get(SETTING_RAVEHICLES);
    end;

    if setting == OPTION_GAME_OBJECTIVES then
        return OW_get(SETTING_AUTOMISSION);
    end;

    if setting == OPTION_GAME_SUBTITLES then
        return OW_get(SETTING_SUBTITLES);
    end;

    if setting == OPTION_GRAPHICS_GRAPH then
        return OW_SETTING_READ_BOOLEAN('DEBRIEF', 'OLD_GRAPH_TYPE', false);
    end;

    if setting == OPTION_GRAPHICS_GRAPH_TRANS then
        return OW_SETTING_READ_NUMBER('DEBRIEF', 'TRANS_FILL', 0);
    end;

    if setting == OPTION_SOUND_MUSIC then
        return OW_settings_getvolume(VOLUME_MUSIC);
    end;

    if setting == OPTION_SOUND_SPEECH then
        return OW_settings_getvolume(VOLUME_SPEECH);
    end;

    if setting == OPTION_SOUND_EFFECTS then
        return OW_settings_getvolume(VOLUME_EFFECTS);
    end;

    if setting == OPTION_LANG_TEXT then
        local keyLang = getLanguagesKey();
        local currentLang = OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_TEXTLANG);

        for i = 1, table.getn(keyLang) do
            if (keyLang[i] == currentLang) then
                return i;
            end;
        end;
    end;

    if setting == OPTION_LANG_AUDIO then
        local keyLang = getLanguagesKey();
        local currentLang = OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_AUDIOLANG);

        for i = 1, table.getn(keyLang) do
            if (keyLang[i] == currentLang) then
                return i;
            end;
        end;
    end;

    if setting == OPTION_GRAPHICS_RESOLUTION then
        local keyResolution = OW_GET_RESOLUTION_LIST();
        local currentResolution = OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_RESOLUTION);

        for i = 1, table.getn(keyResolution) do
            if (keyResolution[i] == currentResolution) then
                return i;
            end;
        end;
    end;

    if setting == OPTION_GRAPHICS_WINDOWED then
        return OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_WINDOWED);
    end;

    if setting == OPTION_GRAPHICS_VSYNC then
        return OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_VSYNC);
    end;

    if setting == OPTION_GRAPHICS_FPS then
        return OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_FPS);
    end;

    if setting == OPTION_GRAPHICS_LIMITMOUSE then
        return OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_LIMITMOUSE);
    end;

    if setting == OPTION_GAME_STANDGROUND then
        return OW_SPECIAL_SETTINGS_GET(SETTING_PERMSTANDGROUND);
    end;
end;

function changeSetting(id, setting)
    local value = true;

    if setting == OPTION_STEAMOVERLAY then
        value = OW_SETTING_READ_BOOLEAN('OPTIONS', 'OPTION_STEAMOVERLAY', true);
        OW_SETTING_WRITE('OPTIONS', 'OPTION_STEAMOVERLAY', (not value));
    end;

    if setting == OPTION_BEHAV_WOUNDED then
        value = getSetting(OPTION_BEHAV_WOUNDED);
        OW_set(SETTING_RAWOUNDED, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_BEHAV_NONCOMBAT then
        value = getSetting(OPTION_BEHAV_NONCOMBAT);
        OW_set(SETTING_RANONCOMBAT, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_BEHAV_VEHICLES then
        value = getSetting(OPTION_BEHAV_VEHICLES);
        OW_set(SETTING_RAVEHICLES, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_GAME_SUBTITLES then
        value = getSetting(OPTION_GAME_SUBTITLES);
        OW_set(SETTING_SUBTITLES, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_GAME_OBJECTIVES then
        value = getSetting(OPTION_GAME_OBJECTIVES);
        OW_set(SETTING_AUTOMISSION, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_GRAPHICS_GRAPH then
        value = OW_SETTING_READ_BOOLEAN('DEBRIEF', 'OLD_GRAPH_TYPE', false);
        OW_SETTING_WRITE('DEBRIEF', 'OLD_GRAPH_TYPE', (not value));
    end;

    if setting == OPTION_GRAPHICS_WINDOWED then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_WINDOWED, (not OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_WINDOWED)));
    end;

    if setting == OPTION_GRAPHICS_VSYNC then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_VSYNC, (not OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_VSYNC)));
    end;

    if setting == OPTION_GRAPHICS_FPS then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_FPS, (not OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_FPS)));
    end;

    if setting == OPTION_GRAPHICS_LIMITMOUSE then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_LIMITMOUSE, (not OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_LIMITMOUSE)));
    end;

    if setting == OPTION_GAME_STANDGROUND then
        OW_SPECIAL_SETTINGS_SET(SETTING_PERMSTANDGROUND, (not OW_SPECIAL_SETTINGS_GET(SETTING_PERMSTANDGROUND)));
    end;
end;

function saveSliderSetting(setting, value)
    if setting == OPTION_GRAPHICS_GRAPH_TRANS then
        OW_SETTING_WRITE('DEBRIEF', 'TRANS_FILL', value);
    end;

    if setting == OPTION_SOUND_MUSIC then
        OW_settings_setvolume(VOLUME_MUSIC, value);
    end;

    if setting == OPTION_SOUND_EFFECTS then
        OW_settings_setvolume(VOLUME_EFFECTS, value);
    end;

    if setting == OPTION_SOUND_SPEECH then
        OW_settings_setvolume(VOLUME_SPEECH, value);
    end;

    OW_settings_save();
end;

function saveComboBoxSetting(setting, value)
    if setting == OPTION_LANG_TEXT then
        local keyLang = getLanguagesKey();
        local lang = getLanguages();

        for i = 1, table.getn(keyLang) do
            if (value == lang[i]) then
                OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_TEXTLANG, keyLang[i]);
                break;
            end;
        end;
    end;

    if setting == OPTION_LANG_AUDIO then
        local keyLang = getLanguagesKey();
        local lang = getAudioLanguages();

        for i = 1, table.getn(keyLang) do
            if (value == lang[i]) then
                OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_AUDIOLANG, keyLang[i]);
                break;
            end;
        end;
    end;

    if setting == OPTION_GRAPHICS_RESOLUTION then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_RESOLUTION, value);
    end;
end;


-- init
menu.window_options = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

menu.window_options.panel = getElementEX(
    menu.window_options, 
    anchorL, 
    XYWH(LayoutWidth / 2 - 376, LayoutHeight / 2 - 180, 753, 360), 
    true,
    {
        texture = 'classic/edit/background_options_2.png'
    }
);

menu.window_options.panel.cancel = clButton(
    menu.window_options.panel, 
    12, 
    320,
    236, 
    30,
    loc(TID_msg_Cancel), 
    'showOptions(0);',
    {}
);

menu.window_options.panel.shortcuts = clButton(
    menu.window_options.panel, 
    255, 
    320,
    244, 
    30,
    loc(TID_msg_Shortcuts), 
    '',
    {
        disabled = true
    }
);

menu.window_options.panel.accept = clButton(
    menu.window_options.panel, 
    505, 
    320,
    236, 
    30,
    loc(TID_msg_Ok), 
    'showOptions(0);',
    {}
);

-- SOUND
menu.window_options.panel.sound_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(12, 19, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Sound_Options),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.music_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(14, 35, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Music_Volume),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);


menu.window_options.panel.music_slider = clSliderElement(
    menu.window_options.panel, 
    anchorNone, 
    XYWH(14, 51, 230, 15),
    0,
    5000, 
    getSetting(OPTION_SOUND_MUSIC), 
    'saveSliderSetting(OPTION_SOUND_MUSIC, menu.window_options.panel.music_slider.POS);',
    {        
        hint = loc(TID_Options_Music_Volume_Desc)
    }
);

menu.window_options.panel.speech_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(14, 69, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Speech_Volume),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);


menu.window_options.panel.speech_slider = clSliderElement(
    menu.window_options.panel, 
    anchorNone, 
    XYWH(14, 85, 230, 15),
    0,
    5000, 
    getSetting(OPTION_SOUND_SPEECH), 
    'saveSliderSetting(OPTION_SOUND_SPEECH, menu.window_options.panel.speech_slider.POS);',
    {        
        hint = loc(TID_Options_Speech_Volume_Desc)
    }
);

menu.window_options.panel.effects_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(14, 103, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Effects_Volume),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.effects_slider = clSliderElement(
    menu.window_options.panel, 
    anchorNone, 
    XYWH(14, 119, 230, 15),
    0,
    5000, 
    getSetting(OPTION_SOUND_EFFECTS), 
    'saveSliderSetting(OPTION_SOUND_EFFECTS, menu.window_options.panel.effects_slider.POS);',
    {        
        hint = loc(TID_Options_Effects_Volume_Desc)
    }
);

-- LANG
menu.window_options.panel.lang_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(256, 19, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Lang_Options),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.tlang = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(260, 35, 230, 30), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.tlang.label = getLabelEX(
    menu.window_options.panel.tlang,
    anchorLT,
    XYWH(4, 0, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Lang_Text_Options),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.tlang.listbox = clComboBox(
    menu.window_options.panel.tlang,
    0,
    15,
    getLanguages(),
    getSetting(OPTION_LANG_TEXT),
    'saveComboBoxSetting(' .. OPTION_LANG_TEXT .. ', "VALUE")',
    {
        texture = 'classic/edit/combobox-small-opt.png',
        textureButton = 'classic/edit/combobox-small-button-opt.png',
        textureButtonClick = 'classic/edit/combobox-small-button-click-opt.png',
        hint = loc(TID_Options_LangText_Desc)
    }
);

menu.window_options.panel.alang = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(260, 72, 230, 30), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.alang.label = getLabelEX(
    menu.window_options.panel.alang,
    anchorLT,
    XYWH(4, 0, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Lang_Audio_Options),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.alang.listbox = clComboBox(
    menu.window_options.panel.alang,
    0,
    15,
    getAudioLanguages(),
    getSetting(OPTION_LANG_AUDIO),
    'saveComboBoxSetting(' .. OPTION_LANG_AUDIO .. ', "VALUE")',
    {
        texture = 'classic/edit/combobox-small-opt.png',
        textureButton = 'classic/edit/combobox-small-button-opt.png',
        textureButtonClick = 'classic/edit/combobox-small-button-click-opt.png',
        hint = loc(TID_Options_LangAudio_Desc)
    }
);

menu.window_options.panel.audio_desc = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(264, 139, 200, 10),
    Tahoma_12, 
    loc(TID_Main_Menu_Options_Lang_Label),
    {
        font_colour = RGB(254, 254, 254),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = true,
        scissor = true
    }
);


-- GRAPHICS
menu.window_options.panel.graphics_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(506, 19, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Graphics_Options),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.graphics_graph_checkbox = clCheckbox(
    menu.window_options.panel,
    512,
    41,
    'changeSetting(%id, ' .. OPTION_GRAPHICS_GRAPH .. ')',
    {
        checked = getSetting(OPTION_GRAPHICS_GRAPH),
        hint = loc(TID_Options_TypeGraphs_Desc)
    }
);

menu.window_options.panel.graphics_grap = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(531, 40, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Old_Type_Graph_Short),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.grap_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(509, 64, 230, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Transparency_Fill_Short),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true,
    }
);


menu.window_options.panel.graph_slider = clSliderElement(
    menu.window_options.panel, 
    anchorNone, 
    XYWH(509, 80, 230, 15),
    0,
    25, 
    getSetting(OPTION_GRAPHICS_GRAPH_TRANS), 
    'saveSliderSetting(OPTION_GRAPHICS_GRAPH_TRANS, menu.window_options.panel.graph_slider.POS);',
    {
        hint = loc(TID_Options_Transparency_Fill_Desc)
    }
);

menu.window_options.panel.graphics_windowed_checkbox = clCheckbox(
    menu.window_options.panel,
    512, 
    122,
    'changeSetting(%id, ' .. OPTION_GRAPHICS_WINDOWED .. ')',
    {
        checked = getSetting(OPTION_GRAPHICS_WINDOWED),
        hint = loc(TID_Options_Windowed_Desc)
    }
);

menu.window_options.panel.graphics_windowed_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(531, 121, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Graphics_Windowed),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.resolution = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(507, 145, 230, 30), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.resolution.label = getLabelEX(
    menu.window_options.panel.resolution,
    anchorLT,
    XYWH(4, 0, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Graphics_Resolution),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.resolution.listbox = clComboBox(
    menu.window_options.panel.resolution,
    0,
    15,
    OW_GET_RESOLUTION_LIST(),
    getSetting(OPTION_GRAPHICS_RESOLUTION),
    'saveComboBoxSetting(' .. OPTION_GRAPHICS_RESOLUTION .. ', "VALUE")',
    {
        texture = 'classic/edit/combobox-small-opt.png',
        textureButton = 'classic/edit/combobox-small-button-opt.png',
        textureButtonClick = 'classic/edit/combobox-small-button-click-opt.png',
        hint = loc(TID_Options_Res_Desc)
    }
);

menu.window_options.panel.graphics_fps = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(531, 214, 200, 16),
    BankGotic_14, 
    loc(TID_Options_FPSCounter),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = falsel,
        scissor = true
    }
);

menu.window_options.panel.graphics_fps_checkbox = clCheckbox(
    menu.window_options.panel,
    512,
    215,
    'changeSetting(%id, ' .. OPTION_GRAPHICS_FPS .. ')',
    {
        checked = getSetting(OPTION_GRAPHICS_FPS),
        hint = loc(TID_Options_FPSCounter_Desc)
    }
);

menu.window_options.panel.graphics_vsync = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(531, 239, 200, 16),
    BankGotic_14, 
    loc(TID_Options_Vsync),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.graphics_vsync_checkbox = clCheckbox(
    menu.window_options.panel,
    512,
    240,
    'changeSetting(%id, ' .. OPTION_GRAPHICS_VSYNC .. ')',
    {
        checked = getSetting(OPTION_GRAPHICS_VSYNC),
        hint = loc(TID_Options_Vsync_Desc)
    }
);

menu.window_options.panel.graphics_limited_mouse_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(531, 264, 200, 16),
    BankGotic_14, 
    loc(TID_Options_LockCursor),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.graphics_limited_mouse_checkbox = clCheckbox(
    menu.window_options.panel,
    512,
    265,
    'changeSetting(%id, ' .. OPTION_GRAPHICS_LIMITMOUSE .. ')',
    {
        checked = getSetting(OPTION_GRAPHICS_LIMITMOUSE),
        hint = loc(TID_Options_LockCursor_Desc)
    }
);

menu.window_options.panel.game_steamoverlay = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(531, 289, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_SteamOverlay),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);


menu.window_options.panel.game_steamoverlay_checkbox = clCheckbox(
    menu.window_options.panel,
    512,
    290,
    'changeSetting(%id, ' .. OPTION_STEAMOVERLAY .. ')',
    {
        checked = getSetting(OPTION_STEAMOVERLAY)
    }
);

menu.window_options.panel.game_steamoverlay = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(531, 289, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_SteamOverlay),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

-- GAME
menu.window_options.panel.game_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(12, 184, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Game_Options),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.game_subtitles_checkbox = clCheckbox(
    menu.window_options.panel,
    17,
    240,
    'changeSetting(%id, ' .. OPTION_GAME_SUBTITLES .. ')',
    {
        checked = getSetting(OPTION_GAME_SUBTITLES),
        hint = loc(TID_Options_Subtitles_Desc)
    }
);

menu.window_options.panel.game_subtitles = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(36, 239, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Subtitles),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.game_objectives_checkbox = clCheckbox(
    menu.window_options.panel,
    17,
    265,
    'changeSetting(%id, ' .. OPTION_GAME_OBJECTIVES .. ')',
    {
        checked = getSetting(OPTION_GAME_OBJECTIVES),
    }
);

menu.window_options.panel.game_objectives = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(36, 264, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Auto_Objectives),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.game_hold_ground = clCheckbox(
    menu.window_options.panel,
    17,
    290,
    'changeSetting(%id, ' .. OPTION_GAME_STANDGROUND .. ')',
    {
        checked = getSetting(OPTION_GAME_STANDGROUND),
        hint = loc(TID_Options_HoldMode_Desc)
    }
);

menu.window_options.panel.game_hold_ground_desc = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(36, 289, 200, 16),
    BankGotic_14, 
    loc(TID_Options_HoldMode),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

-- BEHAVIOUR
menu.window_options.panel.behaviour_label = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(260, 184, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Units_Behaviour),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true,
    }
);

menu.window_options.panel.behaviour_desc = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(264, 202, 224, 27),
    Tahoma_12, 
    loc(TID_Main_Menu_Options_Units_Behaviour_Label),
    {
        font_colour = RGB(254, 254, 254),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = true,
        scissor = true
    }
);

menu.window_options.panel.behaviour_wounded_checkbox = clCheckbox(
    menu.window_options.panel,
    265,
    240,
    'changeSetting(%id, ' .. OPTION_BEHAV_WOUNDED .. ')',
    {
        checked = getSetting(OPTION_BEHAV_WOUNDED),
        hint = loc(TID_Options_Wounded_Desc)
    }
);

menu.window_options.panel.behaviour_wounded = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(284, 239, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Wounded),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.behaviour_noncombat_checkbox = clCheckbox(
    menu.window_options.panel,
    265,
    265,
    'changeSetting(%id, ' .. OPTION_BEHAV_NONCOMBAT .. ')',
    {
        checked = getSetting(OPTION_BEHAV_NONCOMBAT),
        hint = loc(TID_Options_NonSoldiers_Desc)
    }
);

menu.window_options.panel.behaviour_noncombat = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(284, 264, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_NonSoldiers),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

menu.window_options.panel.behaviour_vehicles_checkbox = clCheckbox(
    menu.window_options.panel,
    265,
    290,
    'changeSetting(%id, ' .. OPTION_BEHAV_VEHICLES .. ')',
    {
        checked = getSetting(OPTION_BEHAV_VEHICLES),
        hint = loc(TID_Options_Vehicles_Desc)
    }
);

menu.window_options.panel.behaviour_vehicles = getLabelEX(
    menu.window_options.panel,
    anchorLT,
    XYWH(284, 289, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Vehicles),
    {
        font_colour = RGB(0, 0, 0),
        shadowtext = false,
        nomouseevent = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        wordwrap = false,
        scissor = true
    }
);

function showOptions(mode)
    if mode > 0 then
        showMenuButton(0);
        setVisible(menu.window_options, true);
    else
        showMenuButton(1);
        setVisible(menu.window_options, false);
    end;
end;