classicMyTempSelectedAvatar = -1;
classicLastSelectedAvatar = -1;
initAvatarDelay = false;

function loadAvatars()
	classicMyTempSelectedAvatar = -1;
	classicLastSelectedAvatar = -1;

	sgui_deletechildren(menu.window_switch_profile.panel.scroll.ID);

	local rowIndex = 0;
	local isActive = true;
	local selAvatar = OW_SETTING_READ_NUMBER('OPTIONS', 'AVATAR', 2);

	for i = 1, table.getn(listOfAvatars) + 2 do
		local placeholder = getElementEX(
			menu.window_switch_profile.panel.scroll,
			anchorLTRB,
			XYWH(((i - 1) % 6) * 120 + 30, 10 + (112 * rowIndex), 88, 108),
			true,
			{
				texture = 'classic/edit/avatar/placeholder.PNG'
			}
		);

		local name = '';
		local texture = '';
		local callback = 'setAvatar(' .. i - 1  .. ');'
					.. 'setColour1ID(%id,' .. colourToString(WHITEA(255)) .. ');'

		if (i > 2) then
			name = listOfAvatars[i - 2];
			texture = 'Avatars/' .. name ..'.png';
		end;

		local background = getElementEX(
			placeholder,
			anchorLTRB,
			XYWH(4, 4, 80, 100),
			true,
			{
				hint = name,
				colour1 = RGB(0, 0, 0),
				callback_mouseleave = 'unHoverOnAvatar(' .. placeholder.ID .. ',%id)',
				callback_mouseover = 'hoverOnAvatar(' .. placeholder.ID .. ',%id,0)',
				callback_mousedown = 'selectTempAvatar(' .. i - 1 .. ',%id)'
			}
		);

		local element = getElementEX(
			background,
			anchorLTRB,
			XYWH(7, 17, 65, 65),
			true,
			{
				hint = name,
				texture = texture,
				texture_fallback = 'Avatars/unknow.png',
				callback_mouseleave = 'unHoverOnAvatar(' .. placeholder.ID .. ',' .. background.ID .. ')',
				callback_mouseover = 'hoverOnAvatar(' .. placeholder.ID .. ',' .. background.ID .. ',1)',
				callback_mousedown = 'selectTempAvatar(' .. i - 1 .. ',' .. background.ID .. ')'
			}
		);

		if selAvatar == (i - 1) then
			setColour1ID(background.ID, RGB(72, 72, 72));
			classicLastSelectedAvatar = background.ID;
		end;

		if (i < 3) then
			getAvatarTexture(i - 1, element);

			if (i == 1) then
				setHint(background, 'STEAM');
				setHint(element, 'STEAM');
			else
				setHint(background, 'MULTIPLAYER');
				setHint(element, 'MULTIPLAYER');
			end;
		end;

		if (i > 0 and i % 6 == 0) then
			rowIndex = rowIndex + 1;
		end;
	end;
end;

function hoverOnAvatar(ID, BACKGROUND, WITHSOUND)
	if (classicLastSelectedAvatar == parseInt(BACKGROUND)) then
		return;
	end;

	setTextureID(ID, 'classic/edit/avatar/placeholder-active.PNG');
	setColour1ID(BACKGROUND, RGB(22, 22, 22));

	if (parseInt(WITHSOUND) > 0) then
		sound.play('Effects/Interface/posun.wav', "", 1);
	end;
end;

function unHoverOnAvatar(ID, BACKGROUND)
	if (classicLastSelectedAvatar == parseInt(BACKGROUND)) then
		return;
	end;

	setTextureID(ID, 'classic/edit/avatar/placeholder.PNG');
	setColour1ID(BACKGROUND, RGB(0, 0, 0));
end;

function selectTempAvatar(NAME, ID)
	classicMyTempSelectedAvatar = parseInt(NAME);
	setEnabled(menu.window_switch_profile.panel.accept, true);
	sound.play('Effects/Interface/vyber.wav', "", 1);

	if (classicLastSelectedAvatar > - 1) then
		setColour1ID(classicLastSelectedAvatar, RGB(0, 0, 0));
	end;

	setColour1ID(parseInt(ID), RGB(72, 72, 72));
	classicLastSelectedAvatar = parseInt(ID);
end

function setAvatar(NAME)
	selectedAvatar = NAME;
	
	OW_SETTING_WRITE('OPTIONS', 'AVATAR', NAME);
    OW_PROFILE_SETDATA('AVATAR', NAME);

	ReloadAvatar();
end;

function saveAvatarAndQuit()
	-- sound.play('Effects/Interface/vyber.wav', "", 1);

	if (classicMyTempSelectedAvatar > - 1) then
		setAvatar(classicMyTempSelectedAvatar);
	end;

	showSwitchAvatar(0);
end

function getAvatarTexture(NAME, ELEMENT)
	if NAME == '0' or NAME == nil or NAME == 0 then
		local asigned = OW_steam_assign_avatar(ELEMENT.ID);
		
		if asigned == false then
			setTexture(ELEMENT, 'Avatars/unknow.png');
		end;
	elseif NAME == '1' or NAME == 1 then
		local avatarFromProfile = loadAvatarComponentsFromProfile();

		if avatarFromProfile then
			local components = {};

			for i = 1, #avatarFromProfile do
				components = addToArray(components, parseInt(avatarFromProfile[i]));
			end;

			local avatar = generateAvatarFromComponents(components);

			SGUI_settextureid(ELEMENT.ID, avatar);
		else
			setTexture(ELEMENT, 'Avatars/unknow.png');
		end;
	else
		setTexture(ELEMENT, 'Avatars/' .. listOfAvatars[parseInt(NAME) - 1] .. '.png');
	end;
end;

function delaySetAvatar()
	local avatarFromProfile = loadAvatarComponentsFromProfile();

	if avatarFromProfile then
		local components = {};

		for i = 1, #avatarFromProfile do
			components = addToArray(components, parseInt(avatarFromProfile[i]));
		end;

		local avatar = generateAvatarFromComponents(components);

		SGUI_settextureid(profile_avatar.ID, avatar);
		SGUI_settextureid(menu.window_profile.panel.avatar.ID, avatar);
	else
		setTexture(profile_avatar, 'Avatars/unknow.png');
		setTexture(menu.window_profile.panel.avatar, 'Avatars/unknow.png');
	end;

	initAvatarDelay = true;
end;

function delaySetAvatarSteam()
	initAvatarDelay = true;

	return OW_steam_assign_avatar(profile_avatar.ID);
end;

function ReloadAvatar()
	if SteamInitialized then
		selectedAvatar = OW_SETTING_READ_NUMBER('OPTIONS', 'AVATAR', 0);
	else
		selectedAvatar = OW_SETTING_READ_NUMBER('OPTIONS', 'AVATAR', 2);
	end;

	if selectedAvatar == 0 then
		setTexture(profile_avatar, 'Avatars/unknow.png');

		if (not OW_steam_assign_avatar(profile_avatar.ID)) then
			setTexture(profile_avatar, 'Avatars/unknow.png');
		end;

		--if initAvatarDelay then
			--delaySetAvatarSteam();
		--else
			--timer:single(1, 'delaySetAvatarSteam();');
		--end;
		
		setXYWHV(profile_avatar, profile_avatar.x, profile_avatar.y, 64, profile_avatar.height);
	elseif selectedAvatar == 1 then
		setTexture(profile_avatar, 'Avatars/unknow.png');

		if initAvatarDelay then
			delaySetAvatar();
		else
			timer:single(0.5, 'delaySetAvatar();');
		end;		
	else
		if (listOfAvatars[selectedAvatar - 1] == nil) then
			setTexture(profile_avatar, 'Avatars/unknow.png');
		else
			setTexture(profile_avatar, 'Avatars/'.. listOfAvatars[selectedAvatar - 1] .. '.png');
			setXYWHV(profile_avatar, profile_avatar.x, profile_avatar.y, 64, profile_avatar.height);

			setTexture(menu.window_profile.panel.avatar, 'Avatars/'.. listOfAvatars[selectedAvatar - 1] .. '.png');
		end;
	end;

	initAvatarDelay = true;
end;

-- main
menu.window_switch_profile = getElementEX(
	menu, 
	anchorNone, 
	XYWH(0, 0, LayoutWidth, LayoutHeight), 
	false, 
	{
		colour1 = WHITEA(0)
	}
);

menu.window_switch_profile.panel = getElementEX(
	menu.window_switch_profile,
	anchorL, 
	XYWH(LayoutWidth / 2 - 376, LayoutHeight / 2 - 300, 753, 600), 
	true,
	{
		texture = 'classic/edit/avatar/background.png'
	}
);

menu.window_switch_profile.panel.scroll = getScrollboxEX(
	menu.window_switch_profile.panel, 
	anchorLTBR,
	XYWH(0, 21, 722, 536), 
	{
		colour1 = WHITEA()
	}
);

set_Property(menu.window_switch_profile.panel.scroll.ID, PROP_AUTOHIDESCROLL, false);

menu.window_switch_profile.panel.scroll.scrollV = clScrollBarEX2(
	menu.window_switch_profile.panel, 
	anchorTRB,
	XYWH(
		menu.window_switch_profile.panel.scroll.x + menu.window_switch_profile.panel.scroll.width + 6,
		menu.window_switch_profile.panel.scroll.y, 
		12, 
		menu.window_switch_profile.panel.scroll.height
	),
	menu.window_switch_profile.panel.scroll, 
	SKINTYPE_NONE,
	false,
	{}
);

menu.window_switch_profile.panel.cancel = clButton(
    menu.window_switch_profile.panel, 
    12, 
    560,
    236, 
    30,
    loc(TID_msg_Cancel), 
    'showSwitchAvatar(0);',
    {}
);

menu.window_switch_profile.panel.multiplayer = clButton(
    menu.window_switch_profile.panel, 
    255, 
    560,
    244, 
    30,
    loc(5067), 
    'showAvatarGenerator();',
    {}
);

menu.window_switch_profile.panel.accept = clButton(
    menu.window_switch_profile.panel, 
    505, 
    560,
    236, 
    30,
    loc(5068), 
    'saveAvatarAndQuit();',
    {}
);

function showSwitchAvatar(mode)
	if (mode == 1) then
		loadAvatars();
		setEnabled(menu.window_switch_profile.panel.accept, false);
	end;

	showMenuButton((mode - 1) * -1);
	setVisible(menu.window_switch_profile, mode == 1);
end;

-- xichted avatar generator
MY_AVATAR_ID = 0;
MY_AVATAR_COMPONENTS = {};
MY_AVATAR_SEX = 0;
PREVIEV_AVATAR_COMPONENTS = {};

menu.window_switch_profile.avatarPanel = getElementEX(
	menu.window_switch_profile,
	anchorLTRB,
	XYWH(0, 0, LayoutWidth, LayoutHeight),
	false,
	{
		colour1 = BLACKA(50)
	}
);

menu.window_switch_profile.avatarPanel.popup = getElementEX(
	menu.window_switch_profile.avatarPanel,
	anchorNone,
	XYWH(menu.window_switch_profile.avatarPanel.width / 2 - 310, menu.window_switch_profile.avatarPanel.height / 2 - 123, 621, 400),
	true,
	{
		texture = 'classic/edit/avw_1.png'
	}
);

menu.window_switch_profile.avatarPanel.popup.preview = getElementEX(
	menu.window_switch_profile.avatarPanel.popup, 
	anchorLTRB,
	XYWH(
		16,
		17, 
		80,
		100
	),
	true,
	{
		texture = 'Avatars/unknow.png'
	}
);

menu.window_switch_profile.avatarPanel.popup.settings = getElementEX(
	menu.window_switch_profile.avatarPanel.popup, 
	anchorLTRB,
	XYWH(
		110,
		10, 
		500,
		340
	),
	true,
	{
		colour1 = WHITEA()
	}
);

menu.window_switch_profile.avatarPanel.popup.saveBtn = clButton(
	menu.window_switch_profile.avatarPanel.popup, 
	235,
	328,
	150,
	18, 
	loc(1173), -- ok
	'savePreviewMyAvatar();',
	{
		texture = 'classic/edit/menu_button_small_l.png',
		texture2 = 'classic/edit/menu_button_small_c.png',
		texture3 = 'classic/edit/menu_button_small_r.png'
	}
);

menu.window_switch_profile.avatarPanel.popup.randomBtn = clButton(
	menu.window_switch_profile.avatarPanel.popup, 
	235, 
	352, 
	150,
	18, 
	loc(1100), -- random face
	'randomPreviewMyAvatar();',
	{
		texture = 'classic/edit/menu_button_small_l.png',
		texture2 = 'classic/edit/menu_button_small_c.png',
		texture3 = 'classic/edit/menu_button_small_r.png'
	}
);

menu.window_switch_profile.avatarPanel.popup.closeBtn = clButton(
	menu.window_switch_profile.avatarPanel.popup, 
	235, 
	376, 
	150,
	18, 
	loc(828), -- close
	'hideAvatarGenerator();',
	{
		texture = 'classic/edit/menu_button_small_l.png',
		texture2 = 'classic/edit/menu_button_small_c.png',
		texture3 = 'classic/edit/menu_button_small_r.png'
	}
);

function showAvatarGenerator()
	setVisible(menu.window_switch_profile.avatarPanel, true);

	local avatarFromProfile = loadAvatarComponentsFromProfile();
	
	if avatarFromProfile ~= nil then
		local components = {};

		for i = 1, #avatarFromProfile do
			components = addToArray(components, parseInt(avatarFromProfile[i]));
		end;

		MY_AVATAR_ID = previewAvatar(avatarFromProfile);
		MY_AVATAR_COMPONENTS = components;
		MY_AVATAR_SEX = parseInt(avatarFromProfile[1]);
	else
		local multiplayerAvatarSettings = OW_XICHT_GET_MULTI_SETTINGS();
		local components = {};
		local componentsArray = stringNumberToArray(multiplayerAvatarSettings.PARTS);

		for i = 1, #componentsArray do
			components = addToArray(components, parseInt(componentsArray[i]));
		end;

		-- override nation with sex
		components[1] = parseInt(multiplayerAvatarSettings.SEX);

		MY_AVATAR_ID = previewAvatar(components);
		MY_AVATAR_COMPONENTS = components;
		MY_AVATAR_SEX = parseInt(multiplayerAvatarSettings.SEX);
	end;

	if MY_AVATAR_ID then
		SGUI_settextureid(menu.window_switch_profile.avatarPanel.popup.preview.ID, MY_AVATAR_ID, 80, 100, 80, 100);
		PREVIEV_AVATAR_COMPONENTS = copytable(MY_AVATAR_COMPONENTS);
	end;

	refreshAvatarSettings();
end;

function hideAvatarGenerator()
	setVisible(menu.window_switch_profile.avatarPanel, false);
end;

function refreshAvatarSettings()
	sgui_deletechildren(menu.window_switch_profile.avatarPanel.popup.settings.ID);

	local components = {
		'SEX',
		'CHEEK',
		'NECK',
		'FACE',
		'BEARD',
		'NOSE',
		'EAR',
		'EYE',
		'EYEBROW',
		'GLASSES',
		'HAIR',
		'MOUTH'
	};

	local componentsID = {
		1,
		4,
		2,
		3,
		11,
		6,
		8,
		5,
		9,
		13,
		10,
		7
	};
	
	local componentsNames = {
		loc(1101), -- SEX
		loc(1104), -- CHEEK
		loc(1102), -- NECK
		loc(1112), -- FACE
		loc(1110), -- BREAD
		loc(1105), -- NOSE
		loc(1107), -- EAR
		loc(1103), -- EYES
		loc(1108), -- EYEBROW
		loc(1111), -- GlASSES
		loc(1109), -- HAIR
		loc(1106), -- MOUTH
	};

	local parts = AVATARS_COMPONENTS.MALE;

	if MY_AVATAR_SEX > 0 then
		parts = AVATARS_COMPONENTS.FEMALE;
	end;

	getLabelEX(
		menu.window_switch_profile.avatarPanel.popup.settings,
		anchorT, 
		XYWH(
			10,
			6,
			240,
			14
		), 
		nil,
		SGUI_widesub(componentsNames[1], 1, 27),
		{
			font_colour = BLACK(),
			nomouseevent = true,
			font_name = BankGotic_14
		}
	);

	clComboBox(
		menu.window_switch_profile.avatarPanel.popup.settings,
		10,
		24,
		{
			loc(1168), -- Male
			loc(1169)  -- Female 
		},
		MY_AVATAR_SEX + 1,
		'updatePreviewMyAvatarSex("INDEX")',
		{}
	);

	for i = 2, #components do
		getLabelEX(
			menu.window_switch_profile.avatarPanel.popup.settings,
			anchorT, 
			XYWH(
				10 + (((i - 1) % 2) * 240),
				6 + (math.floor((i - 1) / 2) * 40),
				240,
				14
			), 
			nil,
			SGUI_widesub(componentsNames[i], 1, 27),
			{
				font_colour = BLACK(),
				nomouseevent = true,
				font_name = BankGotic_14
			}
		);

		clComboBox(
			menu.window_switch_profile.avatarPanel.popup.settings,
			10 + (((i - 1) % 2) * 240),
			24 + (math.floor((i - 1) / 2) * 40),
			parts[components[i]].PARTS,
			PREVIEV_AVATAR_COMPONENTS[componentsID[i]],
			'updatePreviewMyAvatar(' .. componentsID[i] .. ', "INDEX")',
			{}
		);
	end;
end;

function updatePreviewMyAvatar(ID, INDEX)
	PREVIEV_AVATAR_COMPONENTS[ID] = INDEX;
	SGUI_settextureid(menu.window_switch_profile.avatarPanel.popup.preview.ID, previewAvatar(PREVIEV_AVATAR_COMPONENTS), 80, 100, 80, 100);
end;

function updatePreviewMyAvatarSex(INDEX)
	MY_AVATAR_SEX = INDEX - 1;

	local parts = AVATARS_COMPONENTS.MALE;

	if MY_AVATAR_SEX > 0 then
		parts = AVATARS_COMPONENTS.FEMALE;
	end;

	PREVIEV_AVATAR_COMPONENTS[1] = MY_AVATAR_SEX;

	for i = 2, #PREVIEV_AVATAR_COMPONENTS do
		PREVIEV_AVATAR_COMPONENTS[i] = 1;
	end;

	SGUI_settextureid(menu.window_switch_profile.avatarPanel.popup.preview.ID, previewAvatar(PREVIEV_AVATAR_COMPONENTS), 80, 100, 80, 100);
	refreshAvatarSettings();
end;

function randomPreviewMyAvatar()
	local sex = math.random(0, 1);
	local parts = AVATARS_COMPONENTS.MALE;

	if sex > 0 then
		parts = AVATARS_COMPONENTS.FEMALE;
	end;

	local components = {
		'SEX',
		'CHEEK',
		'NECK',
		'FACE',
		'BEARD',
		'NOSE',
		'EAR',
		'EYE',
		'EYEBROW',
		'GLASSES',
		'HAIR',
		'MOUTH'
	};

	local componentsID = {
		1,
		4,
		2,
		3,
		11,
		6,
		8,
		5,
		9,
		13,
		10,
		7
	};

	MY_AVATAR_SEX = sex;
	PREVIEV_AVATAR_COMPONENTS[1] = sex;

	for i = 2, #componentsID do
		PREVIEV_AVATAR_COMPONENTS[componentsID[i]] = math.random(1, #parts[components[i]].PARTS);
	end;

	SGUI_settextureid(menu.window_switch_profile.avatarPanel.popup.preview.ID, previewAvatar(PREVIEV_AVATAR_COMPONENTS), 80, 100, 80, 100);
	refreshAvatarSettings();
end;

function savePreviewMyAvatar()
	setMyHeroAvatar(MY_AVATAR_SEX, PREVIEV_AVATAR_COMPONENTS);
	loadAvatars();
	setVisible(menu.window_switch_profile.avatarPanel, false);
end;

