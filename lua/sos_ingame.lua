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
            local unitSide = parseInt(SELECTED_UNIT.SIDE);
            local side = getvalue(OWV_MYSIDE);

        	if selectedUnitID > 0 and unitKindID == 3 and FACTORY_WAYPOINTS[selectedUnitID] ~= nil and (side == 9 or side == unitSide) and (FACTORY_ACTIVE_WAYPOINT.UNIT_ID == 0 or FACTORY_ACTIVE_WAYPOINT.UNIT_ID == selectedUnitID) then
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

            if side == 9 then
                if unitSide ~= nil and (unitKindID == 0 or unitKindID == 1) then
                    local bases = OW_GET_SIDE_BASES(unitSide);

                    if bases ~= nil then
                        local base = nil;

                        for i, v in pairs(bases) do
                            if parseInt(v.DEPOT.ID) == selectedUnitID then
                                base = v;
                                break;
                            end;
                        end;

                        if (base ~= nil) then
                            -- ID, X, Y, CRATES, OIL, SIB
                            displayAmountOfResourcesDepot(
                                selectedUnitID,
                                base.DEPOT.XS,
                                base.DEPOT.YS,
                                base.POOL.MATS[1],
                                base.POOL.MATS[2],
                                base.POOL.MATS[3]
                            );
                        end;
                    end;
                else
                    clearAmountOfResourcesDepot();
                end;
            end;
        end;
    end;
end;

MENU_OPTIONS_FORM = nil;

function showGameOptionsForm()
    MENU_OPTIONS_FORM = OW_FORM_CREATE(false);
    OW_FORM_SHOWMODAL(MENU_OPTIONS_FORM);
end;

function hideGameOptions()
    if (MENU_OPTIONS_FORM ~= nil) then
        OW_FORM_CLOSE(MENU_OPTIONS_FORM, 1);
        MENU_OPTIONS_FORM = nil;
    end;

    HideDialog(dialog.options);
end

function showGameOptions();
    ShowDialog(dialog.options);

    options_loading = true;

    set_Callback(dialog.options.ok.ID, CALLBACK_MOUSECLICK, 'hideGameOptions()');

    setChecked(dialog.options.subtitles, OW_get(SETTING_SUBTITLES));
    setChecked(dialog.options.showobjectives, OW_get(SETTING_AUTOMISSION));
    setChecked(dialog.options.rawound, OW_get(SETTING_RAWOUNDED));
    setChecked(dialog.options.ranoncombat, OW_get(SETTING_RANONCOMBAT));
    setChecked(dialog.options.ravehicles, OW_get(SETTING_RAVEHICLES));
    setChecked(dialog.options.altFact, altFact.inUse);
    
    dialog.options.musicvolume:setPos(OW_settings_getvolume(VOLUME_MUSIC));
    dialog.options.soundvolume:setPos(OW_settings_getvolume(VOLUME_SPEECH));
    dialog.options.effectsvolume:setPos(OW_settings_getvolume(VOLUME_EFFECTS));
    dialog.options.exclamationsvolume:setPos(OW_settings_getvolume(VOLUME_EXCLAMATIONS));

    options_loading = false;

    showGameOptionsForm();
end;

function dialog.options.Show()
    showGameOptions();
end

function FROMOW_SHOW_INGAME_MENU(DATA)
    dialog.menu.FORMID = DATA.FORMID;

    sgui_deletechildren(dialog.menu.panel.ID);

    local h = 0;
    local b = nil;
    local mh = getHeight(dialog.menu) - getHeight(dialog.menu.panel);

    b = getImageButtonEX(
        dialog.menu.panel,
        anchorLTR,
        XYWH(
            0,
            h,
            getWidth(dialog.menu.panel),
            24
        ),
        loc(TID_Main_Menu_Options),
        '',
        'HideDialog(dialog.menu);OW_FORM_CLOSE(dialog.menu.FORMID,597);AddSingleUseTimer(0.1,showGameOptions());',
        SKINTYPE_BUTTON,
        {}
    );
    
    UpdateDialogButton(b, interface.current.dialog.button);
    
    h = h + getHeight(b) + 4; -- In future this will be useful when buttons can do auto width word wrap

    for i = 1, DATA.COUNT do
        b = getImageButtonEX(
            dialog.menu.panel,
            anchorLTR,
            XYWH(
                0,
                h,
                getWidth(dialog.menu.panel),
                24
            ),
            loc(DATA.BUTTONS[i]),
            '',
            'HideDialog(dialog.menu);OW_FORM_CLOSE(dialog.menu.FORMID,'..(DATA.BUTTONS[i])..');',
            SKINTYPE_BUTTON,
            {}
        );
        
        UpdateDialogButton(b, interface.current.dialog.button);
        
        h = h + getHeight(b) + 4; -- In future this will be useful when buttons can do auto width word wrap
    end;

    setHeight(dialog.menu, mh + h);
    ShowDialog(dialog.menu);
    OF_HideDialog(dialog.menu.FORMID, 'dialog.menu');

    -- dialog.options.Show()
end;

LFC_UNITS_CUSTOM_ICON = {};

function LFC_GET_UNITPANEL_ICONS_CALLBACK(UNIT, LICON, RICON)
    if (#LFC_UNITS_CUSTOM_ICON == 0) then
        return LICON, RICON;
    end;

    local ID = parseInt(UNIT.ID);

    for i = 1, #LFC_UNITS_CUSTOM_ICON do
        if (ID == LFC_UNITS_CUSTOM_ICON[i][1]) then
            return LICON, RICON, -1, LFC_UNITS_CUSTOM_ICON[i][2];
        end;
    end;

    return LICON, RICON;
end;

OW_LFC_ADD(LFC_GET_UNITPANEL_ICONS, LFC_GET_UNITPANEL_ICONS_CALLBACK, nil);