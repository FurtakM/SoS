function FROMOW_MAP_START(MAPPATH)
	local PARAMS = {
		DESC = 9950,
		WIN = {
			9914
		},
		LOSE = {
			9913
		},
		POINTSG = {
			9921,
			9922,
			9924
		},
		POINTSL = {
			9931,
			9932
		}
	};


	setMapDescription(buildMapDescription(PARAMS));
	turnMapDescription(true);
end;

function FROMOW_MAP_END()
    turnMapDescription(false);
end;