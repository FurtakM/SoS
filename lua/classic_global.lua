--[[
	Global array module
--]]
COMBOBOX_LIST = {}; -- [ ID ]
PROMPT_LIST = {};  -- [ ID, INPUT ]
LISTBOX_LIST = {}; --[ ID, ITEMS, SELECTED ]
SKIRMISH_ALLOWED_MAPS = {};
MOD_DATA = {};
CAMPAIGN_ID = 0;

function FROMOW_MODS_GETINI(DATA)
    SKIRMISH_ALLOWED_MAPS = DATA.Skirmish_Maps;
    MOD_DATA = DATA;
end;
