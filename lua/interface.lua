local aspect = ScrWidth / ScrHeight;

if aspect <= 1.5 then
	aspect = '_c';
else 
	aspect = '_w';
end;

interface = {};
interface.alien = {};
interface.alien.side = 'Alien';
interface.alien.game = {};
interface.amer = {};
interface.amer.side = 'Amer';
interface.amer.game = {};
interface.arab = {};
interface.arab.side = 'Arab';
interface.arab.game = {};
interface.rus  = {};
interface.rus.side = 'Rus';
interface.rus.game = {};
interface.rus.SiberAlask = true;
interface.ally = {};
interface.ally.side = 'Ally';
interface.ally.game = {};
interface.spec = {};
interface.spec.side = 'Spec';
interface.spec.game = {};

interface.current = {};
interface.scale = 1;

inID_Alien = 0;
inID_Amer = 1;
inID_Rus= 2;
inID_Arab = 3;
inID_Spec = 4;
inID_Ally = 5;

interfaces = {
	[inID_Alien] = interface.alien;
	[inID_Amer] = interface.amer;
	[inID_Arab] = interface.arab;
	[inID_Rus] = interface.rus;
	[inID_Spec] = interface.spec;

};


function setInterfacePreferences(scale)
	if scale <= 0 then scale = 1 end;

	curSide = 'Amer';

	interface.amer.dialog = {
		button      = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
		buttonDebrief      = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
		buttondd    = SetupDialogButtonDD(),
		background  = '/SGUI/'..curSide..'/textura03.png',
		background2 = '/SGUI/'..curSide..'/textura01.png',
		pad         = {texture='/SGUI/'..curSide..'/pad.png',d=XYWH(10*scale,85*scale,320*scale,240*scale),height=420*scale},
		medal       = '/SGUI/'..curSide..'/m',
		medals      = {[1]=XYWH(0,0,115*scale,240*scale),[2]=XYWH(115*scale,0,85*scale,240*scale),[3]=XYWH(200*scale,0,120*scale,240*scale),[4]=XYWH(110*scale,170*scale,100*scale,70*scale),},
		border      = SetupDialogBorderHalf(Coord(63*scale,62*scale),Coord(0,0)),
			combo       = {[1]=RGB(16,32,24),[2]=RGB(34,90,76),[3]=RGB(250,249,254),[4]=RGB(231,255,255),},
	}

	interface.amer.debrief = {
		win = '/SGUI/' .. curSide .. '/deb_multi_win'.. aspect..'.png',
		lose = '/SGUI/' .. curSide .. '/deb_multi_lose'.. aspect..'.png',
		sideBox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
	};


	interface.amer.game.ui = {
		toolBtns   = SetupToolBtns(curSide,100*scale,1*scale,49*scale,23*scale,14*scale), --Side, X, Y, W, H, Step
		commBtns   = SetupCommBtns(curSide,2*scale,0,41*scale,41*scale),
		toolBar    = Coord(517*scale,54*scale),
		pause      = XYWH(13*scale,6*scale,36*scale,39*scale),
		minimap    = {BACK = Coord(248*scale,245*scale), MAP = XYWH(34*scale,43*scale,202*scale,201*scale), COLOUR = RGB(63,78,47)},
		infopanel  = Coord(200*scale,245*scale),
		commpanel  = SetupCommPanel('CommPanel1.png','CommPanel2.png','CommPanel3.png',154*scale,192*scale),
		facepanel  = SetupFacePanel(9*scale,9*scale,192*scale), -- (FacePanelL Width, FacePanelR Width, Height)
		facearea   = XY(10*scale,10*scale),
		hintbar    = SetupHintBar(362*scale,211*scale,22*scale,Coord(12*scale,-3*scale)), -- L Width, R Width, H, X/Y of Hint Placement
		buttons    = '/SGUI/'..curSide..'/buttons.png',
		resbar     = {width=507*scale,x1=57*scale,w1=49*scale,w2=106*scale,y1=6*scale,h1=13*scale,x2=351*scale,w3=135*scale,fontcol1=RGB(200,200,200),fontcol2=RGB(255,0,0)},
		scrollsize = 16*scale,
		boxcols    = {border=RGB(76,148,128),background=RGB(16,31,24)},
		infocolour = RGB(86,173,134),
			paramoff   = 0,
			combooff   = -6*scale,
			rewardlist = XYWH(328-15,76,631+30,600),
			rewardinner = XY(17,320),
			rewardhint  = 230,
			rewardcap  = XY(320,18),
			undobutton = XY(14*scale,6*scale),
			redobutton = XY(35*scale,6*scale),
			speed      = XY(10*scale,31*scale),
		dip= {
			frame = 'SGUI/'..curSide..'/dip_sidePanel.png',
			back_req = 'SGUI/'..curSide..'/dip_request_back.png',
			left_req= 'SGUI/'..curSide..'/dip_request_left.png',
			right_req = 'SGUI/'..curSide..'/dip_request_right.png',
		},
			charselect = {enablecol=RGB(71,233,201),disablecol=RGB(127,127,127),butW=77*scale,butH=27*scale,area=XYWH(279*scale,31*scale,732*scale,660*scale),topH=135*scale,
					  captionarea=XYWH(0,18*scale,320*scale,39*scale),detailsarea=XYWH(15*scale,80*scale,230*scale,50*scale),infoarea=XYWH(17*scale,320*scale,230*scale,400*scale)},
		chat = {
			sidecheckbox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
			allcheckbox =  'SGUI/'.. curSide .. '/chat_allcheck.png',
			friendcheckbox =  'SGUI/'.. curSide .. '/chat_friendcheck.png',
			allycheckbox =  'SGUI/'.. curSide .. '/chat_allycheck.png',
			customcheckbox =  'SGUI/'.. curSide .. '/chat_customcheck.png',
			mutebox = 'SGUI/'.. curSide .. '/chat_mute.png',
		},
		achievsBG = {RGBA(10,31,20,255),RGBA(6,18,12,255)},
		achievsColourGreen = RGB(147,198,204);
		achievsColourGray = RGB(96*0.7,132*0.7,136*0.7);
		achievsProgresBar = RGB(147*0.7,198*0.7,204*0.7);
		specbar     = {width=507*scale,wt = 1014,x1=38*scale,w1=49*scale,w2=88*scale,h=25,y1=6*scale,h1=13*scale,x2=183*scale,w3=110*scale,fontcol1=RGB(200,200,200),fontcol2=RGB(255,0,0),logoX= 25*scale, logoY = 1*scale,logoW=23,logoH=23},
		altFact = {
			background = BLACKA(20),
			sel = RGB(0,200,0),
			selW = RGB(200,0,0),
			unsel = RGB(66,222,189),
			unselW = RGB(66/2,222/2,189/2),

		},
	}



	curSide = 'Alien';
	interface.alien.dialog = copytable(interface.amer.dialog);

	interface.alien.dialog.button = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.14;0.5;1',RGB(220,220,220),RGB(255,255,255),true);
	interface.alien.dialog.buttonDebrief = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255));
	interface.alien.dialog.buttondd    = SetupDialogButtonDD();
	interface.alien.dialog.background  = '/SGUI/'..curSide..'/textura03.png';
	interface.alien.dialog.background2 = '/SGUI/'..curSide..'/textura01.png';
	interface.alien.dialog.border      = SetupDialogBorderHalf(Coord(63*scale,62*scale),Coord(0,0));
	interface.alien.dialog.combo       = {[1]=RGB(32,32,32),[2]=RGB(90,90,90),[3]=RGB(250,250,250),[4]=RGB(10,10,10),};

	interface.alien.game.ui = copytable(interface.amer.game.ui);

	interface.alien.game.ui.boxcols    = {border=RGB(200,200,200),background=RGB(31,31,31)};

	interface.alien.debrief = {
		sideBox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
		win = '/SGUI/' .. curSide .. '/deb_multi_win'.. aspect..'.png',
		lose = '/SGUI/' .. curSide .. '/deb_multi_lose'.. aspect..'.png',
	};
	interface.alien.game.ui.achievsBG = {RGBA(30,29,22,200),RGBA(53,53,38,200)};
	interface.alien.game.ui.achievsColourGreen = RGB(204,198,147);
	interface.alien.game.ui.achievsColourGray = RGB(136*0.7,132*0.7,96*0.7);
	interface.alien.game.ui.achievsProgresBar = RGB(204*0.7,198*0.7,147*0.7);
	curSide = 'Arab';


	interface.arab.dialog = {
		button      = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
		buttonDebrief      = SetupDialogButtonDebrief(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
			buttondd    = SetupDialogButtonDD(),
		background  = '/SGUI/'..curSide..'/textura03.png',
		background2 = '/SGUI/'..curSide..'/pad_back.png',
		pad         = {texture='',d=XYWH(0,(101+38-77)*scale,350*scale,200*scale),colour1=BLACKA(0),height=343*scale},
		medal       = '/SGUI/'..curSide..'/m',
		medals      = {[1]=XYWH(0,0,111*scale,133*scale),[2]=XYWH(111*scale,-1*scale,117*scale,133*scale),[3]=XYWH(228*scale,0,113*scale,133*scale),[4]=XYWH(111*scale,(170+1-38)*scale,117*scale,50*scale),},
		border      = SetupDialogBorderALL(Coord(50*scale,50*scale)),
			combo       = {[1]=RGB(0,0,0),[2]=RGB(140,107,55),[3]=RGB(244,228,212),[4]=RGB(255,255,255),},
			border2     = {Side = 'Arab',
						   TL = XYWH(-40*scale,-34*scale,70*scale,70*scale), TR = XYWH(-30*scale,-34*scale,70*scale,70*scale), BL = XYWH(-40*scale,-34*scale,70*scale,70*scale), BR = XYWH(-30*scale,-34*scale,70*scale,70*scale),
						   T = XYWH(30*scale,-34*scale,-60*scale,70*scale), B = XYWH(30*scale,-34*scale,-60*scale,70*scale), L = XYWH(-40*scale,28*scale,70*scale,-60*scale), R = XYWH(-30*scale,28*scale,70*scale,-60*scale),
						  },
	}

	interface.arab.debrief = {
		sideBox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
		win = '/SGUI/' .. curSide .. '/deb_multi_win'.. aspect..'.png',
		lose = '/SGUI/' .. curSide .. '/deb_multi_lose'.. aspect..'.png',
	};

	interface.arab.game.ui = {
		toolBtns   = SetupToolBtns(curSide,77*scale,3*scale,53*scale,19*scale,5*scale), --Side, X, Y, W, H, Step
		commBtns   = SetupCommBtns(curSide,8*scale,18*scale,41*scale,41*scale),
		toolBar    = Coord(477*scale,74*scale),
		pause      = XYWH(0,0,77*scale,74*scale),
		minimap    = {BACK = Coord(240*scale,241*scale), MAP = XYWH(22*scale,40*scale,203*scale,200*scale), COLOUR = RGB(63,78,47)},
		infopanel  = Coord(187*scale,241*scale),
		commpanel  = SetupCommPanel('CommPanel1.png','CommPanel2.png','CommPanel3.png',142*scale,197*scale),
		facepanel  = SetupFacePanel(160*scale,53*scale,197*scale), -- (FacePanelL Width, FacePanelR Width, Height)
		facearea   = XY(10*scale,10*scale),
		hintbar    = SetupHintBar(301*scale,267*scale,43*scale,Coord((187-19*2)*scale,18*scale)), -- L Width, R Width, H, X/Y of Hint Placement
		buttons    = '/SGUI/'..curSide..'/buttons.png',
		resbar     = {width=394*scale,x1=35*scale,w1=33*scale,w2=87*scale,y1=2*scale,h1=13*scale,x2=287*scale,w3=101*scale,fontcol1=RGB(200,200,200),fontcol2=RGB(255,0,0)},
		scrollsize = 10*scale,
		boxcols    = {border=RGB(181,146,90),background=RGB(41,23,23)},
		infocolour = RGB(255,229,189),
			paramoff   = -8*scale,
			combooff   = 0,
			rewardlist = XYWH(328+30,76+14+3,631,600),
			rewardinner = XY(17+20,320+40),
			rewardhint  = 230+35,
			rewardcap  = XY(320-20,18+14),
			undobutton = XY(14*scale,6*scale),
			redobutton = XY(18*scale,6*scale),
			speed      = XY(14*scale,26*scale),
		dip= {
			frame = 'SGUI/'..curSide..'/dip_sidePanel.png',
			back_req = 'SGUI/'..curSide..'/dip_request_back.png',
			left_req= 'SGUI/'..curSide..'/dip_request_left.png',
			right_req = 'SGUI/'..curSide..'/dip_request_right.png',
		},
			charselect = {enablecol=WHITE(),disablecol=WHITE(),butW=85*scale,butH=32*scale,area=XYWH((357+5)*scale,91*scale,626*scale,607*scale),topH=165*scale,
					  captionarea=XYWH(13*scale,42*scale,273*scale,33*scale),detailsarea=XYWH(13*scale,81*scale,273*scale,186*scale),infoarea=XYWH(19*scale,346*scale,269*scale,374*scale)},
		chat = {
			sidecheckbox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
			allcheckbox =  'SGUI/'.. curSide .. '/chat_allcheck.png',
			friendcheckbox =  'SGUI/'.. curSide .. '/chat_friendcheck.png',
			allycheckbox =  'SGUI/'.. curSide .. '/chat_allycheck.png',
			customcheckbox =  'SGUI/'.. curSide .. '/chat_customcheck.png',
			mutebox = 'SGUI/'.. curSide .. '/chat_mute.png',
		},
		achievsBG = {RGBA(64,39,3,150),RGBA(97,60,4,150)},
		achievsColourGreen = RGB(204,198,147);
		achievsColourGray = RGB(136*0.7,132*0.7,96*0.7);
		achievsProgresBar = RGB(204*0.7,198*0.7,147*0.7);
		specbar= interface.amer.game.ui.specbar,
		altFact = {
			background = BLACKA(180),
			sel = RGB(0,200,0),
			selW = RGB(200,0,0),
			unsel = RGB(255,229,189),
			unselW = RGB(255/2,229/2,189/2),

		},
	}

	curSide = 'Rus';

	interface.rus.dialog = {
		button      = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
		buttonDebrief      = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
			buttondd    = SetupDialogButtonDD(),
		background  = '/SGUI/'..curSide..'/textura03.png',
		background2 = '/SGUI/'..curSide..'/pad_back.png',
		pad         = {texture='',d=XYWH(0,(101+38-77)*scale,350*scale,200*scale),colour1=BLACKA(0),height=343*scale},
		medal       = '/SGUI/'..curSide..'/m',
		medals      = {[1]=XYWH(0,0,111*scale,133*scale),[2]=XYWH(111*scale,0,117*scale,133*scale),[3]=XYWH(228*scale,0,113*scale,133*scale),[4]=XYWH(111*scale,(170+1-38)*scale,117*scale,50*scale),},
		border      = SetupDialogBorderALL(Coord(50*scale,50*scale)),
			combo       = {[1]=RGB(0,0,0),[2]=RGB(128,7,14),[3]=RGB(244,228,212),[4]=RGB(255,205,200),},
			border2     = {Side = 'Rus',
						   TL = XYWH(-40*scale,-34*scale,70*scale,70*scale), TR = XYWH(-30*scale,-34*scale,70*scale,70*scale), BL = XYWH(-40*scale,-34*scale,70*scale,70*scale), BR = XYWH(-30*scale,-34*scale,70*scale,70*scale),
						   T = XYWH(30*scale,-34*scale,-60*scale,70*scale), B = XYWH(30*scale,-34*scale,-60*scale,70*scale), L = XYWH(-40*scale,28*scale,70*scale,-60*scale), R = XYWH(-30*scale,28*scale,70*scale,-60*scale),
						  },
	}

	interface.rus.debrief = {
		sideBox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
		win = '/SGUI/' .. curSide .. '/deb_multi_win'.. aspect..'.png',
		lose = '/SGUI/' .. curSide .. '/deb_multi_lose'.. aspect..'.png',
	};

	interface.rus.game.ui = {
		toolBtns   = SetupToolBtns(curSide,77*scale,3*scale,54*scale,19*scale,5*scale), --Side, X, Y, W, H, Step
		commBtns   = SetupCommBtns(curSide,6*scale,16*scale,41*scale,41*scale),
		toolBar    = Coord(382*scale,74*scale),
		pause      = XYWH(0,0,77*scale,74*scale),
		minimap    = {BACK = Coord(240*scale,241*scale), MAP = XYWH(22*scale,40*scale,203*scale,200*scale), COLOUR = RGB(63,78,47)},
		infopanel  = Coord(187*scale,241*scale),
		commpanel  = SetupCommPanel('CommPanel1.png','CommPanel2.png','CommPanel3.png',142*scale,197*scale),
		facepanel  = SetupFacePanel(99*scale,118*scale,197*scale), -- (FacePanelL Width, FacePanelR Width, Height)
		facearea   = XY(20*scale,10*scale),
		hintbar    = SetupHintBar(341*scale,224*scale,34*scale,Coord((187-19-3)*scale,8*scale)), -- L Width, R Width, H, X/Y of Hint Placement
		buttons    = '/SGUI/'..curSide..'/buttons.png',
		resbar     = {width=394*scale,x1=35*scale,w1=33*scale,w2=87*scale,y1=4*scale,h1=13*scale,x2=287*scale,w3=101*scale,fontcol1=RGB(200,200,200),fontcol2=RGB(255,0,0)},
		scrollsize = 10*scale,
		boxcols    = {border=RGB(81,121,87),background=RGB(0,0,0)},
		infocolour = RGB(57,126,72),--RGB(255,229,189),
			paramoff   = -8*scale,
			combooff   = 0,
			rewardlist = XYWH(328+30,76+14,631,600),
			rewardinner= XY(17+20,320+40),
			rewardhint = 230+35,
			rewardcap  = XY(320-20,18+14),
			undobutton = XY(14*scale,6*scale),
			redobutton = XY(18*scale,6*scale),
			speed      = XY(16*scale,26*scale),
		dip= {
			frame = 'SGUI/'..curSide..'/dip_sidePanel.png',
			back_req = 'SGUI/'..curSide..'/dip_request_back.png',
			left_req= 'SGUI/'..curSide..'/dip_request_left.png',
			right_req = 'SGUI/'..curSide..'/dip_request_right.png',
		},
			charselect = {enablecol=WHITE(),disablecol=WHITE(),butW=85*scale,butH=32*scale,area=XYWH((357+5)*scale,91*scale,626*scale,607*scale),topH=165*scale,
					  captionarea=XYWH(13*scale,42*scale,273*scale,33*scale),detailsarea=XYWH(13*scale,81*scale,273*scale,186*scale),infoarea=XYWH(19*scale,346*scale,269*scale,374*scale)},
		chat = {
			sidecheckbox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
			allcheckbox =  'SGUI/'.. curSide .. '/chat_allcheck.png',
			friendcheckbox =  'SGUI/'.. curSide .. '/chat_friendcheck.png',
			allycheckbox =  'SGUI/'.. curSide .. '/chat_allycheck.png',
			customcheckbox =  'SGUI/'.. curSide .. '/chat_customcheck.png',
			mutebox = 'SGUI/'.. curSide .. '/chat_mute.png',
		},
		achievsBG = {RGBA(25,0,0,180),RGBA(40,0,0,180)},
		achievsColourGreen = RGB(204,147,147),
		achievsColourGray = RGB(136*0.7,96*0.7,96*0.7),
		achievsProgresBar = RGB(204*0.7,147*0.7,147*0.7),
		specbar= interface.amer.game.ui.specbar,
		altFact = {
			background = BLACKA(0),
			sel = RGB(0,235,0),
			selW = RGB(150,0,0),
			unsel = RGB(57,126,72),
			unselW = RGB(57/2,126/2,72/2),

		},
	}


	curSide = "Ally"
	interface.ally.dialog = copytable(interface.amer.dialog);
	interface.ally.game.ui = copytable(interface.amer.game.ui);


	curSide = 'Spec';

	interface.spec.dialog = {
		button      = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
		buttonDebrief      = SetupDialogButton(curSide,'Tahoma_70_Fixed_16_2.DFF;'.. 0.38*scale ..';0.38;0.6;0',RGB(255,255,255),RGB(255,255,255)),
		buttondd    = SetupDialogButtonDD(),
		background  = '/SGUI/'..curSide..'/textura03.png',
		background2 = '/SGUI/'..curSide..'/textura01.png',
		pad         = {texture='/SGUI/'..curSide..'/pad.png',d=XYWH(10*scale,85*scale,320*scale,240*scale),height=420*scale},
		medal       = '/SGUI/'..curSide..'/m',
		medals      = {[1]=XYWH(0,0,115*scale,240*scale),[2]=XYWH(115*scale,0,85*scale,240*scale),[3]=XYWH(200*scale,0,120*scale,240*scale),[4]=XYWH(110*scale,170*scale,100*scale,70*scale),},
		border      = SetupDialogBorderHalf(Coord(63*scale,62*scale),Coord(0,0)),
			combo       = {[1]=RGB(16,32,24),[2]=RGB(34,90,76),[3]=RGB(250,249,254),[4]=RGB(231,255,255),},
	}

	interface.spec.debrief = {
		win = '/SGUI/' .. curSide .. '/deb_multi_win'.. aspect..'.png',
		lose = '/SGUI/' .. curSide .. '/deb_multi_lose'.. aspect..'.png',
		sideBox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
	};


	interface.spec.game.ui = {
		toolBtns   = SetupToolBtns(curSide,100*scale,1*scale,49*scale,23*scale,14*scale), --Side, X, Y, W, H, Step
		commBtns   = SetupCommBtns(curSide,2*scale,0,41*scale,41*scale),
		toolBar    = Coord(382*scale,54*scale),
		pause      = XYWH(13*scale,6*scale,36*scale,39*scale),
		minimap    = {BACK = Coord(248*scale,245*scale), MAP = XYWH(34*scale,43*scale,202*scale,201*scale), COLOUR = RGB(63,78,47)},
		infopanel  = Coord(200*scale,245*scale),
		commpanel  = SetupCommPanel('CommPanel1.png','CommPanel2.png','CommPanel3.png',154*scale,192*scale),
		facepanel  = SetupFacePanel(9*scale,9*scale,192*scale), -- (FacePanelL Width, FacePanelR Width, Height)
		facearea   = XY(10*scale,10*scale),
		hintbar    = SetupHintBar(362*scale,211*scale,22*scale,Coord(12*scale,-3*scale)), -- L Width, R Width, H, X/Y of Hint Placement
		buttons    = '/SGUI/'..curSide..'/buttons.png',
		resbar     = {width=507*scale,x1=57*scale,w1=49*scale,w2=106*scale,y1=6*scale,h1=13*scale,x2=351*scale,w3=135*scale,fontcol1=RGB(200,200,200),fontcol2=RGB(255,0,0)},
		scrollsize = 16*scale,
		boxcols    = {border=RGB(76,148,128),background=RGB(16,31,24)},
		infocolour = RGB(86,173,134),
			paramoff   = 0,
			combooff   = -6*scale,
			rewardlist = XYWH(328-15,76,631+30,600),
			rewardinner = XY(17,320),
			rewardhint  = 230,
			rewardcap  = XY(320,18),
			undobutton = XY(14*scale,6*scale),
			redobutton = XY(35*scale,6*scale),
			speed      = XY(10*scale,31*scale),
		dip= {
			frame = 'SGUI/'..curSide..'/dip_sidePanel.png',
			back_req = 'SGUI/'..curSide..'/dip_request_back.png',
			left_req= 'SGUI/'..curSide..'/dip_request_left.png',
			right_req = 'SGUI/'..curSide..'/dip_request_right.png',
		},
			charselect = {enablecol=RGB(71,233,201),disablecol=RGB(127,127,127),butW=77*scale,butH=27*scale,area=XYWH(279*scale,31*scale,732*scale,660*scale),topH=135*scale,
					  captionarea=XYWH(0,18*scale,320*scale,39*scale),detailsarea=XYWH(15*scale,80*scale,230*scale,50*scale),infoarea=XYWH(17*scale,320*scale,230*scale,400*scale)},
		chat = {
			sidecheckbox = 'SGUI/'.. curSide .. '/deb_debriefbox.png',
			allcheckbox =  'SGUI/'.. curSide .. '/chat_allcheck.png',
			friendcheckbox =  'SGUI/'.. curSide .. '/chat_friendcheck.png',
			allycheckbox =  'SGUI/'.. curSide .. '/chat_allycheck.png',
			customcheckbox =  'SGUI/'.. curSide .. '/chat_customcheck.png',
			mutebox = 'SGUI/'.. curSide .. '/chat_mute.png',
		},
		achievsBG = {RGBA(10,31,20,255),RGBA(6,18,12,255)},
		specbar= interface.amer.game.ui.specbar,
		altFact = {
			background = BLACKA(20),
			sel = RGB(0,200,0),
			selW = RGB(200,0,0),
			unsel = RGB(255,229,189),
			unselW = RGB(255/2,229/2,189/2),

		},
	}

	interface.current = interface.alien;
	interface.scale = scale;
end;

setInterfacePreferences(1);


Loading_SidePos = {};
Loading_SidePos[0] = { -- Alien
	Name  = XYWH(28,35,400,25),
	Coord = XYWH(28,70,400,25),
	Brief = XYWH(781,572,205,168),
};

Loading_SidePos[1] = { -- American
	Name  = XYWH(28,35,400,25),
	Coord = XYWH(28,70,400,25),
	Brief = XYWH(781,572,205,168),
};

Loading_SidePos[2] = { -- Russian
	Name  = XYWH(60,40,365,22),
	Coord = XYWH(60,70,365,22),
	Brief = XYWH(57,575,200,160),
};

Loading_SidePos[3] = { -- Arabian
	Name  = XYWH(60,40,365,22),
	Coord = XYWH(60,70,365,22),
	Brief = XYWH(57,575,200,160),
};

Loading_SidePos[4] = { -- Spectator
	Name  = XYWH(28,35,400,25),
	Coord = XYWH(28,70,400,25),
	Brief = XYWH(781,572,205,168),
};



