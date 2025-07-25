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
	
	setVisible(loading, true);
	setVisible(menu, false);

	if getvalue(OWV_MULTIPLAYER) then
		setTexture(loading.img, 'LoadImgs/multiplayer.png');
		setText(loading.textName, MultiDef.MapName.MAPLOC);
		setText(loading.textGameType, MultiDef.MapName.GAMETYPELOC);

		OW_MULTI_GET_PLAYERINFO();

		init_specBars();
		initalizeDiplomacy();
	elseif (getvalue(OWV_SKIRMISH)) then
		setTexture(loading.img, 'LoadImgs/skirmish.png');
		showSpecBar(false);

		if (SKIRMISH_DATA and SKIRMISH_SELECTED ~= nil) then
			setText(loading.textName, SKIRMISH_DATA[SKIRMISH_SELECTED].title);
		else
			setText(loading.textName, '');
		end;
		
		setText(loading.textGameType, '');
	else
		setTexture(loading.img, filename);
		showSpecBar(false);
		setText(loading.textName, '');
		setText(loading.textGameType, '');
	end;

	loading.State = true;
end;