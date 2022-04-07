--[[
	Global array module
--]]
COMBOBOX_LIST = {}; -- [ ID ]
PROMPT_LIST = {};  -- [ ID, INPUT ]
LISTBOX_LIST = {}; --[ ID, ITEMS, SELECTED ]
CUSTOM_LISTBOX_LIST = {};
SKIRMISH_ALLOWED_MAPS = {};
MOD_DATA = {};
CAMPAIGN_ID = 0;
IN_LOBBY = false;

function FROMOW_MODS_GETINI(DATA)
    SKIRMISH_ALLOWED_MAPS = DATA.Skirmish_Maps;
    MOD_DATA = DATA;
end;
