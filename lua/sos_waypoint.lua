FACTORY_WAYPOINTS = {};
FACTORY_ACTIVE_WAYPOINT = {ID = 0, UNIT_ID = 0, X = 0, Y = 0};

function displayFactoryWaypointXY(SIDE, UNIT_ID, X, Y)
	if FACTORY_ACTIVE_WAYPOINT.X ~= X and FACTORY_ACTIVE_WAYPOINT.Y ~= Y then
		clearFactoryWaypoint();

		local hex = OW_HEXTOSCREEN(parseInt(X), parseInt(Y));

		gamewindow.overlay.waypoint = getElementEX(
		    gamewindow.overlay,
		    anchorNone,
		    XYWH(hex.X - 15, hex.Y - 12, 30, 24),
		    true,
		    {
		        texture = 'SGUI/waypoint/FactoryWaypoint' .. SIDE .. '.png'
		    }
		);

		FACTORY_ACTIVE_WAYPOINT = {ID = gamewindow.overlay.waypoint.ID, UNIT_ID = UNIT_ID, X = X, Y = Y};
	end;
end;

function clearFactoryWaypoint()
	if FACTORY_ACTIVE_WAYPOINT.ID > 0 then
		sgui_delete(FACTORY_ACTIVE_WAYPOINT.ID);
		FACTORY_ACTIVE_WAYPOINT = {ID = 0, UNIT_ID = 0, X = 0, Y = 0};
	end;
end

function setFactoryWaypointXY(SIDE, ID, X, Y)
	FACTORY_WAYPOINTS[ID] = {SIDE, ID, X, Y};
end;

function resetFactoryWaypoint()
	FACTORY_WAYPOINTS = {};
end;