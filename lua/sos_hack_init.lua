HACK_MODE = parseInt(MOD_DATA.Hack_Mode); -- define if hack mode is active (check mod.ini)
INIT_HACK_MODE = false;

function displayHackPanel()
	debug('override');
end;

function showHackPanel()
	if (INIT_HACK_MODE == false) then
		INIT_HACK_MODE = true;
		include('sos_hack');
	end;

	displayHackPanel();
end;