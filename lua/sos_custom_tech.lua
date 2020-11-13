-- lua
IT_LR_Artillery = 80;
IT_LR_RadMat = 81;

-- buttons.txt
SOS_TECH = {
	{
		TECH = IT_LR_Artillery,
		BUTTON = 68,
	},
	{
		TECH = IT_LR_RadMat,
		BUTTON = 56
	}
}

function GetLabQueueIcon(ID)
    if (ID <= -1) then
        return getIconTypeIndex(BudLab2IT(-ID));
    elseif (ID >= 80) then
    	return getCustomIconTypeIndex(ID);
    else
        return getIconTypeIndex(_Tech2ITTable[ID]);
    end;
end;

function getCustomIconTypeIndex(TECH)
    for i = 1, #SOS_TECH do
    	if (SOS_TECH[i].TECH == TECH) then
    		return SOS_TECH[i].BUTTON;
    	end;
    end;
end;