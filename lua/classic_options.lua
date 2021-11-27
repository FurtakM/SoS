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
OPTION_GAME_WOUNDED = 2;
OPTION_GAME_NONCOMBAT = 3;
OPTION_GAME_VEHICLES = 4;
OPTION_INTERFACE_OBJECTIVES = 5;
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
OPTION_INTERFACE_FPS = 17;
OPTION_CONTROLS_LIMITMOUSE = 18;
OPTION_GAME_STANDGROUND = 19;
OPTION_SOUND_VIDEO = 20;
OPTION_SUBTITLES_BACKGROUND = 21;
OPTION_GRAPHICS_MONITOR = 22;
OPTION_CONTROLS_PING = 23;
OPTION_GAME_LOCKSPEED = 24;
OPTION_INTERFACE_FACTORY = 25;

function getSetting(setting)
    if setting == OPTION_STEAMOVERLAY then
        return OW_SETTING_READ_BOOLEAN('OPTIONS', 'OPTION_STEAMOVERLAY', true);
    end;

    if setting == OPTION_GAME_WOUNDED then
        return OW_get(SETTING_RAWOUNDED);
    end;

    if setting == OPTION_GAME_NONCOMBAT then
        return OW_get(SETTING_RANONCOMBAT);
    end;

    if setting == OPTION_GAME_VEHICLES then
        return OW_get(SETTING_RAVEHICLES);
    end;

    if setting == OPTION_INTERFACE_OBJECTIVES then
        return OW_get(SETTING_AUTOMISSION);
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

    if setting == OPTION_SOUND_VIDEO then
        return OW_GSETTING_READ_NUMBER(getvalue(OWV_PROFILENAME), 'GS_VOLUME_VIDEO', 5000);
    end;

    if setting == OPTION_GRAPHICS_MONITOR then
        return 1;
    end;

    if setting == OPTION_LANG_TEXT then
        local keyLang = getLanguagesKey();
        local currentLang = OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_TEXTLANG);

        if (currentLang == '') then
            currentLang = 'ENG';
        end;

        for i = 1, table.getn(keyLang) do
            if (keyLang[i] == currentLang) then
                return i;
            end;
        end;
    end;

    if setting == OPTION_LANG_AUDIO then
        local keyLang = getLanguagesKey();
        local currentLang = OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_AUDIOLANG);

        if (currentLang == '') then
            currentLang = 'ENG';
        end;

        for i = 1, table.getn(keyLang) do
            if (keyLang[i] == currentLang) then
                return i;
            end;
        end;
    end;

    if setting == OPTION_GAME_SUBTITLES then
       return OW_SETTING_READ_NUMBER('OPTIONS', 'SUBTITLES', 0);
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
        return (OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_WINDOWED) and 2 or 1);
    end;

    if setting == OPTION_GRAPHICS_VSYNC then
        return OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_VSYNC);
    end;

    if setting == OPTION_INTERFACE_FPS then
        return OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_FPS);
    end;

    if setting == OPTION_CONTROLS_LIMITMOUSE then
        return OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_LIMITMOUSE);
    end;

    if setting == OPTION_GAME_STANDGROUND then
        return OW_SPECIAL_SETTINGS_GET(SETTING_PERMSTANDGROUND);
    end;

    if setting == OPTION_SUBTITLES_BACKGROUND then
        return OW_GSETTING_READ_NUMBER(getvalue(OWV_PROFILENAME), 'GS_subBG', 127);
    end;

    if setting == OPTION_CONTROLS_PING then
        return OW_GSETTING_READ_BOOLEAN(getvalue(OWV_PROFILENAME), 'GS_pingMode', false);
    end;

    if setting == OPTION_GAME_LOCKSPEED then
        return OW_get(SETTING_USEGAMESPEEDLOCK);
    end;

    if setting == OPTION_INTERFACE_FACTORY then
        return OW_GSETTING_READ_BOOLEAN(getvalue(OWV_PROFILENAME), 'GS_altFact', false);
    end;
end;

function changeSetting(id, setting)
    local value = true;

    if setting == OPTION_STEAMOVERLAY then
        value = OW_SETTING_READ_BOOLEAN('OPTIONS', 'OPTION_STEAMOVERLAY', true);
        OW_SETTING_WRITE('OPTIONS', 'OPTION_STEAMOVERLAY', (not value));
    end;

    if setting == OPTION_GAME_WOUNDED then
        value = getSetting(OPTION_GAME_WOUNDED);
        OW_set(SETTING_RAWOUNDED, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_GAME_NONCOMBAT then
        value = getSetting(OPTION_GAME_NONCOMBAT);
        OW_set(SETTING_RANONCOMBAT, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_GAME_VEHICLES then
        value = getSetting(OPTION_GAME_VEHICLES);
        OW_set(SETTING_RAVEHICLES, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_GAME_SUBTITLES then
        value = getSetting(OPTION_GAME_SUBTITLES);
        OW_set(SETTING_SUBTITLES, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_INTERFACE_OBJECTIVES then
        value = getSetting(OPTION_INTERFACE_OBJECTIVES);
        OW_set(SETTING_AUTOMISSION, (not value));
        OW_settings_save();
    end;

    if setting == OPTION_GRAPHICS_GRAPH then
        value = OW_SETTING_READ_BOOLEAN('DEBRIEF', 'OLD_GRAPH_TYPE', false);
        OW_SETTING_WRITE('DEBRIEF', 'OLD_GRAPH_TYPE', (not value));
    end;

    if setting == OPTION_GRAPHICS_VSYNC then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_VSYNC, (not OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_VSYNC)));
    end;

    if setting == OPTION_INTERFACE_FPS then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_FPS, (not OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_FPS)));
    end;

    if setting == OPTION_CONTROLS_LIMITMOUSE then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_LIMITMOUSE, (not OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_LIMITMOUSE)));
    end;

    if setting == OPTION_GAME_STANDGROUND then
        OW_SPECIAL_SETTINGS_SET(SETTING_PERMSTANDGROUND, (not OW_SPECIAL_SETTINGS_GET(SETTING_PERMSTANDGROUND)));
    end;

    if setting == OPTION_CONTROLS_PING then
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_pingMode', (not OW_GSETTING_READ_BOOLEAN(getvalue(OWV_PROFILENAME), 'GS_pingMode', false)));
    end;

    if setting == OPTION_GAME_LOCKSPEED then
        local value = OW_get(SETTING_USEGAMESPEEDLOCK);
        OW_set(SETTING_USEGAMESPEEDLOCK, (not value));
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_USEGAMESPEEDLOCK', (not value));
    end;

    if setting == OPTION_INTERFACE_FACTORY then
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_altFact', (not OW_GSETTING_READ_BOOLEAN(getvalue(OWV_PROFILENAME), 'GS_altFact', false)));
    end;
end;

function saveSliderSetting(setting, value)
    if setting == OPTION_GRAPHICS_GRAPH_TRANS then
        OW_SETTING_WRITE('DEBRIEF', 'TRANS_FILL', value);
    end;

    if setting == OPTION_SOUND_MUSIC then
        OW_settings_setvolume(VOLUME_MUSIC, value);
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_VOLUME_MUSIC', value);
    end;

    if setting == OPTION_SOUND_EFFECTS then
        OW_settings_setvolume(VOLUME_EFFECTS, value);
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_VOLUME_EFFECTS', value);
        sound.playOptions('Effects/People/Weapons/Am/pistol.wav', VOLUME_EFFECTS);
    end;

    if setting == OPTION_SOUND_SPEECH then
        OW_settings_setvolume(VOLUME_SPEECH, value);
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_VOLUME_SPEECH', value);
        sound.playOptions('Dialogs/Am/Exclamations/EX_CA-ARM-2.wav', VOLUME_SPEECH);
    end;

    if setting == OPTION_SOUND_VIDEO then
        OW_settings_setvolume(VOLUME_VIDEO, value);
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_VOLUME_VIDEO', value);
    end;

    if setting == OPTION_SUBTITLES_BACKGROUND then
        OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_subBG', value);
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

    if setting == OPTION_GAME_SUBTITLES then
        local subtitles = getSubtitles();

        for i = 1, table.getn(subtitles) do
            if (value == subtitles[i]) then
                OW_SETTING_WRITE('OPTIONS', 'SUBTITLES', i);

                if (i == 1) then
                    OW_set(SETTING_SUBTITLES, true);
                    OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_SUBTITLES', true);
                elseif (i == 2) then
                    OW_set(SETTING_SUBTITLES, false);
                    OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_SUBTITLES', false);
                elseif (i == 3) then
                    OW_set(SETTING_SUBTITLESAUDIO, true);
                    OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_SUBTITLESAUDIO', true);
                else 
                    OW_set(SETTING_SUBTITLESAUDIO, false);
                    OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_SUBTITLESAUDIO', false);
                end;

                break;
            end;
        end;
    end;

    if setting == OPTION_GRAPHICS_RESOLUTION then
        OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_RESOLUTION, value);
    end;

    if setting == OPTION_GRAPHICS_WINDOWED then
        local windowed = getWindowedList();

        for i = 1, table.getn(windowed) do
            if (value == windowed[i]) then
                OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_WINDOWED, (i >= 2) and true or false);
            end;
        end;
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
    XYWH(LayoutWidth / 2 - 376, LayoutHeight / 2 - 240, 753, 480), 
    true,
    {
        texture = 'classic/edit/background_options_2.png'
    }
);

menu.window_options.panel.cancel = clButton(
    menu.window_options.panel, 
    12, 
    440,
    236, 
    30,
    loc(TID_msg_Cancel), 
    'showOptions(0);',
    {}
);

menu.window_options.panel.shortcuts = clButton(
    menu.window_options.panel, 
    255, 
    440,
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
    440,
    236, 
    30,
    loc(TID_msg_Ok), 
    'showOptions(0);',
    {}
);

-- SOUND
menu.window_options.panel.sound = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(8, 20, 242, 218), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.sound.title = getLabelEX(
    menu.window_options.panel.sound,
    anchorLT,
    XYWH(4, 0, 200, 16),
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

menu.window_options.panel.sound.music_label = getLabelEX(
    menu.window_options.panel.sound,
    anchorLT,
    XYWH(6, 16, 200, 15),
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


menu.window_options.panel.sound.music_slider = clSliderElement(
    menu.window_options.panel.sound, 
    anchorNone, 
    XYWH(6, 32, 230, 15),
    0,
    5000, 
    getSetting(OPTION_SOUND_MUSIC), 
    'saveSliderSetting(' .. OPTION_SOUND_MUSIC .. ', menu.window_options.panel.sound.music_slider.POS);',
    {        
        hint = loc(TID_Options_Music_Volume_Desc)
    }
);

menu.window_options.panel.sound.speech_label = getLabelEX(
    menu.window_options.panel.sound,
    anchorLT,
    XYWH(6, 50, 200, 15),
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


menu.window_options.panel.sound.speech_slider = clSliderElement(
    menu.window_options.panel.sound, 
    anchorNone, 
    XYWH(6, 66, 230, 15),
    0,
    5000, 
    getSetting(OPTION_SOUND_SPEECH), 
    'saveSliderSetting(' .. OPTION_SOUND_SPEECH .. ', menu.window_options.panel.sound.speech_slider.POS);',
    {        
        hint = loc(TID_Options_Speech_Volume_Desc)
    }
);

menu.window_options.panel.sound.effects_label = getLabelEX(
    menu.window_options.panel.sound,
    anchorLT,
    XYWH(6, 84, 200, 15),
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

menu.window_options.panel.sound.effects_slider = clSliderElement(
    menu.window_options.panel.sound, 
    anchorNone, 
    XYWH(6, 100, 230, 15),
    0,
    5000, 
    getSetting(OPTION_SOUND_EFFECTS), 
    'saveSliderSetting(' .. OPTION_SOUND_EFFECTS .. ', menu.window_options.panel.sound.effects_slider.POS);',
    {        
        hint = loc(TID_Options_Effects_Volume_Desc)
    }
);

menu.window_options.panel.sound.video_label = getLabelEX(
    menu.window_options.panel.sound,
    anchorLT,
    XYWH(6, 118, 200, 15),
    BankGotic_14, 
    loc(TID_Options_Video_Volume),
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

menu.window_options.panel.sound.video_slider = clSliderElement(
    menu.window_options.panel.sound, 
    anchorNone, 
    XYWH(6, 134, 230, 15),
    0,
    5000, 
    getSetting(OPTION_SOUND_VIDEO), 
    'saveSliderSetting(' .. OPTION_SOUND_VIDEO .. ', menu.window_options.panel.sound.video_slider.POS);',
    {        
        hint = loc(TID_Options_Video_Volume_Desc)
    }
);

menu.window_options.panel.sound.desc = getLabelEX(
    menu.window_options.panel.sound,
    anchorLT,
    XYWH(6, 184, 230, 32),
    Tahoma_12, 
    loc(TID_Main_Menu_Options_Sound_Label),
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


-- LANGUAGE
menu.window_options.panel.language = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(256, 20, 242, 218), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.language.title = getLabelEX(
    menu.window_options.panel.language,
    anchorLT,
    XYWH(4, 0, 200, 16),
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

menu.window_options.panel.language.game_label = getLabelEX(
    menu.window_options.panel.language,
    anchorLT,
    XYWH(6, 16, 200, 15),
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

menu.window_options.panel.language.game_listbox = clComboBox(
    menu.window_options.panel.language,
    4,
    30,
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

menu.window_options.panel.language.audio_label = getLabelEX(
    menu.window_options.panel.language,
    anchorLT,
    XYWH(6, 53, 200, 15),
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

menu.window_options.panel.language.audio_listbox = clComboBox(
    menu.window_options.panel.language,
    4,
    67,
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

menu.window_options.panel.language.subtitles_label = getLabelEX(
    menu.window_options.panel.language,
    anchorLT,
    XYWH(6, 90, 200, 15),
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

menu.window_options.panel.language.subtitles_listbox = clComboBox(
    menu.window_options.panel.language,
    4,
    104,
    getSubtitles(),
    getSetting(OPTION_GAME_SUBTITLES),
    'saveComboBoxSetting(' .. OPTION_GAME_SUBTITLES .. ', "VALUE")',
    {
        texture = 'classic/edit/combobox-small-opt.png',
        textureButton = 'classic/edit/combobox-small-button-opt.png',
        textureButtonClick = 'classic/edit/combobox-small-button-click-opt.png',
        hint = loc(TID_Options_Subtitles_Desc)
    }
);

menu.window_options.panel.language.subtitles_background_label = getLabelEX(
    menu.window_options.panel.language,
    anchorLT,
    XYWH(6, 126, 200, 15),
    BankGotic_14, 
    loc(TID_Options_SubtitlesBG),
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

menu.window_options.panel.language.subtitles_background_slider = clSliderElement(
    menu.window_options.panel.language, 
    anchorNone, 
    XYWH(6, 142, 230, 15),
    0,
    255, 
    getSetting(OPTION_SUBTITLES_BACKGROUND), 
    'saveSliderSetting(' .. OPTION_SUBTITLES_BACKGROUND .. ', menu.window_options.panel.language.subtitles_background_slider.POS);',
    {        
        hint = loc(TID_Options_SubtitlesBG_Desc)
    }
);

menu.window_options.panel.language.desc = getLabelEX(
    menu.window_options.panel.language,
    anchorLT,
    XYWH(6, 184, 230, 32),
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
menu.window_options.panel.graphics = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(502, 20, 242, 218), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.graphics.title = getLabelEX(
    menu.window_options.panel.graphics,
    anchorLT,
    XYWH(4, 0, 200, 16),
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

menu.window_options.panel.graphics.vsync_checkbox = clCheckbox(
    menu.window_options.panel.graphics,
    10,
    21,
    'changeSetting(%id, ' .. OPTION_GRAPHICS_VSYNC .. ')',
    {
        checked = getSetting(OPTION_GRAPHICS_VSYNC),
        hint = loc(TID_Options_Vsync_Desc)
    }
);

menu.window_options.panel.graphics.vsync_label = getLabelEX(
    menu.window_options.panel.graphics,
    anchorLT,
    XYWH(31, 20, 200, 16),
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

menu.window_options.panel.graphics.resolution_listbox = clComboBox(
    menu.window_options.panel.graphics,
    5,
    59,
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

menu.window_options.panel.graphics.resolution_label = getLabelEX(
    menu.window_options.panel.graphics,
    anchorLT,
    XYWH(9, 44, 200, 15),
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

menu.window_options.panel.graphics.windowed_listbox = clComboBox(
    menu.window_options.panel.graphics,
    5,
    96,
    getWindowedList(),
    getSetting(OPTION_GRAPHICS_WINDOWED),
    'saveComboBoxSetting(' .. OPTION_GRAPHICS_WINDOWED .. ', "VALUE")',
    {
        texture = 'classic/edit/combobox-small-opt.png',
        textureButton = 'classic/edit/combobox-small-button-opt.png',
        textureButtonClick = 'classic/edit/combobox-small-button-click-opt.png',
        hint = loc(TID_Options_Windowed_Desc)
    }
);

menu.window_options.panel.graphics.windowed_label = getLabelEX(
    menu.window_options.panel.graphics,
    anchorLT,
    XYWH(9, 82, 200, 15),
    BankGotic_14, 
    loc(TID_Options_Windowed),
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

menu.window_options.panel.graphics.monitor_listbox = clComboBox(
    menu.window_options.panel.graphics,
    5,
    132,
    {loc(TID_Main_Menu_Options_Main_Screen)},
    getSetting(OPTION_GRAPHICS_MONITOR),
    'saveComboBoxSetting(' .. OPTION_GRAPHICS_MONITOR .. ', "VALUE")',
    {
        texture = 'classic/edit/combobox-small-opt.png',
        textureButton = 'classic/edit/combobox-small-button-opt.png',
        textureButtonClick = 'classic/edit/combobox-small-button-click-opt.png',
        hint = loc(TID_Options_Amonitor_Desc),
        disabled = true
    }
);

menu.window_options.panel.graphics.monitor_label = getLabelEX(
    menu.window_options.panel.graphics,
    anchorLT,
    XYWH(9, 118, 200, 15),
    BankGotic_14, 
    loc(TID_Options_Amonitor),
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

menu.window_options.panel.graphics.desc = getLabelEX(
    menu.window_options.panel.graphics,
    anchorLT,
    XYWH(6, 184, 230, 32),
    Tahoma_12, 
    loc(TID_Main_Menu_Options_Graphics_Label),
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


-- CONTROLS
menu.window_options.panel.controls = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(8, 240, 242, 192), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.controls.desc = getLabelEX(
    menu.window_options.panel.controls,
    anchorLT,
    XYWH(6, 18, 230, 32),
    Tahoma_12, 
    loc(TID_Main_Menu_Options_Controls_Label),
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

menu.window_options.panel.controls.title = getLabelEX(
    menu.window_options.panel.controls,
    anchorLT,
    XYWH(4, 0, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Controls_Options),
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

menu.window_options.panel.controls.cursor = clCheckbox(
    menu.window_options.panel.controls,
    9,
    55,
    'changeSetting(%id, ' .. OPTION_CONTROLS_LIMITMOUSE .. ')',
    {
        checked = getSetting(OPTION_CONTROLS_LIMITMOUSE),
        hint = loc(TID_Options_LockCursor_Desc)
    }
);

menu.window_options.panel.controls.cursor_label = getLabelEX(
    menu.window_options.panel.controls,
    anchorLT,
    XYWH(31, 54, 200, 15),
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

menu.window_options.panel.controls.ping = clCheckbox(
    menu.window_options.panel.controls,
    9,
    80,
    'changeSetting(%id, ' .. OPTION_CONTROLS_PING .. ')',
    {
        checked = getSetting(OPTION_CONTROLS_PING),
        hint = loc(TID_Options_PingMode_Desc)
    }
);

menu.window_options.panel.controls.ping_label = getLabelEX(
    menu.window_options.panel.controls,
    anchorLT,
    XYWH(31, 79, 200, 15),
    BankGotic_14, 
    loc(TID_Options_PingMode),
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
menu.window_options.panel.game = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(256, 240, 242, 192), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.game.title = getLabelEX(
    menu.window_options.panel.game,
    anchorLT,
    XYWH(4, 0, 200, 16),
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

menu.window_options.panel.game.desc = getLabelEX(
    menu.window_options.panel.game,
    anchorLT,
    XYWH(6, 18, 230, 32),
    Tahoma_12, 
    loc(TID_Main_Menu_Options_Game_Label),
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

menu.window_options.panel.game.noncombat = clCheckbox(
    menu.window_options.panel.game,
    9,
    55,
    'changeSetting(%id, ' .. OPTION_GAME_NONCOMBAT .. ')',
    {
        checked = getSetting(OPTION_GAME_NONCOMBAT),
        hint = loc(TID_Options_NonSoldiers_Desc)
    }
);

menu.window_options.panel.game.noncombat_desc = getLabelEX(
    menu.window_options.panel.game,
    anchorLT,
    XYWH(31, 54, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Game_NonCombat),
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

menu.window_options.panel.game.wounded = clCheckbox(
    menu.window_options.panel.game,
    9,
    80,
    'changeSetting(%id, ' .. OPTION_GAME_WOUNDED .. ')',
    {
        checked = getSetting(OPTION_GAME_WOUNDED),
        hint = loc(TID_Options_Wounded_Desc)
    }
);

menu.window_options.panel.game.wounded_desc = getLabelEX(
    menu.window_options.panel.game,
    anchorLT,
    XYWH(31, 79, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Game_Wounded),
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

menu.window_options.panel.game.vehicles = clCheckbox(
    menu.window_options.panel.game,
    9,
    105,
    'changeSetting(%id, ' .. OPTION_GAME_VEHICLES .. ')',
    {
        checked = getSetting(OPTION_GAME_VEHICLES),
        hint = loc(TID_Options_Vehicles_Desc)
    }
);

menu.window_options.panel.game.vehicles_desc = getLabelEX(
    menu.window_options.panel.game,
    anchorLT,
    XYWH(31, 104, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Game_Vehicles),
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

menu.window_options.panel.game.stand_ground = clCheckbox(
    menu.window_options.panel.game,
    9,
    144,
    'changeSetting(%id, ' .. OPTION_GAME_STANDGROUND .. ')',
    {
        checked = getSetting(OPTION_GAME_STANDGROUND),
        hint = loc(TID_Options_HoldMode_Desc)
    }
);

menu.window_options.panel.game.stand_ground_label = getLabelEX(
    menu.window_options.panel.game,
    anchorLT,
    XYWH(31, 143, 200, 15),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Game_HoldGround),
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

menu.window_options.panel.game.lock_speed = clCheckbox(
    menu.window_options.panel.game,
    9,
    169,
    'changeSetting(%id, ' .. OPTION_GAME_LOCKSPEED .. ')',
    {
        checked = getSetting(OPTION_GAME_LOCKSPEED),
        hint = loc(TID_Options_SpeedLock_Desc)
    }
);

menu.window_options.panel.game.lock_speed_label = getLabelEX(
    menu.window_options.panel.game,
    anchorLT,
    XYWH(31, 168, 200, 15),
    BankGotic_14, 
    loc(TID_Options_SpeedLock),
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

-- INTERFACE
menu.window_options.panel.interface = getElementEX(
    menu.window_options.panel, 
    anchorLT, 
    XYWH(503, 240, 242, 192), 
    true,
    {
        colour1 = WHITEA(),
    }
);

menu.window_options.panel.interface.title = getLabelEX(
    menu.window_options.panel.interface,
    anchorLT,
    XYWH(4, 0, 200, 16),
    BankGotic_14, 
    loc(TID_Main_Menu_Options_Interface_Options),
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

menu.window_options.panel.interface.desc = getLabelEX(
    menu.window_options.panel.interface,
    anchorLT,
    XYWH(6, 18, 230, 32),
    Tahoma_12, 
    loc(TID_Main_Menu_Options_Interface_Label),
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

menu.window_options.panel.interface.objectives = clCheckbox(
    menu.window_options.panel.interface,
    9,
    55,
    'changeSetting(%id, ' .. OPTION_INTERFACE_OBJECTIVES .. ')',
    {
        checked = getSetting(OPTION_INTERFACE_OBJECTIVES),
        hint = loc(TID_Main_Menu_Options_Objectives_Desc)
    }
);

menu.window_options.panel.interface.objectives_desc = getLabelEX(
    menu.window_options.panel.interface,
    anchorLT,
    XYWH(31, 54, 200, 15),
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

menu.window_options.panel.interface.fps = clCheckbox(
    menu.window_options.panel.interface,
    9,
    80,
    'changeSetting(%id, ' .. OPTION_INTERFACE_FPS .. ')',
    {
        checked = getSetting(OPTION_INTERFACE_FPS),
        hint = loc(TID_Options_FPSCounter_Desc)
    }
);

menu.window_options.panel.interface.fps_desc = getLabelEX(
    menu.window_options.panel.interface,
    anchorLT,
    XYWH(31, 79, 200, 15),
    BankGotic_14, 
    loc(TID_Options_FPSCounter),
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

menu.window_options.panel.interface.graph = clCheckbox(
    menu.window_options.panel.interface,
    9,
    105,
    'changeSetting(%id, ' .. OPTION_GRAPHICS_GRAPH .. ')',
    {
        checked = getSetting(OPTION_GRAPHICS_GRAPH),
        hint = loc(TID_Options_TypeGraphs_Desc)
    }
);

menu.window_options.panel.interface.graph_desc = getLabelEX(
    menu.window_options.panel.interface,
    anchorLT,
    XYWH(31, 104, 200, 15),
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

menu.window_options.panel.interface.steam = clCheckbox(
    menu.window_options.panel.interface,
    9,
    144,
    'changeSetting(%id, ' .. OPTION_STEAMOVERLAY .. ')',
    {
        checked = getSetting(OPTION_STEAMOVERLAY),
        hint = loc(TID_Main_Menu_SteamOverlay_Desc)
    }
);

menu.window_options.panel.interface.steam_desc = getLabelEX(
    menu.window_options.panel.interface,
    anchorLT,
    XYWH(31, 143, 200, 15),
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

menu.window_options.panel.game.factory = clCheckbox(
    menu.window_options.panel.interface,
    9,
    169,
    'changeSetting(%id, ' .. OPTION_INTERFACE_FACTORY .. ')',
    {
        checked = getSetting(OPTION_INTERFACE_FACTORY),
        hint = loc(TID_Options_AltFact_Desc)
    }
);

menu.window_options.panel.game.factory_label = getLabelEX(
    menu.window_options.panel.interface,
    anchorLT,
    XYWH(31, 168, 200, 15),
    BankGotic_14, 
    loc(TID_Options_AltFact),
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