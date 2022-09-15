avatarPath = 'SGUI/Bio/avatars/';

biographics = {
	['HEIKE'] = {
    	loc(8001),        -- NAME 
    	loc(8002),        -- DESC
    	'Heike',          -- IMG
    	2,                -- SIDE
    	1,         	      -- CLASS
    	'24.01.1983',  	  -- BIRTH
    	loc(TID_Chechen), -- NATIONALTY
    },
    ['KAIA'] = {
    	loc(8003),
    	loc(8004),
    	'Kaia',
    	2,
    	1,
    	'23.03.1983',
    	loc(TID_Croatia),
    },
    ['GIVI'] = {
    	loc(8005),
    	loc(8006),
    	'Givi',
    	2,
    	1,
    	'26.11.1960',
    	loc(TID_Georgia),
    },
    ['MIKE'] = {
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
	local index = 0;
	local rowIndex = 0;
	local isActive = true;

	for i, k in pairs(biographics) do
		local placeholder = getElementEX(
			menu.window_bio.panel.scroll,
	        anchorLTRB,
	        XYWH(index * 120 + 30, 10 + (108 * rowIndex), 88, 108),
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
		            texture = avatarPath .. k[3] .. '.png',
		            hint = k[1],
		            callback_mouseleave = 'unHoverOnBiographic(' .. placeholder.ID .. ')',
		            callback_mouseover = 'hoverOnBiographic(' .. placeholder.ID .. ')'
		        }
		    );
		else
			local avatar = getElementEX(
		        placeholder,
		        anchorLTRB,
		        XYWH(4, 4, 80, 100),
		        true,
		        {
		            texture = avatarPath .. k[3] .. '.png'
		        }
		    );

			sgui_set(avatar.ID, PROP_GRAYSCALE, true);
		end;

	    index = index + 1;

	    if (index % 8 == 0) then
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
	else
		setVisible(menu.window_bio, false);
		deleteBiographic();
		showMenuButton(3);
	end;
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
