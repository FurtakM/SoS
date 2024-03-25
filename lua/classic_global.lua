--[[
	Global array module
--]]
COMBOBOX_LIST = {}; -- [ ID ]
PROMPT_LIST = {};  -- [ ID, INPUT ]
LISTBOX_LIST = {}; --[ ID, ITEMS, SELECTED ]
CUSTOM_LISTBOX_LIST = {};
SKIRMISH_ALLOWED_MAPS = {}; -- check mod.ini
MOD_DATA = {};
CAMPAIGN_ID = 0;
IN_LOBBY = false;

function FROMOW_MODS_GETINI(DATA)
	if (DATA.Skirmish_Maps ~= nil) then
    	SKIRMISH_ALLOWED_MAPS = DATA.Skirmish_Maps;
	end;

    MOD_DATA = DATA;
end;
