function FROMOW_DEBUG_SAIL(DATA)
	clDebug(DATA);
end;

-- OW_DEBUG_SAIL();

setColour1(owconsole.skyback, RGBA(0, 107, 133, 150));
setColour1(owconsole.back, RGBA(0, 107, 133, 125));
setColour1(owconsole.edit, RGBA(0, 8, 11, 200));


command = {};

function command:chat(PARAMETERS)
	for _, VALUE in ipairs(PARAMETERS) do
		if (string.lower(VALUE) == 'off') then
  			OW_CONSOLE_CALL_CALLBACK(0, 'The chat has been hidden.');
  			return;
  		end;
  		
  		if (string.lower(VALUE) == 'on') then
  			OW_CONSOLE_CALL_CALLBACK(0, 'The chat has been revealed.');
  			return;
  		end;
  	end;

  	OW_CONSOLE_CALL_CALLBACK(0, 'Invalid value for command.');
end;

function command:music(PARAMETERS)
	local VALUE = PARAMETERS[1];

	if (VALUE ~= nil) then
		local number = parseInt(VALUE);

		if (number ~= nil) then
			local realValue = 5000 / 100 * number;
	        OW_settings_setvolume(VOLUME_MUSIC, realValue);
	    	OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_VOLUME_MUSIC', realValue);
	    	OW_CONSOLE_CALL_CALLBACK(0, 'Ingame music volume set to ' .. number .. '%');
			return;
		end;
		
		if (string.lower(VALUE) == 'mute') then
	        OW_settings_setvolume(VOLUME_MUSIC, 0);
	    	OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_VOLUME_MUSIC', 0);
	    	OW_CONSOLE_CALL_CALLBACK(0, 'The music has been turned off.'); 			
			return;
		end;

		if (string.lower(VALUE) == 'menu' and PARAMETERS[2] ~= nil) then
			local number = parseInt(PARAMETERS[2]);

			if (number ~= nil) then
				local realValue = 5000 / 100 * number;
		        OW_settings_setvolume(VOLUME_MUSIC_MENU, realValue);
		        OW_SETTING_WRITE('OPTIONS', 'MUSIC_MENU', realValue);
		    	OW_CONSOLE_CALL_CALLBACK(0, 'Main menu music volume set to ' .. number .. '%');
				return;
			end;

			if (string.lower(PARAMETERS[2]) == 'mute') then
		        OW_settings_setvolume(VOLUME_MUSIC_MENU, 0);
		        OW_SETTING_WRITE('OPTIONS', 'MUSIC_MENU', 0);
		    	OW_CONSOLE_CALL_CALLBACK(0, 'The main menu music has been turned off.'); 			
				return;
			end;
		end;
	end;

  	OW_CONSOLE_CALL_CALLBACK(0, 'Invalid value for command.');
end;

OW_CONSOLE_ADD_COMMAND('chat', command.chat, command, 'Turn On/Off chat. Allowed values: `on`, `off`');
OW_CONSOLE_ADD_COMMAND('music', command.music, command, 'Sets the music volume. For example: `music 100` to set it to full volume. \nUse `music menu <number>` to change the volume of the music in the menu. \nAllowed values: <number>, `mute`, `menu <number>`, `menu mute`.');
