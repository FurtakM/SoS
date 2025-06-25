function FROMOW_MAP_START(MAPPATH)
	local PARAMS = {
		DESC = 9951,
		WIN = {
			9911
		},
		LOSE = {
			9913
		},
		POINTSG = {
			9921,
			9922,
			9923
		},
		POINTSL = {
			9931
		}
	};


	setMapDescription(buildMapDescription(PARAMS));
	turnMapDescription(true);
end;

function FROMOW_MAP_END()
    turnMapDescription(false);
end;