--[[
    Author: Serpent
    03-2020
--]]

local selectedMod = -1;

function showMods(mode)
    if mode > 0 then
       showMenuButton(0);
       setVisible(menu.window_mods, true);
    else
       showMenuButton(1);
       setVisible(menu.window_mods, false);
    end;
end;

function clModButton(X, Y, CAPTION, EVENT)
    return clButton(
        menu.window_mods.list.mods, 
        X, 
        Y, 
        190,
        30, 
        CAPTION, 
        EVENT,
        {
            clickSoundSelect = true
        }
    );
end;

function modButtonMode(button, mode)
    setEnabled(button, mode);

    if (mode) then
        setTexture(button, 'classic/edit/menu_button_l.png');
        setTexture2(button, 'classic/edit/menu_button_c.png');
        setTexture3(button, 'classic/edit/menu_button_r.png');
    else
        setTexture(button, 'classic/edit/menu_button_disable_l.png');
        setTexture2(button, 'classic/edit/menu_button_disable_c.png');
        setTexture3(button, 'classic/edit/menu_button_disable_r.png');
    end;
end;

menu.window_mods = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

menu.window_mods.list = getElementEX(
    menu.window_mods, 
    anchorL, 
    XYWH(10, 50, 240, 600), 
    true,
	{
        texture='classic/edit/mod_list.png'
    }
);

menu.window_mods.list.title = getLabelEX(
    menu.window_mods.list, 
    anchorT, 
    XYWH(0, 0, menu.window_mods.list.width, 12),
    nil, 
    loc(TID_MODS),
	{
		nomouseevent = true,
        font_colour = RGBA(0, 0, 0, 255),
        text_halign = ALIGN_MIDDLE,
        font_name = BankGotic_14
 	}
);

menu.window_mods.list.button_quit = getImageButtonEX(
    menu.window_mods.list, 
    anchorNone, 
    XYWH(5, 575, 110, 18), 
    loc(TID_Main_Menu_Campaign_Back), 
    '', 
    'showMods(0);', 
    SKINTYPE_NONE,
	{
		font_colour = RGB(0,0,0),
		font_name = BankGotic_14,
		texture = 'classic/edit/menu_button_small_l.png',
		texture2 = 'classic/edit/menu_button_small_c.png',
		texture3 = 'classic/edit/menu_button_small_r.png'
	}
);

menu.window_mods.list.button_default = getImageButtonEX(
    menu.window_mods.list, 
    anchorNone, 
    XYWH(125, 575, 110, 18), 
    loc(TID_Mod_Default_Name), 
    '', 
    'selectDefaultMod();', 
    SKINTYPE_NONE,
	{
		font_colour = RGB(0,0,0),
		font_name = BankGotic_14,
		texture = 'classic/edit/menu_button_small_l.png',
		texture2 = 'classic/edit/menu_button_small_c.png',
		texture3 = 'classic/edit/menu_button_small_r.png'
	}
);

menu.window_mods.list.mods = getScrollboxEX(
    menu.window_mods.list, 
    anchorLTBR, 
    XYWH(6, 24, 208, 538),
    {
        colour1 = WHITEA()
    }
);

set_Property(menu.window_mods.list.mods.ID, PROP_AUTOHIDESCROLL, false);

menu.window_mods.list.scrollV = clScrollBarEX2(
    menu.window_mods.list,
    anchorTRB,
    XYWH(
        menu.window_mods.list.mods.x + menu.window_mods.list.mods.width + 1, 
        menu.window_mods.list.mods.y, 
        12,
        menu.window_mods.list.mods.height
    ), 
    menu.window_mods.list.mods, 
    SKINTYPE_NONE,
    false,
    {}
);

menu.window_mods.choose_mod = getLabelEX(
    menu.window_mods, 
    anchorLT, 
    XYWH(420, 300, 500, 70), 
    Tahoma_60B, 
    loc(TID_Choose_Mod),
    {
        wordwrap = false,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        font_colour = RGB(231, 222, 214),
        font_style_outline = true,
        shadowtext = true
    }
);

menu.window_mods.preview = getElementEX(
    menu.window_mods, 
    anchorNone, 
    XYWH(310, 50, 660, 600), 
    false,
	{
        texture = 'classic/edit/mod_preview.png',
    }
);

menu.window_mods.preview.logo = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(12, 75, 250, 58), 
    true,
	{
        texture = '',
        texture_fallback = 'SGUI/Alien/mod_unknown.png'
    }
);

menu.window_mods.preview.mod_ver = getLabelEX(
    menu.window_mods.preview, 
    anchorLT, 
    XYWH(12, 140, 250, 30), 
    Tahoma_12B, 
    '',
	{
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        font_colour = RGB(231, 222, 214),
        font_style_outline = true
    }
);

menu.window_mods.preview.mod_req_ver = getLabelEX(
    menu.window_mods.preview, 
    anchorLT, 
    XYWH(12, 160, 250, 30), 
    Tahoma_12B, 
    '',
    {
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        font_colour = RGB(231, 222, 214),
        font_style_outline = true
    }
);

menu.window_mods.preview.title = getLabelEX(
    menu.window_mods.preview, 
    anchorLT, 
    XYWH(10, 5, 640, 300), 
    Tahoma_30B, 
    '',
    {
        wordwrap = true,
        text_halign = ALIGN_MIDDLE,
        text_valign = ALIGN_TOP,
        font_colour = RGB(231, 222, 214),
        shadowtext = true,
        text_case = CASE_UPPER
    }
);

menu.window_mods.preview.desc = getLabelEX(
    menu.window_mods.preview, 
    anchorLT, 
    XYWH(287, 85, 330, 300), 
    Arial_12, 
    '',
    {
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        font_colour = BLACK(255)
    }
);

menu.window_mods.preview.logo_us = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(10, 207, 62, 62), 
    false,
    {
        texture = 'classic/edit/mod_us_logo.png'
    }
);

menu.window_mods.preview.logo_ar = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(107, 207, 62, 62), 
    false,
    {
        texture = 'classic/edit/mod_ar_logo.png'
    }
);

menu.window_mods.preview.logo_ru = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(202, 207, 62, 62), 
    false,
    {
        texture = 'classic/edit/mod_ru_logo.png'
    }
);

menu.window_mods.preview.flag_en = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(57, 295, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/en.png'
    }
);

menu.window_mods.preview.flag_pl = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(89, 295, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/pl.png'
    }
);

menu.window_mods.preview.flag_cz = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(121, 295, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/cz.png'
    }
);

menu.window_mods.preview.flag_gr = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(153, 295, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/gr.png'
    }
);

menu.window_mods.preview.flag_fr = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(185, 295, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/fr.png'
    }
);

menu.window_mods.preview.flag_sp = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(57, 317, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/sp.png'
    }
);

menu.window_mods.preview.flag_it = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(89, 317, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/it.png'
    }
);

menu.window_mods.preview.flag_jp = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(121, 317, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/jp.png'
    }
);

menu.window_mods.preview.flag_ru = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(153, 317, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/ru.png'
    }
);

menu.window_mods.preview.flag_se = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(185, 317, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/se.png'
    }
);

menu.window_mods.preview.flag_tr = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(57, 339, 32, 32), 
    false,
    {
        texture = 'classic/edit/flags/tr.png'
    }
);

menu.window_mods.preview.pvc = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(93, 392, 87, 26), 
    false,
    {
        texture = 'classic/edit/pvc.png'
    }
);

menu.window_mods.preview.coop = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(78, 453, 117, 26), 
    false,
    {
        texture = 'classic/edit/coop.png'
    }
);

menu.window_mods.preview.steam = getElementEX(
    menu.window_mods.preview, 
    anchorNone, 
    XYWH(78, 514, 121, 26), 
    false,
    {
        texture = 'classic/edit/steam_logo.png'
    }
);

menu.window_mods.preview.button_start = getImageButtonEX(
    menu.window_mods.preview, 
    anchorB, 
    XYWH(menu.window_mods.preview.width / 2 - 95, 555, 190, 30), 
    loc(TID_Main_Menu_Play), 
    '', 
    'selectMod();', 
    SKINTYPE_NONE,
    {
        font_colour = RGB(0,0,0),
        font_name = BankGotic_14,
        texture = 'classic/edit/menu_button_l.png',
        texture2 = 'classic/edit/menu_button_c.png',
        texture3 = 'classic/edit/menu_button_r.png'
    }
);


function showMod(id, name, dir, desc, steam_visible, coop_visible, mod_ver, mod_req_ver)
	selectedMod = id;

    setVisible(menu.window_mods.preview, true);

    -- if logo is not set
	mod_logo = '%ow%/mods/' .. dir .. '/modbanner.png';

    -- display logo
    setTexture(menu.window_mods.preview.logo, mod_logo);
    setTextureFallback(menu.window_mods.preview.logo, 'SGUI/Alien/mod_unknown.png')

    -- display title
    setText(menu.window_mods.preview.title, SGUI_widesub(name, 1, 80));

    -- display mod version
    setText(menu.window_mods.preview.mod_ver, '');

    if (mod_ver ~= '') then
        setText(menu.window_mods.preview.mod_ver, loc(TID_Mod_Ver) .. ' ' .. mod_ver);
    end;

    -- display mod req version
    setText(menu.window_mods.preview.mod_req_ver, '');

    if (mod_ver ~= '') then
        setText(menu.window_mods.preview.mod_req_ver, loc(TID_Min_Ver) .. ': ' .. mod_req_ver);
    end;

    -- display desc
    setText(menu.window_mods.preview.desc, SGUI_widesub(desc, 1, 890));

    -- display us logo
    setVisible(menu.window_mods.preview.logo_us, hasCampaignInMod(dir, 'AM'));

    -- display ar logo
    setVisible(menu.window_mods.preview.logo_ar, hasCampaignInMod(dir, 'AR'));

    -- display us logo
    setVisible(menu.window_mods.preview.logo_ru, hasCampaignInMod(dir, 'RU'));

    -- display coop
    setVisible(menu.window_mods.preview.coop, (parseInt(coop_visible) == 1));

    -- display steam
    setVisible(menu.window_mods.preview.steam, (parseInt(steam_visible) == 1));

    -- display skirmish
    setVisible(menu.window_mods.preview.pvc, hasSkirmishInMod(dir));

    -- reset flags
    local flags = {
        menu.window_mods.preview.flag_en,
        menu.window_mods.preview.flag_pl,
        menu.window_mods.preview.flag_cz,
        menu.window_mods.preview.flag_fr,
        menu.window_mods.preview.flag_gr,
        menu.window_mods.preview.flag_it,
        menu.window_mods.preview.flag_jp,
        menu.window_mods.preview.flag_ru,
        menu.window_mods.preview.flag_se,
        menu.window_mods.preview.flag_sp,
        menu.window_mods.preview.flag_tr
    };

    for i = 1, table.getn(flags) do
        setVisible(flags[i], false);
    end;

    -- check which languages are support
    local langs = OW_FILELIST('%ow%/mods/'..dir..'/texts', 'wri');
    clDebug(langs);
    local langCount = table.getn(langs);

    if (langCount > 0) then
        for i = 1, langCount do
            if (langs[i] == 'LangEng.wri') then
                setVisible(menu.window_mods.preview.flag_en, true);
            end;

            if (langs[i] == 'LangPOL.wri') then
                setVisible(menu.window_mods.preview.flag_pl, true);
            end;

            if (langs[i] == 'LangCZE.wri') then
                setVisible(menu.window_mods.preview.flag_cz, true);
            end;

            if (langs[i] == 'LangFRA.wri') then
                setVisible(menu.window_mods.preview.flag_fr, true);
            end;

            if (langs[i] == 'LangGER.wri') then
                setVisible(menu.window_mods.preview.flag_gr, true);
            end;

            if (langs[i] == 'LangITA.wri') then
                setVisible(menu.window_mods.preview.flag_it, true);
            end;

            if (langs[i] == 'LangJAP.wri') then
                setVisible(menu.window_mods.preview.flag_jp, true);
            end;

            if (langs[i] == 'LangRUS.wri') then
                setVisible(menu.window_mods.preview.flag_ru, true);
            end;

            if (langs[i] == 'LangSPA.wri') then
                setVisible(menu.window_mods.preview.flag_sp, true);
            end;

            if (langs[i] == 'LangSWE.wri') then
                setVisible(menu.window_mods.preview.flag_se, true);
            end;

            if (langs[i] == 'LangTUR.wri') then
                setVisible(menu.window_mods.preview.flag_tr, true);
            end;
       end;
    end;
end;

function selectDefaultMod()
    selectedMod = -1;
    selectMod();
end;

function selectMod()
    OW_mods_switchex(selectedMod);
	showMods(0);
end;

function FROMOW_MODS_ADD(INFO) -- Called by OW!
    local name, lang, desc;

	if (INFO.id > -1) then
        name = INFO.ini.Mod;

        if (name == nil) then
            return;
        end;

        desc = '';
        lang = getvalue(OWV_LANG);

        if (lang == nil) then
            lang = 'ENG';
        end;

        if (lang == 'ENG') then
            if (INFO.ini.Desc_ENG ~= nil) then
        	    desc = INFO.ini.Desc_ENG;
        	else
                if (INFO.ini.Desc ~= nil) then
                    desc = INFO.ini.Desc;
                end;
            end;
        end;

        if (lang == 'POL') then
        	if (INFO.ini.Desc_POL ~= nil) then
        	    desc = INFO.ini.Desc_POL;
        	end;
        end;

        if (lang == 'CZE') then
        	if (INFO.ini.Desc_CZE ~= nil) then
        	    desc = INFO.ini.Desc_CZE;
        	end;
        end;

        if (lang == 'FRA') then
        	if (INFO.ini.Desc_FRA ~= nil) then
        	    desc = INFO.ini.Desc_FRA;
        	end;
        end;

        if (lang == 'GER') then
        	if (INFO.ini.Desc_GER ~= nil) then
        	    desc = INFO.ini.Desc_GER;
        	end;
        end;

        if (lang == 'ITA') then
        	if (INFO.ini.Desc_ITA ~= nil) then
        	    desc = INFO.ini.Desc_ITA;
        	end;
        end;

        if (lang == 'RUS') then
        	if (INFO.ini.Desc_RUS ~= nil) then
        	    desc = INFO.ini.Desc_RUS;
        	end;
        end;

        if (lang == 'SPA') then
        	if (INFO.ini.Desc_SPA ~= nil) then
        	    desc = INFO.ini.Desc_SPA;
        	end;
        end;

        if (lang == 'SWE') then
        	if (INFO.ini.Desc_SWE ~= nil) then
        	    desc = INFO.ini.Desc_SWE;
        	end;
        end;

        local steam_visible = 0;

        if (INFO.ini.Submitted ~= nil) then
            steam_visible = 1;
        end;

        local coop_visible = 0;

        if (INFO.ini.coop ~= nil) then
            coop_visible = 1;
        end;

        local mod_ver = '';

        if (INFO.ini.Mod_Ver ~= nil) then
            mod_ver = INFO.ini.Mod_Ver;
        end;

        local mod_req_ver = '';

        if (INFO.ini.Req_Ver ~= nil) then
            mod_req_ver = INFO.ini.Req_Ver;
        end;

        local button = clModButton(
        	10,
            INFO.id * 40,
            SGUI_widesub(name, 1, 18),
            'showMod("' .. INFO.id .. '", "' .. name .. '", "' .. INFO.dir .. '", "' .. desc .. '", "' .. steam_visible .. '", "' .. coop_visible .. '", "' .. mod_ver .. '", "' .. mod_req_ver .. '");'
        );

        if (INFO.selected) then
        	Mod_Selected = INFO.id;
            OW_MODS_GETINI(INFO.dir);
            modButtonMode(button, false);
        end;
	end;
end;

OW_mods_initex();