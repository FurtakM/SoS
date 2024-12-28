function FROMOW_PLAYERNOWSPECTATOR(X, PLAYERID)
	local PLAYER = MULTI_PLAYERINFO_CURRENT_PLID[PLAYERID];

	if (PLAYER == nil) then
		return;
	end;

	local req = game.ui.dip_request_MK2.addAnswer(
		5, 
		PLAYER.NAME, 
		PLAYER.COLOUR + 1, 
		PLAYERID
	);
		
	PLAYER.ISPEC = true;

	if PLAYERID == MyID then
		iSpec = true;
		setChatPool(3);
		setVisible(game.chat.CheckersArea,false);
		showSpecBar(true);
	end;
	
	DipSides.SideCards[PLAYER.COLOUR+1].IsSpec = true;
	Dip_Resort();
end;


function FROMOW_PLAYERACTION(DATA)
-- {ACTION=NUMBER,PLID=Number,NAME=String}
--	DEBUGLOG(DATA);

	local PLAYER = MULTI_PLAYERINFO_CURRENT_PLID[DATA.PLID];

	if (PLAYER == nil) then
		return;
	end;

	local req = game.ui.dip_request_MK2.addAnswer(
		6,
		PLAYER.NAME,PLAYER.COLOUR + 1,
		DATA.PLID
	);
	
	MULTI_PLAYERINFO_CURRENT_PLID[DATA.PLID].ISSPEC = true;

	local colour = PLAYER.COLOUR;
	local sideIsDeath = true;

	for k, v in pairs(MULTI_PLAYERINFO_CURRENT_PLID) do
		if v.COLOUR == colour and v.ISSPEC == false then
			sideIsDeath = false;
		end;
	end;
	
	if sideIsDeath then
		DipSides.SideCards[PLAYER.COLOUR + 1].IsSpec = true;
		Dip_Resort();		
	end;
end;
