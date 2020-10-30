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
TID_Main_Menu_Campaign_Ape_Hint = 5100;

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
end

--[[
sgui_getcallback(test.ID,CALLBACK_MOUSEOVER)
--]]