-- lua
IT_LR_Artillery = 80;
IT_LR_RadMat = 81;
IT_LR_NonCombat = 82;
IT_LR_Cargo = 83;
IT_LR_Track = 84;
IT_LR_Crane = 85;
IT_LR_Bulldozer = 86;
IT_LR_Hovercraft = 87;
IT_LR_MultiBarrels = 88;
IT_LR_EarlyDet = 89;
IT_LR_PowOpt = 90;
IT_LR_SibOre = 91;
IT_LR_OilOre = 92;
IT_LR_MineDetector = 93;
IT_LR_Miner = 94;

-- buttons.txt
SOS_TECH = {
	{
		TECH = IT_LR_Artillery,
		BUTTON = 1,
	},
	{
		TECH = IT_LR_RadMat,
		BUTTON = 56
	},
    {
        TECH = IT_LR_NonCombat,
        BUTTON = 42
    },
    {
        TECH = IT_LR_Cargo,
        BUTTON = 28
    },
    {
        TECH = IT_LR_Track,
        BUTTON = 27
    },
    {
        TECH = IT_LR_Crane,
        BUTTON = 72
    },
    {
        TECH = IT_LR_Bulldozer,
        BUTTON = 170
    },
    {
        TECH = IT_LR_Hovercraft,
        BUTTON = 173
    },
    {
        TECH = IT_LR_MultiBarrels,
        BUTTON = 174
    },
    {
        TECH = IT_LR_EarlyDet,
        BUTTON = 176
    },
    {
        TECH = IT_LR_PowOpt,
        BUTTON = 65
    },
    {
        TECH = IT_LR_SibOre,
        BUTTON = 61
    },
    {
        TECH = IT_LR_OilOre,
        BUTTON = 37
    },
    {
        TECH = IT_LR_MineDetector,
        BUTTON = 52
    },
    {
        TECH = IT_LR_Miner,
        BUTTON = 7
    }
}

SOS_BUD = {
    [500] = {
        ID = bud_ext_solar,
        BUTTON = 65
    }
}

function getIconTypeIndex(IT)
    if (IT == nil) or (IT <= -1) then
        return -1;
    elseif IT >= 500 then
        return getCustomIconTypeBudIndex(IT);
    else
        return OW_GETICONTYPEINDEX(IT);
    end;
end;

function GetLabQueueIcon(ID)
    if (ID <= -1) then
        return getIconTypeIndex(BudLab2IT(-ID));
    elseif (ID >= 80) then
    	return getCustomIconTypeTechIndex(ID);
    else
        return getIconTypeIndex(_Tech2ITTable[ID]);
    end;
end;

function getCustomIconTypeBudIndex(BUD)
    if (SOS_BUD[BUD] ~= nil) then
        return SOS_BUD[BUD].BUTTON;
    end;

    return -1;
end;

function getCustomIconTypeTechIndex(TECH)
    for i = 1, #SOS_TECH do
    	if (SOS_TECH[i].TECH == TECH) then
    		return SOS_TECH[i].BUTTON;
    	end;
    end;

    return -1;
end;

function GetExtensionIcon(KIND)
    if (KIND <= -1) then
        return -1;
    end;

    BTID = -1;

    switch(KIND) : caseof {
        [bud_ext_track]             = function (x) BTID = IT_FE_Track; end,
        [bud_ext_gun]               = function (x) BTID = IT_FE_Gun; end,
        [bud_ext_rocket]            = function (x) BTID = IT_FE_Rocket; end,
        [bud_ext_noncombat]         = function (x) BTID = IT_FE_NonCombat; end,
        [bud_ext_radar]             = function (x) BTID = IT_FE_Radar; end,
        [bud_ext_siberium]          = function (x) BTID = IT_FE_Siberium; end,
        [bud_ext_radio]             = function (x) BTID = IT_FE_Radio; end,
        [bud_ext_stitch]            = function (x) BTID = IT_FE_Stitching; end,
        [bud_ext_computer]          = function (x) BTID = IT_FE_Computer; end,
        [bud_ext_laser]             = function (x) BTID = IT_FE_Laser; end,
        [bud_ext_solar]             = function (x) BTID = 500; end,
    };

    return BTID;
end;