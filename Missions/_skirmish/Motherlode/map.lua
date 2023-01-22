function FROMOW_MAP_START(MAPPATH)
    if (SKIRMISH_GAME_TYPE == 1) then
    	initEcoPanel();
    end;
end;

function FROMOW_MAP_END()
	if (SKIRMISH_GAME_TYPE == 1) then
    	hideEcoPanel();
	end;
end;