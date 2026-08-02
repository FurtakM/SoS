function FROMOW_MAP_START(MAPPATH)
	--registryAchievs({'ACH_E','ACH_AH','ACH_OOL','ACH_NL','ACH_TD','ACH_WC'});
	MULTIPLAYER_ROOM_MAP_EXTRA_DATA.mapPosSides = nil;
	turnMapDescription(true);
end;

function FROMOW_MAP_END()
    turnMapDescription(false);
end;