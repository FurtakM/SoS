GradButton_DevMode = {
	col1=RGB(119,0,0),
	col2=RGB(65,0,0),
	highlight1=RGB(149,0,0),
	highlight2=RGB(95,0,0),
	b_highlight1=RGB(108,0,0),
	b_highlight2=RGB(138,0,0),
	b_shadow1=RGB(36,0,0),
	b_shadow2=RGB(66,0,0),
}

	GradButton_DevMode_MP = {
		col1=RGB(119,60,0),
		col2=RGB(65,32,0),
		highlight1=RGB(149,75,0),
		highlight2=RGB(95,48,0),
		b_highlight1=RGB(108,54,0),
		b_highlight2=RGB(138,69,0),
		b_shadow1=RGB(36,18,0),
		b_shadow2=RGB(66,33,0),
	}

devmode = getElementEX(nil,anchorLTR,XYWH(150,-100,LayoutWidth-300,100),true,{colour1=BLACKA(200),});
devmode.init = false;

devmode.buttons = {COUNT=0,LIST={}};
function devmode.buttons.add(NAME,CALLBACK)
	devmode.buttons.COUNT = devmode.buttons.COUNT+1;
	devmode.buttons.LIST[devmode.buttons.COUNT] = getButtonEX_Gradient(devmode,anchorLB,XYWH(20,20,150,50),SKINTYPE_NONE,CALLBACK,GradButton_DevMode,
																		{font_colour_disabled=GRAY(200), font_name=Tahoma_12B, text_case=CASE_UPPER, text=NAME});
								
	return devmode.buttons.LIST[devmode.buttons.COUNT];
end;

function devmode.doInit()
	devmode.init = true;
	
	local w = Int((getWidth(devmode)-40)/160);
	local r = roundup(devmode.buttons.COUNT/w);
	local b = nil;
	local h = r*60+40;
	
	h = h + getHeight(devmode.tolua);
	
	setHeight(devmode,h);
	setY(devmode,-getHeight(devmode));
	
	for i=1,devmode.buttons.COUNT do
		b = devmode.buttons.LIST[i];
	
		setXY(b,20+mod(i-1,w)*160,20+div(i-1,w)*60);
	end;
end;

function devmode.changeRes(W,H)
	devmode.init = false;
	setY(devmode,-getHeight(devmode)+10);
	
	OW_DEBUG_RES(W,H);
end;

RELOADSGUI = devmode.buttons.add('Reload SGUI','sgui_debug(0);');
RELOADTEX  = devmode.buttons.add('Reload Textures','sgui_reloadtextures();');



devmode.tolua       = getElementEX(devmode,anchorLRB,XYWH(0,getHeight(devmode)-10-50,getWidth(devmode),50),true,{colour1=BLACKA(0),});
devmode.tolua.label = getLabelEX(devmode.tolua,anchorLTR,XYWH(20,0,getWidth(devmode.tolua)-40,0),Tahoma_12B,'Send To Lua:',{})
devmode.tolua.edit  = getEditEX(devmode.tolua,anchorLTR,XYWH(20,15,getWidth(devmode.tolua)-40,22),CourierNew_12B,'','',COLOURS_DIALOG_EDIT, {callback_keypress='devmode.tolua.edit.onKey(%k)'});
									
devmode.tolua.edit.last = '';
	
function devmode.tolua.edit.onKey(KEY)
	if (KEY == VK_RETURN) then 
		devmode.tolua.edit.last = getText(devmode.tolua.edit);
		runstring(getText(devmode.tolua.edit));
		setText(devmode.tolua.edit,"");
	elseif ((KEY == VK_UP) or (KEY == VK_DOWN)) then	
		if devmode.tolua.edit.last ~= '' then
			setText(devmode.tolua.edit,devmode.tolua.edit.last);
		end;
	end;
end;

getLabelEX(devmode,anchorLRB,XYWH(0,getHeight(devmode)-12,getWidth(devmode),10),Tahoma_12B,'Close',{colour1=BLACK(), text_case=CASE_UPPER, text_halign=ALIGN_MIDDLE, callback_mouseclick='devmode_openclose();',})

devmode.open = getLabelEX(nil,anchorL,XYWH(0,30,20,90),Tahoma_12B,'D'..CHAR13..'E'..CHAR13..'V'..CHAR13..'M'..CHAR13..'O'..CHAR13..'D'..CHAR13..'E',{special=true, nomouseevent=false, colour1=BLACK(), text_case=CASE_UPPER, text_halign=ALIGN_MIDDLE, callback_mouseup='devmode_openclose();',})

function devmode_openclose()
	if not devmode.init then
		devmode.doInit();
	end;
	
	bringToFront(devmode);

	if not devmode_moving then
		if (getY(devmode) == -getHeight(devmode)) then
			AddEventSlideYF(devmode.ID,0,0.5,nil);
			
			setFocus(devmode.tolua.edit);
		else
			if (getY(devmode) == 0) then
				AddEventSlideYF(devmode.ID,-getHeight(devmode),0.5,nil);
				clearFocus();
			end;
		end;
	end;
end;

