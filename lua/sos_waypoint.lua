FACTORY_WAYPOINTS = {};
FACTORY_ACTIVE_WAYPOINT = {
	ID = 0,
	UNIT_ID = 0,
	X = 0,
	Y = 0
};

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

		FACTORY_ACTIVE_WAYPOINT = {
			ID = gamewindow.overlay.waypoint.ID,
			UNIT_ID = UNIT_ID,
			X = X,
			Y = Y
		};
	end;
end;

function clearFactoryWaypoint()
	if FACTORY_ACTIVE_WAYPOINT.ID > 0 then
		sgui_delete(FACTORY_ACTIVE_WAYPOINT.ID);

		FACTORY_ACTIVE_WAYPOINT = {
			ID = 0,
			UNIT_ID = 0,
			X = 0,
			Y = 0
		};
	end;
end

function setFactoryWaypointXY(SIDE, ID, X, Y)
	FACTORY_WAYPOINTS[ID] = {
		parseInt(SIDE),
		parseInt(ID),
		parseInt(X),
		parseInt(Y)
	};
end;

function resetFactoryWaypoint()
	FACTORY_WAYPOINTS = {};
end;

WAREHOUSE_GATEHRING_POINTS = {};
WAREHOUSE_ACTIVE_POINT = {
	ID = 0,
	UNIT_ID = 0,
	X = 0,
	Y = 0
};

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

		WAREHOUSE_ACTIVE_POINT = {
			ID = gamewindow.overlay.waypoint.ID, 
			UNIT_ID = UNIT_ID, 
			X = X, 
			Y = Y
		};
	end;
end;

function clearWarehouseGatheringPoint()
	if WAREHOUSE_ACTIVE_POINT.ID > 0 then
		sgui_delete(WAREHOUSE_ACTIVE_POINT.ID);

		WAREHOUSE_ACTIVE_POINT = {
			ID = 0,
			UNIT_ID = 0,
			X = 0,
			Y = 0
		};
	end;
end

function setWarehouseGatheringPointXY(SIDE, ID, X, Y)
	WAREHOUSE_GATEHRING_POINTS[ID] = {parseInt(SIDE), parseInt(ID), parseInt(X), parseInt(Y)};
end;

function resetWarehouseGatheringPoints()
	WAREHOUSE_GATEHRING_POINTS = {};
end;

DEPOT_ACTIVE_RESOURCESPOINT = {
	ID = 0,
	UNIT_ID = 0,
	X = 0,
	Y = 0,
	CRATES = 0,
	OIL = 0,
	SIB = 0
};

function displayAmountOfResourcesDepot(UNIT_ID, X, Y, CRATES, OIL, SIB)
	if DEPOT_ACTIVE_RESOURCESPOINT.X ~= X or 
		DEPOT_ACTIVE_RESOURCESPOINT.Y ~= Y or
		DEPOT_ACTIVE_RESOURCESPOINT.CRATES ~= CRATES or 
		DEPOT_ACTIVE_RESOURCESPOINT.OIL ~= OIL or
		DEPOT_ACTIVE_RESOURCESPOINT.SIB ~= SIB then
		clearAmountOfResourcesDepot();

		local hex = OW_HEXTOSCREEN(X, Y);

		gamewindow.overlay.waypoint = getElementEX(
		    gamewindow.overlay,
		    anchorNone,
		    XYWH(hex.X - 74, hex.Y - 74, 148, 16),
		    true,
		    {
		        colour1 = BLACKA(100)
		    }
		);

		gamewindow.overlay.waypoint.label = getLabelEX(
			gamewindow.overlay.waypoint,
			anchorT, 
			XYWH(0, 0, 144, 14), 
			Tahoma_13B, 
			kFormat(CRATES) .. '/' .. kFormat(OIL) .. '/' .. kFormat(SIB),
			{
				wordwrap = true,
				text_halign = ALIGN_MIDDLE,
				text_valign = ALIGN_MIDDLE,
				font_colour = RGB(231, 222, 214),
				shadowtext = true
			}
		);

		DEPOT_ACTIVE_RESOURCESPOINT = {
			ID = gamewindow.overlay.waypoint.ID,
			UNIT_ID = UNIT_ID,
			X = X,
			Y = Y,
			CRATES = CRATES,
			OIL = OIL,
			SIB = SIB			
		};
	end;
end;

function clearAmountOfResourcesDepot()
	if DEPOT_ACTIVE_RESOURCESPOINT.ID > 0 then
		sgui_delete(DEPOT_ACTIVE_RESOURCESPOINT.ID);

		DEPOT_ACTIVE_RESOURCESPOINT = {
			ID = 0,
			UNIT_ID = 0,
			X = 0,
			Y = 0,
			CRATES = 0,
			OIL = 0,
			SIB = 0
		};
	end;
end;

