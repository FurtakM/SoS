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
            local selectedUnitID = parseInt(SELECTED_UNIT.ID);
            local unitKindID = parseInt(SELECTED_UNIT.KIND);

        	if selectedUnitID > 0 and unitKindID == 3 and FACTORY_WAYPOINTS[selectedUnitID] ~= nil and (FACTORY_ACTIVE_WAYPOINT.UNIT_ID == 0 or FACTORY_ACTIVE_WAYPOINT.UNIT_ID == selectedUnitID) then
        		local point = FACTORY_WAYPOINTS[selectedUnitID];
        		displayFactoryWaypointXY(point[1], point[2], point[3], point[4]);
        	elseif FACTORY_ACTIVE_WAYPOINT ~= nil then
        		clearFactoryWaypoint();
        	end;

            if selectedUnitID > 0 and (unitKindID == 0 or unitKindID == 1) and WAREHOUSE_GATEHRING_POINTS[selectedUnitID] ~= nil and (WAREHOUSE_ACTIVE_POINT.UNIT_ID == 0 or WAREHOUSE_ACTIVE_POINT.UNIT_ID == selectedUnitID) then
                local point = WAREHOUSE_GATEHRING_POINTS[selectedUnitID];
                displayWarehouseGatheringPointXY(point[1], point[2], point[3], point[4]);
            elseif WAREHOUSE_ACTIVE_POINT ~= nil then
                clearWarehouseGatheringPoint();
            end;
        end;
    end;
end;