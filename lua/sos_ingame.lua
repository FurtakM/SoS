OLD_FROMOW_INFOPANEL_UPDATE = FROMOW_INFOPANEL_UPDATE;
SELECTED_UNIT = nil;

function FROMOW_INFOPANEL_UPDATE(DATA)
  OLD_FROMOW_INFOPANEL_UPDATE(DATA);
  SELECTED_UNIT = DATA;
end;

OLD_GAMEWINDOW_ONTICK = gamewindow.overlay.onTick;

function gamewindow.overlay.onTick(FRAMETIME)
	OLD_GAMEWINDOW_ONTICK(FRAMETIME);

    if getVisible(game) then
        if SELECTED_UNIT then
        	if parseInt(SELECTED_UNIT.ID) > 0 and parseInt(SELECTED_UNIT.KIND) == 3 and FACTORY_WAYPOINTS[parseInt(SELECTED_UNIT.ID)] ~= nil and (FACTORY_ACTIVE_WAYPOINT.UNIT_ID == 0 or FACTORY_ACTIVE_WAYPOINT.UNIT_ID == parseInt(SELECTED_UNIT.ID)) then
        		local point = FACTORY_WAYPOINTS[parseInt(SELECTED_UNIT.ID)];
        		displayFactoryWaypointXY(parseInt(point[1]), parseInt(point[2]), parseInt(point[3]), parseInt(point[4]));
        	elseif FACTORY_ACTIVE_WAYPOINT ~= nil then
        		clearFactoryWaypoint();
        	end;
        end;
    end;
end;