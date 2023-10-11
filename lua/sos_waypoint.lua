FACTORY_WAYPOINTS = {};
FACTORY_ACTIVE_WAYPOINT = {ID = 0, UNIT_ID = 0, X = 0, Y = 0};

function displayFactoryWaypointXY(SIDE, UNIT_ID, X, Y)
	if FACTORY_ACTIVE_WAYPOINT.X ~= X or FACTORY_ACTIVE_WAYPOINT.Y ~= Y then
		clearFactoryWaypoint();

		local hex = OW_HEXTOSCREEN(X, Y);

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
	FACTORY_WAYPOINTS[ID] = {parseInt(SIDE), parseInt(ID), parseInt(X), parseInt(Y)};
end;

function resetFactoryWaypoint()
	FACTORY_WAYPOINTS = {};
end;

WAREHOUSE_GATEHRING_POINTS = {};
WAREHOUSE_ACTIVE_POINT = {ID = 0, UNIT_ID = 0, X = 0, Y = 0};

function displayWarehouseGatheringPointXY(SIDE, UNIT_ID, X, Y)
	if WAREHOUSE_ACTIVE_POINT.X ~= X or WAREHOUSE_ACTIVE_POINT.Y ~= Y then
		clearWarehouseGatheringPoint();

		local hex = OW_HEXTOSCREEN(X, Y);

		gamewindow.overlay.waypoint = getElementEX(
		    gamewindow.overlay,
		    anchorNone,
		    XYWH(hex.X - 15, hex.Y - 12, 30, 24),
		    true,
		    {
		        texture = 'SGUI/waypoint/WarehouseGatheringPoint' .. SIDE .. '.png'
		    }
		);

		WAREHOUSE_ACTIVE_POINT = {ID = gamewindow.overlay.waypoint.ID, UNIT_ID = UNIT_ID, X = X, Y = Y};
	end;
end;

function clearWarehouseGatheringPoint()
	if WAREHOUSE_ACTIVE_POINT.ID > 0 then
		sgui_delete(WAREHOUSE_ACTIVE_POINT.ID);
		WAREHOUSE_ACTIVE_POINT = {ID = 0, UNIT_ID = 0, X = 0, Y = 0};
	end;
end

function setWarehouseGatheringPointXY(SIDE, ID, X, Y)
	WAREHOUSE_GATEHRING_POINTS[ID] = {parseInt(SIDE), parseInt(ID), parseInt(X), parseInt(Y)};
end;

function resetWarehouseGatheringPoints()
	WAREHOUSE_GATEHRING_POINTS = {};
end;