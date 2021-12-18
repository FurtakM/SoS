Loading_SidePos = {};
Loading_SidePos[0] = { -- Alien
	Name  = XYWH(28,35,400,25),
	Coord = XYWH(28,70,400,25),
	Brief = XYWH(781,572,205,168),
	FontName = Trebuchet_20
};

Loading_SidePos[1] = { -- American
	Name  = XYWH(28,35,400,25),
	Coord = XYWH(28,70,400,25),
	Brief = XYWH(781,572,205,168),
	FontName = Trebuchet_20,
	FontCoord = Trebuchet_20
};

Loading_SidePos[2] = { -- Russian
	Name  = XYWH(60,40,365,22),
	Coord = XYWH(60,70,365,22),
	Brief = XYWH(57,575,200,160),
	FontName = Trebuchet_20,
	FontCoord = Trebuchet_20
};

Loading_SidePos[3] = { -- Arabian
	Name  = XYWH(12,20,180,22),
	Coord = XYWH(12,50,180,22),
	Brief = XYWH(12,85,180,160),
	FontName = Tahoma_13B,
	FontCoord = Tahoma_13
};

Loading_SidePos[4] = { -- Spectator
	Name  = XYWH(28,25,400,25),
	Coord = XYWH(28,70,400,25),
	Brief = XYWH(781,572,205,168),
	FontName = Trebuchet_20,
	FontCoord = Trebuchet_20
};

function FROMOW_SETLOADINGTEXT(Side, Name, Coord, Brief) 
	setXYWH(loading_name, Loading_SidePos[Side].Name);
	setXYWH(loading_coord, Loading_SidePos[Side].Coord);
	setXYWH(loading_brief, Loading_SidePos[Side].Brief);

	setText(loading_name, Name);
	setText(loading_coord, Coord);
	setText(loading_brief, Brief);

	setFontName(loading_name, Loading_SidePos[Side].FontName);
	setFontName(loading_coord, Loading_SidePos[Side].FontCoord);

	setText(loading_text, loc(TID_Multi_Loading));
end;

function FROMOW_SETLOADIMAGE(filename)
	playMenuMusic(0);
	
	setTexture(loading.img,filename);
	setVisible(loading,true);
	setVisible(menu,false);

	resetScorebar()
	loadingPlayers = {};
	sgui_deletechildren(loading.players.ID);

	if getvalue(OWV_MULTIPLAYER) then

		setText(loading.textName, MultiDef.MapName.MAPLOC);
		setText(loading.textGameType, MultiDef.MapName.GAMETYPELOC);
--		if ifTeams then
--			if odd(loadingTeamsCount) then
--				loadingTeamsCount=loadingTeamsCount+1;
--			end;
			OW_MULTI_GET_PLAYERINFO();

			local teamSpace = {};--getHeight(loading.players) / (loadingTeamsCount/2);
			local currentTeam = 1;
			local teamLine = 0;
			local leftTeams = 0;
			local rightTeams = 0;
			local leftBS = 0;
			local rightBS = 0;
			for i =1, 9 do
				if loadingTCount[i] > 0 then
					if odd(currentTeam) then
						leftTeams= leftTeams+1;
						leftBS = leftBS+ loadingTCount[i]*90;
					else
						rightTeams = rightTeams+1;
						rightBS = rightBS+ loadingTCount[i]*90;
					end;
					teamSpace[i] = loadingTCount[i]*90;

					currentTeam = currentTeam +1;
				end;

			end;

			leftBS= (getHeight(loading.players)-leftBS) / leftTeams;
			rightBS= (getHeight(loading.players)-rightBS) / rightTeams;
			currentTeam = 1;
			leftTPos = 0;
			rightTPos=0;
			for i=1, 9 do

				if loadingTCount[i] > 0 then

					local line=0;
					local baseY = 0;
					local dir = LDIR_RIGHT ;
					local yTeamPos=rightTPos;
					local X = getWidth(loading) - 300;
					local textAling = ALIGN_RIGHT ;
					local tName = 'Unknow';
					--local teamTex = 'SGUI/gradient_right.png';
					local teamTexX = 150;
					local tSpace = teamSpace[i]+rightBS;
					if odd(currentTeam) then
						dir = LDIR_LEFT;
						teamLine = teamLine +1;
						X = 0;
						textAling = ALIGN_LEFT;
						--teamTex = 'SGUI/gradient_left.png';
						teamTexX = 0;
						tSpace=teamSpace[i]+leftBS;
						yTeamPos=leftTPos;
					end;

					if odd(loadingTCount[i]) then
						baseY = tSpace/2 - (roundup(loadingTCount[i]/2) ) *90 + 45;
					else
						baseY = tSpace/2 - (roundup(loadingTCount[i]/2) ) *90 ;
					end;


					if ifTeams then
						if i == 9 then
							tName = loc(TID_Multi_IsSpec);
						else
							tName = MultiDef.TeamDef[i+1].NAME;
						end;

						getLabelEX(loading.players,
							anchorLT,
							XYWH(
								X,
								baseY-25,
								300,
								20),
							Tahoma_20B,
							tName,
							{
								wordwrap=false,
								nomouseevent=true,
								text_halign=textAling,
							}
						);

					end;

					for p=1, loadingTCount[i] do

						loadingPlayers[loadingTeam[i][p]] = makeLoadingPlayer(loadingTeam[i][p],yTeamPos +baseY + line*90, dir, nil);
						line=line+1;
					end;

					if odd(currentTeam) then
						leftTPos = yTeamPos + tSpace;
					else
						rightTPos = yTeamPos + tSpace;
					end;
					currentTeam = currentTeam+1;
				end;
			end;

		init_specBars();
		initalizeDiplomacy();

	else
		showSpecBar(false);
		setText(loading.textName, '');
		setText(loading.textGameType, '');
	end;
	loading.State = true;
end;