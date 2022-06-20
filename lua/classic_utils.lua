--[[
    Author: Serpent
    03-2020
--]]

TID_Main_Menu_User = 494;
TID_Main_Menu_Play = 804;
TID_Main_Menu_Skirmish = 539;
TID_Main_Menu_Default = 419;
TID_Main_Menu_Password = 1041;
TID_Main_Menu_UsePassword = 1043;
TID_Main_Menu_AllAchivs = 5000;
TID_Main_Menu_SteamOverlay = 5001;
TID_Main_Menu_Options_Old_Type_Graph_Short = 5002;
TID_Main_Menu_Options_Transparency_Fill_Short = 5003;
TID_Choose_Mod = 5004;
TID_msg_Shortcuts = 5005;
TID_Main_Menu_Options_Lang_Options = 5006;
TID_Main_Menu_Options_Lang_Text_Options = 5007;
TID_Main_Menu_Options_Lang_Audio_Options = 5008;
TID_Main_Menu_Options_Lang_Audio_Hint = 5009;
TID_Main_Menu_Options_Lang_Text_Hint = 5010;
TID_Main_Menu_Options_Lang_Label = 5011;
TID_Main_Menu_Options_Graphics_Resolution = 5012;
TID_Main_Menu_Options_Graphics_Windowed = 5013;
TID_Main_Menu_Skirmish_ChangeMap = 5014;
TID_Main_Menu_Mod_Old_Ver = 5015;
TID_Main_Menu_Options_Switch_Interface = 5016;
TID_Main_Menu_Back_To_Menu = 5017;
TID_Main_Menu_Change_Name = 5018;
TID_Main_Menu_Enter_IP = 5019;
TID_Main_Menu_Filter_Achiv = 5020;
TID_Main_Menu_Filter_Achiv_All = 5021;
TID_Main_Menu_Filter_Achiv_Done = 5022;
TID_Main_Menu_Filter_Achiv_Undone = 5023;
TID_Main_Menu_Options_Sound_Label = 5024;
TID_Main_Menu_Options_Main_Screen = 5025;
TID_Main_Menu_Options_Graphics_Label = 5026;
TID_Main_Menu_Options_Controls_Options = 5027;
TID_Main_Menu_Options_Controls_Label = 5028;
TID_Main_Menu_Options_Game_Label = 5029;
TID_Main_Menu_Options_Game_HoldGround = 5030;
TID_Main_Menu_Options_Game_Wounded = 5031;
TID_Main_Menu_Options_Game_NonCombat = 5032;
TID_Main_Menu_Options_Game_Vehicles = 5033;
TID_Main_Menu_Options_Interface_Options = 5034;
TID_Main_Menu_Options_Interface_Label = 5035;
TID_Main_Menu_Options_Objectives_Desc = 5036;
TID_Main_Menu_SteamOverlay_Desc = 5037;
TID_Main_Menu_ChangeAvatar = 5038;

TID_Main_Menu_Campaign_Ape_Hint = 5100;
TID_Main_Menu_Campaign_X1_Hint = 5102;
TID_Main_Menu_Campaign_X2_Hint = 5104;

VK_TAB = 9;
VK_ENTER = 13;
VK_ESC = 27;
VK_F1 = 112;
VK_F2 = 113;
VK_F3 = 114;
VK_F4 = 115;
VK_F5 = 116;
VK_F6 = 117;
VK_TILDE = 192;


function parseInt(value)
    if (type(value) == 'boolean') then
        return value and 1 or 0;
    end;

	return tonumber(value);
end;

function parseBool(value)
    return toboolean(value);
end;

function strlen(str)
  return SGUI_widelen(str);
end;

function isArray(var)
	if type(var) ~= 'table' then
		return false;
	end;

	for k, v in pairs(var) do
		return true;
	end;

	return false;
end

function length(t)
  	local count = 0;

  	if (t == nil) then
  		return count;
  	end;
  	
  	for _ in pairs(t) do 
  		count = count + 1; 
  	end;
  	
  	return count;
end;

function addToArray(array, element)
    array[#array + 1] = element;
    return array;
end;

function insertToArray(array, element, index)
    local size = #array;

    if (index < 1 or index >= size) then
        return addToArray(array, element);
    end;

    local tmp = {};

    for i = 1, index do
        tmp = addToArray(tmp, array[i]);
    end;    

    tmp = addToArray(tmp, element);

    for i = index + 1, size do
        tmp = addToArray(tmp, array[i]);
    end;

    return tmp;
end;

function inArray(array, element)
   for i = 1, #array do
      if array[i] == element then 
         return true;
      end;
   end;

   return false;
end;

function split(source, delimiters)
    local elements = {}
    local pattern = '([^' .. delimiters .. ']+)'
    
    string.gsub(source, pattern, function(value) 
            elements[#elements + 1] = value;  
        end
    );
    
    return elements;
end;

function getLanguagesKey()
    return {
        'ENG',
        'CZE',
        'FRA',
        'GER',
        'POL',
        'SPA',
        'JAP',        
        'RUS',
        'SLO',        
        'SWE',
        'ITA',
    }
end;

function getLanguages()
    return {
        'English',
        'Ceština',
        'Français',
        'Deutsche',
        'Polski',
        'Español',
        'Nihonjin',        
        'Pусский',
        'Slovenščina',        
        'Svenska',
        'Italiano',
    }
end;

function getAudioLanguages()
    return {
        'English',
        'Ceština',
        'Français',
        'Deutsche',
        'Polski',
        'Español',
    }
end;

function getSubtitles()
    return {
        loc(TID_Options_Subtitles_Off),
        loc(TID_Options_Subtitles_Video),
        loc(TID_Options_Subtitles_Audio),
        loc(TID_Options_Subtitles_Both)
    };
end;

function getWindowedList()
    return {
        loc(TID_Options_Windowed_Fullscreen),
        loc(TID_Options_Windowed_Window),
        loc(TID_Options_Windowed_Bordeless)
    };
end;

function getAchivFilter()
    return {
        loc(TID_Main_Menu_Filter_Achiv_All),
        loc(TID_Main_Menu_Filter_Achiv_Done),
        loc(TID_Main_Menu_Filter_Achiv_Undone)
    };
end;

function getAchivFilterMission() 
    local tmp = {
        loc(TID_Main_Menu_Filter_Achiv_All)
    };

    for i = 1, 20 do
        tmp[i+1] = loc(417) .. ' ' .. i;
    end;

    return tmp;
end;

function setVisibleAll(ARRAY, MODE)
    local result = false;

    for _, v in pairs(ARRAY) do
        if (getVisibleID(v.ID)) then
            setVisibleID(v.ID, MODE);
            result = true;
        end;
    end;

    return result;
end;

function getOneOfVisible(ARRAY)
    for _, v in pairs(ARRAY) do
        if (getVisibleID(v.PARENT)) then
            return true;
        end;
    end;

    return false;
end;

function getWID(ID)
    return sgui_get(ID, PROP_W);
end;

function getHID(ID)
    return sgui_get(ID, PROP_H);
end;

function getXID(ID)
    return sgui_get(ID, PROP_X);
end;

function getYID(ID)
    return sgui_get(ID, PROP_Y);
end;

function getVisibleID(ID)
    return sgui_get(ID, PROP_VISIBLE);
end;

function strlen(TEXT)
    return string.len(TEXT);
end;

function text(TEXT, MAXLENGTH, APPENDCHAR)
    if (TEXT == nil) then
        return '';
    end;

    if (strlen(TEXT) > MAXLENGTH) then
        return SGUI_widesub(TEXT, 1, MAXLENGTH) .. APPENDCHAR;
    end;

    return TEXT;
end;

function compareVersions(VERSION, VERSION_TO_COMPARE) -- #BOOL
    if (not VERSION or not VERSION_TO_COMPARE) then
        return true;
    end;

    local v1 = split(VERSION, '.');
    local v2 = split(VERSION_TO_COMPARE, '.');

    for i = 1, #v1 do
        if (parseInt(v1[i]) ~= parseInt(v2[i])) then
            return (parseInt(v1[i]) > parseInt(v2[i]));
        end;
    end;

    return true;
end;

--[[function compareVersions(VERSION, VERSION_TO_COMPARE) -- #BOOL
    if (not VERSION or not VERSION_TO_COMPARE) then
        return true;
    end;

    return OW_VERSION_LOWER(VERSION_TO_COMPARE,VERSION) or OW_VERSION_SAME(VERSION_TO_COMPARE,VERSION);
end;--]]

function setCheckedID(ELEMENT_ID, VALUE)
    return sgui_set(ELEMENT_ID, PROP_CHECKED, VALUE);
end;

function getCheckedID(ELEMENT_ID)
    return sgui_get(ELEMENT_ID, PROP_CHECKED);
end;

function setTexture2ID(ELEMENT_ID, VALUE)
    set_Property(ELEMENT_ID, PROP_TEXTURE2, VALUE);
end;

function getXYWH(ELEMENT)
    return {
        X = sgui_get(ELEMENT.ID, PROP_X),
        Y = sgui_get(ELEMENT.ID, PROP_Y),
        W = sgui_get(ELEMENT.ID, PROP_W),
        H = sgui_get(ELEMENT.ID, PROP_H)
    }
end;

function copy(obj, seen)
    if type(obj) ~= 'table' then 
        return obj; 
    end;

    if seen and seen[obj] then 
        return seen[obj];
    end;

    local s = seen or {};
    local res = setmetatable({}, getmetatable(obj));
  
    s[obj] = res;
    
    for k, v in pairs(obj) do 
        res[copy(k, s)] = copy(v, s);
    end;
  
    return res;
end;

function stringToArray(str)
    local t = {};

    for i = 1, #str do
        t[i] = str:sub(i, i);
    end;

    return t;
end;

function setFocusID(ID)
    setFocus({ID=ID});
end;

--keep this here untill it gets mereged into master utils
function invokeCallback(ELEMENT, _TYPE, REPLACE_TABLE)
	local str = get_Callback(ELEMENT.ID, _TYPE);
	
	if (REPLACE_TABLE) then
		for k,v in pairs(REPLACE_TABLE) do
			str = str:gsub('%%' .. k,v);
		end;
	end;

	return runstring(str);
end;

function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"));
end

function unionArray(a, b)
    local result = {table.unpack(a)};
    table.move(b, 1, #b, #result + 1, result);

    return result;
end
