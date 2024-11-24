-- override function from game_main.lua 
-- ver. 322
interfaceSide = -1; -- 0 = Alien, 1 = Amer, 3 = Arab, 2 = Rus

function ChangeInterface(ID)
    if (ID ~= interfaceSide) then
        interfaceSide = ID;

        if interfaceSide == inID_Spec then -- spectator 
        	DoInterfaceChange(interfaces[inID_Amer]);
        	return;
        end;

        if interfaces[interfaceSide] then
            DoInterfaceChange(interfaces[interfaceSide]);
        else
            DoInterfaceChange(interface.alien);
        end;
    end
end;

function DoInterfaceChange_Game()
	uisettings = interface.current.game.ui;

	UpdateToolBtns(game.ui.toolbtns, uisettings.toolBtns);
	
    setInterfaceTexture(game.ui.toolbar,'toolbar.png');
    setInterfaceTextureMask(game.ui.toolbar,'toolbar.png');
	
    setWHV(game.ui.toolbar,uisettings.toolBar.X,uisettings.toolBar.Y);

	setInterfaceTexture(game.ui.toolbar.pause,'ToolBar_button_pause.png');

	setXYWH(game.ui.toolbar.pause,uisettings.pause);

	setInterfaceTexture(game.ui.minimap,'MiniMap.png');
    setInterfaceTextureMask(game.ui.minimap,'MiniMap.png');
	
    setXYWHV(game.ui.minimap,ScrWidth-uisettings.minimap.BACK.X,ScrHeight-uisettings.minimap.BACK.Y,uisettings.minimap.BACK.X,uisettings.minimap.BACK.Y);
	setXYWH(game.ui.minimap.map,uisettings.minimap.MAP);

	set_Colour(game.ui.minimap.map.img.ID,PROP_BORDER_COLOUR,uisettings.minimap.COLOUR);

	setInterfaceTexture(game.ui.infopanel,'InfoPanel.png');
    setInterfaceTextureMask(game.ui.infopanel,'InfoPanel.png');

	set_Property(game.ui.infopanel.ID,PROP_Y,ScrHeight-uisettings.infopanel.Y);

	setWHV(game.ui.infopanel,uisettings.infopanel.X,uisettings.infopanel.Y);

	set_Property(game.filmtop.ID,PROP_H,uisettings.toolBar.Y);
	set_Property(game.filmbottom.ID,PROP_H,uisettings.minimap.BACK.Y);
	set_Property(game.filmbottom.ID,PROP_Y,ScrHeight-uisettings.minimap.BACK.Y);

	setXYWHV(game.ui.commpanel,getElementRight(game.ui.infopanel),ScrHeight-uisettings.commpanel[5],uisettings.commpanel[4],uisettings.commpanel[5]);
	setWHV(game.ui.commpanel1,uisettings.commpanel[4],uisettings.commpanel[5]);
	setWHV(game.ui.commpanel2,uisettings.commpanel[4],uisettings.commpanel[5]);
	setWHV(game.ui.commpanel3,uisettings.commpanel[4],uisettings.commpanel[5]);

	setInterfaceTexture(game.ui.commpanel1,uisettings.commpanel[1]);
	setInterfaceTexture(game.ui.commpanel2,uisettings.commpanel[2]);
	setInterfaceTexture(game.ui.commpanel3,uisettings.commpanel[3]);

    setXY(game.ui.commpanel1.undo,uisettings.undobutton.X,getHeight(game.ui.commpanel1)-uisettings.undobutton.Y-getHeight(game.ui.commpanel1.undo));
    setXY(game.ui.commpanel1.redo,getWidth(game.ui.commpanel1)-uisettings.redobutton.X-getWidth(game.ui.commpanel1.redo),getHeight(game.ui.commpanel1)-uisettings.redobutton.Y-getHeight(game.ui.commpanel1.redo));

    setXY(game.ui.commpanel1.speed,22-16-5,getHeight(game.ui.commpanel1)-uisettings.speed.Y-16);
    setWH(game.ui.commpanel1.speed.slider,uisettings.speed.X,16);

	setVisible(game.ui.commpanel1,true);
	setVisible(game.ui.commpanel2,false);
	setVisible(game.ui.commpanel3,false);

    local cp2h = getHeight(game.ui.commpanel2);

    setXY(game.ui.commpanel2.weapon,12+uisettings.combooff,cp2h-6-(20*4));
    setXY(game.ui.commpanel2.chassis,12+uisettings.combooff,cp2h-6-(20*3));
    setXY(game.ui.commpanel2.control,12+uisettings.combooff,cp2h-6-(20*2));
    setXY(game.ui.commpanel2.engine,12+uisettings.combooff,cp2h-6-(20*1));

    setXY(game.ui.commpanel3.weapon,12+uisettings.combooff,cp2h-36);

	for c = 1, 9 do
		setVisible(game.ui.commpanel.buttons[c],false);
		set_Property(game.ui.commpanel.buttons[c].ID,PROP_TEXTURE,uisettings.buttons);

		setXYWHV(game.ui.commpanel.buttons[c],uisettings.commBtns[1]+math.mod((c-1),3)*(uisettings.commBtns[3]+1),uisettings.commBtns[2]+math.floor((c-1)/3)*(uisettings.commBtns[4]+1),uisettings.commBtns[3],uisettings.commBtns[4]);
	end;

	setXYWHV(game.ui.facepanel,getElementRight(game.ui.commpanel),ScrHeight-uisettings.facepanel[3],getX(game.ui.minimap)-getElementRight(game.ui.commpanel),uisettings.facepanel[3]);

	setWHV(game.ui.facepanelL,uisettings.facepanel[1],uisettings.facepanel[3]);
	setXYWHV(game.ui.facepanelM,uisettings.facepanel[1],0,getWidth(game.ui.facepanel)-uisettings.facepanel[1]-uisettings.facepanel[2],uisettings.facepanel[3]);
	setXYWHV(game.ui.facepanelR,getWidth(game.ui.facepanel)-uisettings.facepanel[2],0,uisettings.facepanel[2],uisettings.facepanel[3]);

	set_Property(game.ui.facepanelM.ID,PROP_TILE,true);

	setInterfaceTexture(game.ui.facepanelL,'FacePanelL.png');
	setInterfaceTexture(game.ui.facepanelM,'FacePanel.png');
	setInterfaceTexture(game.ui.facepanelR,'FacePanelR.png');

	setXYWHV(game.ui.hintbar,getX(game.ui.commpanel),getY(game.ui.facepanel)-uisettings.hintbar[3],getX(game.ui.minimap)-getX(game.ui.commpanel),uisettings.hintbar[3]);
	setWHV(game.ui.hintbarL,uisettings.hintbar[1],uisettings.hintbar[3]);
	setXYWHV(game.ui.hintbarM,uisettings.hintbar[1],0,getWidth(game.ui.hintbar)-uisettings.hintbar[1]-uisettings.hintbar[2],uisettings.hintbar[3]);
	setXYWHV(game.ui.hintbarR,getWidth(game.ui.hintbar)-uisettings.hintbar[2],0,uisettings.hintbar[2],uisettings.hintbar[3]);

	setXYWHV(game.ui.hintbarA,uisettings.hintbar[4].X+20,uisettings.hintbar[4].Y,getWidth(game.ui.hintbar)-uisettings.hintbar[4].X-20,19);

	set_Property(game.ui.hintbarM.ID,PROP_TILE,true);

	setInterfaceTexture(game.ui.hintbarL,'hintbarL.png');
	setInterfaceTexture(game.ui.hintbarM,'hintbarM.png');
	setInterfaceTexture(game.ui.hintbarR,'hintbarR.png');

    setInterfaceTextureMask(game.ui.hintbarL,'hintbarL.png');
    setInterfaceTextureMask(game.ui.hintbarM,'hintbarM.png');
    setInterfaceTextureMask(game.ui.hintbarR,'hintbarR.png');

	setXYWHV(game.ui.facepanelA,uisettings.facearea.X,uisettings.facearea.Y,getWidth(game.ui.facepanel)-(uisettings.facearea.X*2),getHeight(game.ui.facepanel)-(uisettings.facearea.Y*2));

	setXYWHV(game.ui.logpanel,getX(game.ui.facepanelA)+5,getY(game.ui.facepanelA)+3,getWidth(game.ui.facepanelA)-10,getHeight(game.ui.facepanelA));

	setWidth(game.ui.logpanel.log,getWidth(game.ui.logpanel)-uisettings.scrollsize-1);

    setX(game.ui.logpanel.ok,getWidth(game.ui.logpanel)-150-10);

	setXYWHV(game.ui.logpanel.logscroll,getElementRight(game.ui.logpanel.log)+1,0,uisettings.scrollsize,getHeight(game.ui.logpanel.log));


	setInterfaceTexture(game.ui.facepanelA.spliter[1],'sliders.png');
	setInterfaceTexture(game.ui.facepanelA.spliter[2],'sliders.png');

	setSpliterCoords(1,0);
	setSpliterCoords(2,0);

	local FPW = getWidth(game.ui.facepanelA);
	local FPH = getHeight(game.ui.facepanelA);

	setXYWHV(game.ui.facepanelA.spliter[1],FPW-400,0,14,FPH);
	setXYWHV(game.ui.facepanelA.spliter[2],FPW-200,0,14,FPH);

	setXYWHV(game.ui.facepanelA.people,0,22,FPW-400,FPH-22);
	setXYWHV(game.ui.facepanelA.vehicle,FPW-400+14,22,200-14,FPH-22);
	setXYWHV(game.ui.facepanelA.building,FPW-200+14,22,200-14,FPH-22);
	setX(game.ui.facepanelA.sort.vehicle,FPW-400+14);
	setX(game.ui.facepanelA.sort.building,FPW-200+14);
	setFacePanel();

	setXYV(game.ui.hintbar.log,getX(game.ui.hintbarA)-20,uisettings.hintbar[4].Y);
	setInterfaceTexture(game.ui.hintbar.log,'LogButton.png');

    setInterfaceTexture1n2(game.ui.logpanel.logscroll,'scrollbar_back_v.png','scrollbar.png');

	setInterfaceTexture1n2(game.ui.logpanel.hidedialogcheck,'checkbox_unchecked.png','checkbox_checked.png');
	setInterfaceTexture1n2(game.ui.logpanel.hideothercheck,'checkbox_unchecked.png','checkbox_checked.png');
	setInterfaceTexture1n2(game.ui.logpanel.hidehintcheck,'checkbox_unchecked.png','checkbox_checked.png');

	setBevelCol(game.ui.logpanel.log,uisettings.boxcols.border,uisettings.boxcols.border);
	setColour1(game.ui.logpanel.log,uisettings.boxcols.background);
	setBorderColour(floating_hint,uisettings.boxcols.border);

	setInterfaceTexture1n2(dialog.map.panel.textboxscroll, 'scrollbar_back_v.png', 'scrollbar.png');

	setBevelCol(dialog.map.panel.textbox, uisettings.boxcols.border,uisettings.boxcols.border);
	setColour1(dialog.map.panel.textbox, uisettings.boxcols.background);

	DoInterfaceChange_Game_ResourceBar();

	local Idip = uisettings.dip;
	
    for _, v in pairs(DipSides.SideCards) do
		setTexture(v, Idip.frame);
	end;

	setTexture (game.ui.dip_request.left, Idip.left_req);
	setTexture (game.ui.dip_request.right, Idip.right_req);
	setTexture (game.ui.dip_request.middle, Idip.back_req);

	setXYWHV(game.ui.altFact,uisettings.facearea.X,uisettings.facearea.Y,getWidth(game.ui.facepanel)-(uisettings.facearea.X*2),getHeight(game.ui.facepanel)-(uisettings.facearea.Y*2));
	
	setWHV(game.ui.altFact.componentsArea,getWidth(game.ui.altFact)-95,getHeight(game.ui.altFact));
	
	setXYWHV(game.ui.altFact.unitsArea,0,0,95,getHeight(game.ui.altFact));
	
	setXYWHV(game.ui.altFact.componentsArea.hSplitter1,
		1, (getHeight(game.ui.altFact.componentsArea)-48)/2-2, getWidth(game.ui.altFact.componentsArea)-2,4);
	setXYWHV(game.ui.altFact.componentsArea.hSplitter2,
		1, (getHeight(game.ui.altFact.componentsArea)-48)-2, getWidth(game.ui.altFact.componentsArea)-2,4);	

	setWHV(game.ui.altFact.componentsArea.chassisArea,getWidth(game.ui.altFact.componentsArea)-2,(getHeight(game.ui.altFact.componentsArea)-48)/2-4-5);
	setXYWHV(game.ui.altFact.componentsArea.weaponsArea,
		1, (getHeight(game.ui.altFact.componentsArea)-48)/2+2, getWidth(game.ui.altFact.componentsArea)-2, (getHeight(game.ui.altFact.componentsArea)-48)/2-4-5);
	setXYWHV(game.ui.altFact.componentsArea.controlsAndEnginesArea,
		1, (getHeight(game.ui.altFact.componentsArea)-48)+2,getWidth(game.ui.altFact.componentsArea)-2-5,43);
		
	setY(game.ui.altFact.componentsArea.chassisArea_ScrollH, getY(game.ui.altFact.componentsArea.chassisArea)+ getHeight(game.ui.altFact.componentsArea.chassisArea));
	setY(game.ui.altFact.componentsArea.weaponsArea_ScrollH , getY(game.ui.altFact.componentsArea.weaponsArea)+ getHeight(game.ui.altFact.componentsArea.weaponsArea));
	setY(game.ui.altFact.componentsArea.controlsAndEnginesArea_ScrollH , getY(game.ui.altFact.componentsArea.controlsAndEnginesArea)+ getHeight(game.ui.altFact.componentsArea.controlsAndEnginesArea));	
	

	setTexture(game.ui.altFact.componentsArea.hSplitter1,'SGUI/'..interface.current.side..'/hSplitter.png');
	setTexture(game.ui.altFact.componentsArea.hSplitter2,'SGUI/'..interface.current.side..'/hSplitter.png');
	setTexture(game.ui.altFact.componentsArea.chassisArea_ScrollH,'/SGUI/'..interface.current.side..'/scrollbar.png');
	setTexture(game.ui.altFact.componentsArea.weaponsArea_ScrollH,'/SGUI/'..interface.current.side..'/scrollbar.png');
	setTexture(game.ui.altFact.componentsArea.controlsAndEnginesArea_ScrollH,'/SGUI/'..interface.current.side..'/scrollbar.png');
	
	setXYWH(game.ui.altFact.turretArea,getXYWH(game.ui.altFact));

	setTexture(game.ui.altFact.turretArea.hSplitter1,'SGUI/'..interface.current.side..'/hSplitter.png');
	setTexture(game.ui.altFact.turretArea.hSplitter2,'SGUI/'..interface.current.side..'/hSplitter.png');
	setTexture(game.ui.altFact.turretArea.weaponsArea_ScrollH,'/SGUI/'..interface.current.side..'/scrollbar.png');
	
    --chat
	ChatSetUI();

	sgui_forcetextures(game.ui.ID);

	setTexture(game.ui.infopanel.inner.img.flag,"SGUI/"..interface.current.side.."/flag.png");

	updateFaceSortIcons();

	DoInterfaceChange_Game_SpecBar();

	TeamSkillsSetUI();
	TeamSelectSetUI();

    DoInterfaceChangeTimer();
end;

function OnToolbarClick(ID)
    switch(ID) : caseof {
		[1] = function (x) 
			OW_TOOLBARBUTTON(ID); 
		end, -- Menu
		[2] = function (x) 
		-- 
		end,          -- Team Review
		[3] = function (x) 
			if getvalue(OWV_MULTIPLAYER) then 
				display_diplomacy(); 
			else 
				OW_TOOLBARBUTTON(ID); 
			end; 
		end, -- Objectives / Diplomacy
		[4] = function (x) 
			dialog.options.Show(); 
		end, -- Options
		[5] = function (x) 
			ShowDialog(dialog.map);
			--OF_HideDialog(dialog.map.FORMID, 'dialog.map');
		end, -- Help
		[6] = function (x) 
			showIGAchievs() 
		end,
	}
end;

function UpdateToolBtns(Buttons, Settings)
	for i = 1, 6 do
		UpdateToolBtn(Buttons[i], i, Settings);
	end;

	setX(game.ui.toolbtns[6], getX(game.ui.toolbtns[4]));
	setX(game.ui.toolbtns[4], getX(game.ui.toolbtns[3]));
	setX(game.ui.toolbtns[3], getX(game.ui.toolbtns[2]));

	setVisible(game.ui.toolbtns[2], false);
	setEnabled(game.ui.toolbtns[5], false);
end;