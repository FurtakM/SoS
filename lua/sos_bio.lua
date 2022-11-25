BIO_HEIKE = 1;
BIO_KAIA = 2;
BIO_GIVI = 3;
BIO_MIKE = 4;
BIO_KRAY = 5;
BIO_AVIR = 6;
BIO_SOPH = 7;
BIO_KAMI = 8;
BIO_OLAF = 9;
BIO_KURT = 10;
BIO_OMAR = 11;
BIO_IBRA = 12;
BIO_SHUL = 13;
BIO_JENN = 14;
BIO_FARM = 15;
BIO_KARL = 16;
BIO_GENS = 17;
BIO_SHAR = 20;
BIO_ROLF = 22;
BIO_NIA  = 28;

avatarPath = 'SGUI/Bio/avatars/';
biographics = {
	{
    	loc(8001),        -- NAME 
    	loc(8002),        -- DESC
    	'Heike',          -- ID / IMG
    	2,                -- SIDE
    	1,         	      -- CLASS
    	'24.01.1983',  	  -- BIRTH
    	loc(TID_Chechen), -- NATIONALTY
    },
    {
    	loc(8003),
    	loc(8004),
    	'Kaia',
    	2,
    	1,
    	'23.03.1983',
    	loc(TID_Croatia),
    },
    {
    	loc(8005),
    	loc(8006),
    	'Givi',
    	2,
    	1,
    	'26.11.1960',
    	loc(TID_Georgia),
    },
    {
    	loc(8007),
    	loc(8008),
    	'Mike',
    	2,
    	1,
    	'7.7.1969',
    	loc(TID_Germany),
    },
    {
        loc(8009),
        loc(8010),
        'Kraysto',
        2,
        3,
        '28.2.1972',
        loc(TID_Bulgaria),
    },
    {
        loc(8011),
        loc(8012),
        'Aviradze',
        2,
        4,
        '26.7.1966',
        loc(TID_Georgia),
    },
    {
        loc(8013),
        loc(8014),
        'Sophia',
        2,
        2,
        '12.5.1975',
        loc(TID_Greece),
    },
    {
        loc(8015),
        loc(8016),
        'Kamil',
        2,
        2,
        '21.1.1970',
        loc(TID_Britain),
    },
    {
        loc(8017),
        loc(8018),
        'OlafL',
        2,
        3,
        '15.9.1971',
        loc(TID_Norway),
    },
    {
        loc(8019),
        loc(8020),
        'Kurt',
        2,
        1,
        '8.06.1969',
        loc(TID_Switzerland),
    },
    {
        loc(8021),
        loc(8022),
        'Omar',
        2,
        1,
        '19.8.1970',
        loc(TID_Afghanistan),
    },
    {
        loc(8023),
        loc(8024),
        'Ibrahim',
        3,
        4,
        '6.11.1964',
        loc(TID_Azerbaijan),
    },
    {
        loc(8025),
        loc(8026),
        'Louis',
        2,
        1,
        '24.08.1970',
        loc(TID_Austria),
    },
    {
        loc(8027),
        loc(8028),
        'Jenna',
        2,
        4,
        '01.10.1977',
        loc(TID_Ireland),
    },
    {
        loc(8029),
        loc(8030),
        'Robert',
        2,
        1,
        '04.12.1963',
        loc(TID_Rhodesia),
    },
    {
        loc(8031),
        loc(8032),
        'Karla',
        2,
        1,
        '29.04.1981',
        loc(TID_Belgium),
    },
    {
        loc(8033),
        loc(8034),
        'Dietrich',
        2,
        1,
        '16.03.1945',
        loc(TID_Turkey),
    },
    {
        loc(8035),
        loc(8036),
        'Joachim2',
        2,
        1,
        '14.12.1980',
        loc(TID_Germany),
    },
    {
        loc(8037),
        loc(8038),
        'Gali',
        2,
        2,
        '24.10.1967',
        loc(TID_Algeria),
    },
    {
        loc(8039),
        loc(8040),
        'Shariff',
        2,
        1,
        '28.08.1941',
        loc(TID_Arabia),
    },
    {
        loc(8041),
        loc(8042),
        'Mark',
        2,
        3,
        '19.03.1983',
        loc(TID_Sweden),
    },
    {
        loc(8043),
        loc(8044),
        'Rolf',
        2,
        1,
        '17.11.1962',
        loc(TID_Belgium),
    },
    {
        loc(8045),
        loc(8046),
        'Maria',
        2,
        1,
        '24.09.1973',
        loc(TID_Bosna),
    },
    {
        loc(8047),
        loc(8048),
        'Rick',
        2,
        1,
        '27.05.1974',
        loc(TID_RPA),
    },
    {
        loc(8049),
        loc(8050),
        'Erwin',
        2,
        1,
        '29.04.1957',
        loc(TID_Holand),
    },
    {
        loc(8051),
        loc(8052),
        'Olaf',
        2,
        4,
        '16.08.1967',
        loc(TID_Estonia),
    },
    {
        loc(8053),
        loc(8054),
        'Ronn',
        2,
        2,
        '13.05.1969',
        loc(TID_RPA),
    },
    {
        loc(8055),
        loc(8056),
        'Nia',
        2,
        1,
        '18.11.1978',
        loc(TID_Georgia),
    }
};

function loadBioCharactersStatus()
    local bioSave;

    if (not saveExists('sos_biographic')) then
        bioSave = OW_CUSTOMSAVE_NEW();
    else
        bioSave = OW_CUSTOMSAVE_LOAD('sos_biographic');
    end;

    local biographicsStatus = {};

    for i = 1, #biographics do
        biographicsStatus = addToArray(biographicsStatus, parseInt(OW_CUSTOMSAVE_READ(bioSave, i)));
    end;
    
    OW_CUSTOMSAVE_CLOSE(bioSave);

    return biographicsStatus;
end;

function enableBioCharacter(ID)
    local bioSave;

    if (not saveExists('sos_biographic')) then
        bioSave = OW_CUSTOMSAVE_NEW();
    else
        bioSave = OW_CUSTOMSAVE_LOAD('sos_biographic');
    end;

    OW_CUSTOMSAVE_WRITE(bioSave, parseInt(ID), true);
    OW_CUSTOMSAVE_SAVE(bioSave, 'sos_biographic');
    OW_CUSTOMSAVE_CLOSE(bioSave);
end;

function hoverOnBiographic(ID)
	setTextureID(ID, 'SGUI/Bio/placeholder-active.PNG');
end;

function unHoverOnBiographic(ID)
	setTextureID(ID, 'SGUI/Bio/placeholder.PNG');
end;

function loadBiographic()
	local rowIndex = 0;
	local isActive = true;
    local status = loadBioCharactersStatus();

	for i = 1, #biographics do
		local placeholder = getElementEX(
			menu.window_bio.panel.scroll,
	        anchorLTRB,
	        XYWH(((i - 1) % 8) * 120 + 30, 10 + (112 * rowIndex), 88, 108),
	        true,
	        {
	            texture = 'SGUI/Bio/placeholder.PNG'
	        }
		);

        isActive = status[i];

		if isActive then
			local avatar = getElementEX(
		        placeholder,
		        anchorLTRB,
		        XYWH(4, 4, 80, 100),
		        true,
		        {
		            texture = avatarPath .. biographics[i][3] .. '.png',
		            hint = biographics[i][1],
		            callback_mouseleave = 'unHoverOnBiographic(' .. placeholder.ID .. ')',
		            callback_mouseover = 'hoverOnBiographic(' .. placeholder.ID .. ')',
		            callback_mousedown = 'openBioPopup(' .. i .. ')'
		        }
		    );
		else
			local avatar = getElementEX(
		        placeholder,
		        anchorLTRB,
		        XYWH(4, 4, 80, 100),
		        true,
		        {
		            texture = avatarPath .. biographics[i][3] .. '.png',
                    callback_mousedown = 'isBioDisabledInfo();'
		        }
		    );

			sgui_set(avatar.ID, PROP_GRAYSCALE, true);
		end;

	    if (i % 8 == 0) then
	    	rowIndex = rowIndex + 1;
	    end;
	end;
end;

function deleteBiographic()
	sgui_deletechildren(menu.window_bio.panel.scroll.ID);
end;

function showBiographic(mode)
	if (mode == 1) then
		loadBiographic();
		showMenuButton(0);
		setVisible(menu.window_bio, true);
        displayDialogMessage(SOS_DIALOG_BIO_FIRST, true);
	else
		setVisible(menu.window_bio, false);
		deleteBiographic();
		showMenuButton(3);
	end;
end;

function openBioPopup(ID)
	local nat = {'am', 'ar', 'ru'};
	local info = loc(9200) .. ': ' .. loc(1162 + biographics[ID][5]) .. '\n' .. loc(9201) .. ': ' .. biographics[ID][6] .. '\n' .. loc(9202) .. ': ' .. biographics[ID][7];

	setVisible(menu.window_bio.popup, true);
	setText(menu.window_bio.popup.panel.name, biographics[ID][1]);
	setText(menu.window_bio.popup.panel.desc, biographics[ID][2] .. '\n\n' .. info);
	setTexture(menu.window_bio.popup.panel.avatar, avatarPath .. biographics[ID][3] .. '.png');
	setTexture(menu.window_bio.popup.panel.avatar.nation, 'SGUI/Bio/' .. nat[biographics[ID][4]] .. '.png');
end;

function closeBioPopup()
	setVisible(menu.window_bio.popup, false);
end;

function isBioDisabledInfo()
    displayDialogMessage(SOS_DIALOG_BIO_HUMAN_DISABLED, false);
end;

menu.window_bio = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

menu.window_bio.panel = getElementEX(
    menu.window_bio,
    anchorL, 
    XYWH(LayoutWidth / 2 - 512, LayoutHeight / 2 - 384, 1024, 768), 
    true,
	{
        texture = 'SGUI/Bio/panel.png'
    }
);

menu.window_bio.panel.scroll = getScrollboxEX(
    menu.window_bio.panel, 
    anchorLTBR,
    XYWH(0, 50, 966, 704), 
    {
        colour1 = WHITEA()
    }
);

set_Property(menu.window_bio.panel.scroll.ID, PROP_AUTOHIDESCROLL, false);

menu.window_bio.panel.scroll.scrollV = clScrollBarEX2(
    menu.window_bio.panel, 
    anchorTRB,
    XYWH(
        menu.window_bio.panel.scroll.x + menu.window_bio.panel.scroll.width + 6,
        menu.window_bio.panel.scroll.y, 
        12, 
        menu.window_bio.panel.scroll.height
    ),
    menu.window_bio.panel.scroll, 
    SKINTYPE_NONE,
    false,
    {}
);

menu.window_bio.panel.button_quit = clButton(
    menu.window_bio, 
    14, 
    10, 
    230, 
    18, 
    loc(TID_Main_Menu_Campaign_Back), 
    'showBiographic(0);', 
    {}
);

menu.window_bio.popup = getElementEX(
    nil,
    anchorLTRB,
    XYWH(0, 0, LayoutWidth, LayoutHeight),
    false,
    {
        colour1 = BLACKA(50)
    }
);

menu.window_bio.popup.panel = getElementEX(
	menu.window_bio.popup,
    anchorNone,
    XYWH(menu.window_bio.popup.width / 2 - 400, menu.window_bio.popup.height / 2 - 300, 800, 600),
    true,
    {
        texture = 'SGUI/Bio/popup.png'
    }
);

menu.window_bio.popup.panel.avatar = getElementEX(
	menu.window_bio.popup.panel,
    anchorNone,
    XYWH(54, 28, 320, 400),
    true,
    {}
);

menu.window_bio.popup.panel.avatar.nation = getElementEX(
	menu.window_bio.popup.panel.avatar,
    anchorNone,
    XYWH(265, 350, 51, 48),
    true,
    {
    	texture = 'SGUI/Bio/ar.png'
    }
);

menu.window_bio.popup.panel.desc = getLabelEX(
    menu.window_bio.popup.panel, 
    anchorLT, 
    XYWH(426, 40, 330, 300), 
    ADMUI3L, 
    '',
    {
        wordwrap = true,
        text_halign = ALIGN_LEFT,
        text_valign = ALIGN_TOP,
        font_colour = BLACK(255)
    }
);

menu.window_bio.popup.panel.name = getLabelEX(
    menu.window_bio.popup.panel, 
    anchorT, 
    XYWH(65, 434, 300, 40),
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

menu.window_bio.popup.panel.button_quit = clButton(
    menu.window_bio.popup.panel, 
    285, 
    560, 
    230, 
    18, 
    loc(1135), 
    'closeBioPopup();', 
    {}
);
