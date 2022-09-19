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
    }
}

function hoverOnBiographic(ID)
	setTextureID(ID, 'SGUI/Bio/placeholder-active.PNG');
end;

function unHoverOnBiographic(ID)
	setTextureID(ID, 'SGUI/Bio/placeholder.PNG');
end;

function loadBiographic()
	local rowIndex = 0;
	local isActive = true;

	for i = 1, #biographics do
		local placeholder = getElementEX(
			menu.window_bio.panel.scroll,
	        anchorLTRB,
	        XYWH((i - 1) * 120 + 30, 10 + (108 * rowIndex), 88, 108),
	        true,
	        {
	            texture = 'SGUI/Bio/placeholder.PNG'
	        }
		);

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
		            texture = avatarPath .. biographics[i][3] .. '.png'
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
    Arial_12, 
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
    XYWH(65, 430, 300, 40),
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
