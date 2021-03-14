--[[
    Author: Serpent
    03-2020
--]]

TID_Main_Menu_User = 494;
TID_Main_Menu_Play = 804;
TID_Main_Menu_Skirmish = 539;
TID_Main_Menu_Default = 419;
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
TID_Main_Menu_Campaign_Ape_Hint = 5100;
TID_Main_Menu_Campaign_X1_Hint = 5102;
TID_Main_Menu_Campaign_X2_Hint = 5104;

VK_F1 = 112;
VK_F2 = 113;
VK_F3 = 114;
VK_F4 = 115;
VK_F5 = 116;
VK_F6 = 117;
VK_TILDE = 192;

function parseInt(value)
	return tonumber(value);
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
        if (parseInt(v1[i]) < parseInt(v2[i])) then
            return false;
        end;
    end;

    if (parseInt(v1[#v1]) == parseInt(v2[#v1])) then
        return true;
    end;

    return true;
end;

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


--[[
sgui_getcallback(test.ID,CALLBACK_MOUSEOVER)
--]]