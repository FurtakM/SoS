function game.ui.dip_request_MK2.CreateAnswer(pos, type, name, side, playerID)
	local PLAYER = {};

	if not playerID then
		PLAYER = MULTI_PLAYERINFO_CURRENT_PLID[DipSides.SideCards[side].MainPlayerID];
		PLAYER.AVATARTEX = Players[DipSides.SideCards[side].MainPlayerID].AVATARTEX;
	else
		local index = 0;

		for i = 1, #Players do
			if (playerID == Players[i].PLID) then
				index = i;
				break;
			end;
		end;

		if (MULTI_PLAYERINFO_CURRENT_PLID[playerID] ~= nil and Players[index] ~= nil) then
			PLAYER = MULTI_PLAYERINFO_CURRENT_PLID[playerID];
			PLAYER.AVATARTEX = Players[index].AVATARTEX;	
		end;
	end;
	
	local p = game.ui.dip_request_MK2.CreateDiplomacyCore(pos,name,side,PLAYER);

	local hintB = loc(TID_InGame_Msg_Hide_Other);
	local requestText = '';
	local y = pos*40;

	switch(type) : caseof {
		[1] = function (x)  -- Accept
				requestText= loc(TID_InGame_Diplomacy_Messange_AcceptedRequest_Short);
			end,
		[2] = function (x)  -- Decline
				requestText =loc(TID_InGame_Diplomacy_Messange_DeclinedRequest_Short);
			end,
		[3] = function (x)  -- Break Ceasefire
				requestText= loc(TID_InGame_Diplomacy_Messange_BreakCeasefire_Short);
			end,
		[4] = function (x)  -- Declare War
				requestText =loc(TID_InGame_Diplomacy_Messange_DeclareWar_Short);
			end,
		[5] = function (x)  -- Player Defeated
				requestText =loc(TID_InGame_Diplomacy_Messange_Defeated);
			end;
		[6] = function (x)  -- Player leave game
				requestText =loc(TID_InGame_Diplomacy_Messange_Left);
			end;
	};

	p.Reject = getImageButtonEX(p,
			anchorLT,
			XYWH(
				300,
				12+30,
				30,
				30
			),
			'',
			'',
			'',
			nil,
			{
				texture='SGUI/'.. interface.current.side ..'/'..'dip_request_reject.png',
				hint=hintB,
				nomouseeventthis=false
	});
	
	p.regType = getLabelEX(
		p,
		anchorLT,
		XYWH(
			81,
			52,
			170,
			20
		),
		Tahoma_14B,
		requestText,
		{
			nomouseevent=true,
			shadowtext=true,
			font_colour= WHITE(),
			scissor = true,
			scroll_text=true
		}
	);
	
	if type == 5 then
		p.X = getLabelEX(
			p.avatar,
			anchorLT,
			XYWH(
				0,
				0,
				p.avatar.width,
				p.avatar.height
			),
			Tahoma_60B,
			"X",
			{
				wordwrap=true,
				nomouseevent=true,
				scissor = true,
				text_halign=ALIGN_MIDDLE,
				text_valign=ALIGN_MIDDLE,
				shadowtext=true,
				font_colour= RGB(224,64,64);
			}
		);
	end;
	
	p.Type = type;
	p.Side = side;
	p.Pos = pos;
	p.Showed = true;

	return p;
end;


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
		setVisible(game.chat.CheckersArea, false);
		showSpecBar(true);
	end;
	
	DipSides.SideCards[PLAYER.COLOUR+1].IsSpec = true;
	Dip_Resort();
end;


function FROMOW_PLAYERACTION(DATA)
-- {ACTION=NUMBER,PLID=Number,NAME=String}
--	DEBUGLOG(DATA);

	if (DATA.ACTION == MMT_PauseUnPause) then
        internal_AddChat(DATA.NAME .. ' ' .. loc(6094));
        return;
    end;

    local PLAYER = MULTI_PLAYERINFO_CURRENT_PLID[DATA.PLID];

    if (DATA.ACTION < MMT_PlayerLeft) or (DATA.ACTION > MMT_PlayerDrop) then
    	if (PLAYER) then
    		MULTI_PLAYERINFO_CURRENT_PLID[DATA.PLID].ALIVE = false;
    	end;
    	
        return;
    end;

	if (PLAYER == nil) then
		return;
	end;

	local req = game.ui.dip_request_MK2.addAnswer(
		6,
		PLAYER.NAME,
		PLAYER.COLOUR + 1,
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
		MULTI_PLAYERINFO_CURRENT_PLID[DATA.PLID].ALIVE = false;
		Dip_Resort();		
	end;
end;

function initalizeDiplomacy()
	local players = MULTI_PLAYERINFO_CURRENT_PLID;
	dipplayers = players;
	local merged = {};
	usedSides = {};
	local firstSpec = -1;

	for i, v in pairs(players) do
		if (Players[i] ~= nil) then
			if v.ISSPEC then
				if firstSpec == -1 then
					firstSpec = i; 
				else
					Players[i].IsMerged = true;
				end;
				Players[i].withMerged = firstSpec;
			end;
		end;
	end;

	for i=1,10 do
		if i ~= 10 then
			setVisible(DipSides.Teams[i],false);
		end;
		setVisible(DipSides.SideCards[i],false);
		setVisible(game.chat.Checker[i],false);
		setVisible(game.chat.Muter[i],false);
		game.chat.Checker[i].visible = false;

		game.chat.Muter[i].checked = false;
		setSubCoords(game.chat.Muter[i],SUBCOORD(0,0,16,16));
	end;

	local k = 1;
	--for i = 1, MULTI_PLAYERINFO_CURRENT.COUNT do
	for i, v in pairs(players) do
		if v.ALIVE  then
			local player = Players[i];
			if player and player.IsMerged then
				local colour = players[player.withMerged].COLOUR+1;
				if merged[colour] == nil then
					merged[colour] = {};
				end;
				merged[colour][table.getn(merged[colour])+1] = player.ID;
			else
				local colour = players[i].COLOUR+1;
				--if players[i].ISSPEC then
				--	colour = 1;
				--end;
				setVisible(DipSides.SideCards[colour],true);
				setText(DipSides.SideCards[colour].Name,players[i].NAME);
				setVisible(DipSides.SideCards[colour].Offer1,false);
				setVisible(DipSides.SideCards[colour].Offer2,false);
				DipSides.SideCards[colour].MainPlayerID = i;
				usedSides[colour] = true;
				DipSides.SideCards[colour].IsComp = players[i].ISCOMP;
				DipSides.SideCards[colour].IsSpec = players[i].ISSPEC;
				
				local side = players[i].SIDE;
				local nation = players[i].NATION;
				local team = players[i].TEAM;
				
				local NTex,NName,NBar = getIconNameOfNation(side,nation,team);

				NTex = 'SGUI/Alien/multiplayer/Nat/'.. NTex .. '.png';

				setTexture(DipSides.SideCards[colour].Icon, NTex);
				setHint(DipSides.SideCards[colour].Icon,NName)
				DipSides.SideCards[colour].DipBar = NBar;

				if colour ~= players[MyID].COLOUR+1 and ( not DipSides.SideCards[colour].IsComp)  then
					setVisible(game.chat.Checker[colour],true);
					game.chat.Checker[colour].visible = true;
					setHint(game.chat.Checker[colour],players[i].NAME);
					setXYV(game.chat.Checker[colour],16+2,game.chat.CheckersArea.height-18*(5+k)-2)

					
					setVisible(game.chat.Muter[colour],true);
					setXYV(game.chat.Muter[colour],0,game.chat.CheckersArea.height-18*(5+k)-2);
					k = k+1;
					
					--setText(game.chat.CheckerText[colour].Name,players[i].NAME);
				end;
			end;
		end;
	end;

	for i=1, 10 do
		if usedSides[i] then
			local mergedCount = 1;
			if merged[i] then
				for v=1, table.getn(merged[i]) do
					setText(DipSides.SideCards[i].Name,getText(DipSides.SideCards[i].Name) .. '+' .. players[merged[i][v]].NAME);
					--setHint(game.chat.Checker[i],getHint(game.chat.Checker[i]) .. '+' .. players[merged[i][v]].NAME);
					setHint(game.chat.Checker[i],getText(DipSides.SideCards[i].Name));
					mergedCount = mergedCount+1;
				end;
			end;
			if DipSides.SideCards[i].IsComp then
				mergedCount = 0;
			end;
			ChangeMergedIcons(i,mergedCount);
			
		end;
	end;	

	mySide = players[MyID].COLOUR+1;
	iSpec = players[MyID].ISSPEC;

	OW_MULTI_GET_ATTITUDES();

	game.chat.you = mySide;
	setChatPool(3);
	game.chat.custom = {mySide};

	if iSpec then
		setVisible(game.chat.CheckersArea,false);
	else
		setVisible(game.chat.CheckersArea,true);
	end;

	Dip_Resort();
end;
