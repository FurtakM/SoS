PROFILES_DATA = {};
PROFILE_NAME = '';

function FROMOW_PROFILES(DATA)
--[[
DATA
	COUNT : Integer;
	PROFILE : Array of
		DATA: Array of
			NAME : String
		SELECTED : Boolean
--]]	
	PROFILES_DATA = {};
	local profiles = {};
	local selected = 0;

	if DATA.COUNT > 0 then
		for i = 1, DATA.COUNT do
			profiles[i] = DATA.PROFILE[i].DATA.NAME;
			PROFILES_DATA[i] = DATA.PROFILE[i];
			
			if DATA.PROFILE[i].SELECTED then
				selected = i;
				getAvatarTexture(DATA.PROFILE[i].AVATAR, menu.window_profile.panel.avatar);
				ReloadAvatar();
			end;
		end;
	end;

	clSetListItems(menu.window_profile.panel.list, profiles, selected, 'changeProfile("VALUE");', {});
end;

function FROMOW_SWITCHPROFILE(DATA)
--[[
DATA
	NAME : String
	DIR  : String
        DATA - Varies
--]]

	PROFILE_NAME = DATA.NAME;
	setText(menu.window.user, loc(TID_Main_Menu_User) .. ': ' .. DATA.NAME);
	setText(profile_label, DATA.NAME);
    currentProfileDir = DATA.DIR;
end;


function getProfilesDirectory(NAME)
	for i = 1, length(PROFILES_DATA) do
		if (PROFILES_DATA[i].DATA.NAME == NAME) then
			return PROFILES_DATA[i].NAME;
		end;
	end;
end;

function createProfile(ID)
	local name = getTextID(ID);

	if (strlen(name) < 3) then
		return;
	end;
	
	local tmpName = OW_profile_new(name);

	if tmpName ~= '' then
		clClosePrompt(menu.window_profile.panel.promptNew.ID);
        changeProfile(tmpName);
	end;
end;

function editProfile(ID)
	local realName = getProfilesDirectory(clGetListSelectedItem(menu.window_profile.panel.list.ID));
	local changedName = getTextID(ID);

	if (realName == nil) then
		return;
	end;

	if OW_profile_rename(realName, changedName) then
		clClosePrompt(menu.window_profile.panel.promptEdit.ID);
		OW_profile_init();
		changeProfile(changedName);
	end;
end;

function deleteProfile()
	local name = getProfilesDirectory(clGetListSelectedItem(menu.window_profile.panel.list.ID));

	if (OW_profile_delete(name)) then
		OW_profile_init();
		changeProfile(PROFILES_DATA[1].DATA.NAME);
	end;
end;

function changeProfile(NAME)
	OW_profile_switch(NAME);
	showProfile(0);
	ReloadAvatar();
end;

menu.window_profile = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

menu.window_profile.panel = getElementEX(
    menu.window_profile, 
    anchorL, 
    XYWH(LayoutWidth / 2 - 220, LayoutHeight / 2 - 155, 440, 310), 
    true,
    {
        texture = 'classic/edit/profile_window.png'
    }
);

menu.window_profile.panel.list = clListBox(
	menu.window_profile.panel, 
	XYWH(8, 20, 224, 279), 
	{}, 
	1, 
	'', 
	{}
);

menu.window_profile.panel.avatar = getElementEX(
    menu.window_profile.panel, 
    anchorL, 
    XYWH(302, 165, 64, 64), 
    true,
    {}
);

menu.window_profile.panel.promptNew = clPrompt(
	'createProfile(VALUE)', 
	{}
);

menu.window_profile.panel.promptEdit = clPrompt(
	'editProfile(VALUE)', 
	{}
);

menu.window_profile.panel.add = clButton(
    menu.window_profile.panel, 
    243, 
    27,
    180, 
    30,
    loc(TID_Main_Menu_Current_Player_Add), 
    'clOpenPrompt(' .. menu.window_profile.panel.promptNew.ID .. ', "");',
    {}
);

menu.window_profile.panel.edit = clButton(
    menu.window_profile.panel, 
    243, 
    64,
    180, 
    30,
    loc(TID_Main_Menu_Current_Player_Rename), 
    'clOpenPrompt(' .. menu.window_profile.panel.promptEdit.ID .. ', clGetListSelectedItem(' .. menu.window_profile.panel.list.ID .. '));',
    {}
);

menu.window_profile.panel.delete = clButton(
    menu.window_profile.panel, 
    243, 
    101,
    180, 
    30,
    loc(TID_Main_Menu_Current_User_Erase_profile), 
    'deleteProfile();',
    {}
);

menu.window_profile.panel.cancel = clButton(
    menu.window_profile.panel, 
    243, 
    261,
    180, 
    30,
    loc(TID_msg_Cancel), 
    'showProfile(0);',
    {}
);


function showProfile(mode)
    if mode > 0 then
        showMenuButton(0);
        setVisible(menu.window_profile, true);
        OW_profile_init();
    else
        showMenuButton(1);
        setVisibleAll(PROMPT_LIST, false);
        setVisible(menu.window_profile, false);
    end;
end;