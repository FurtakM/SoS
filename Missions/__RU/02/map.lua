function FROMOW_MAP_START(MAPPATH)
    registryAchievs({'ACH_WORKSHOP', 'ACH_RETAKE', 'ACH_DEPOT'});
end;

function FROMOW_MAP_END()
    clearRegistryAchievs();
end;