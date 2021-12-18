floating_hint = getLabelEX(nil,anchorNone,XYWH(0,0,0,0),Tahoma_13,'',
	{
		visible=false,automaxwidth=300,
		autosize=true,
		wordwrap=true,
		font_colour=RGB(221,224,211),
		border_type=BORDER_TYPE_OUTER,
		border_colour=RGB(70,128,116),
		colour1=RGBA(11,22,16,200),
		nomouseevent=true,
		shadowtext=true,
		special=true,
		});

floating_hint.timer = 0;

function FROMSGUI_HINT_SHOW(HINT,X,Y)
	setXYWHV(floating_hint,X,Y,0,0);
	setText(floating_hint,HINT);
	sgui_autosizecheck(floating_hint.ID);
	local ny = Y+34;--getHeight(floating_hint);
	--[[if (ny < 0) then
		ny = Y+30;
	end;--]]
	if ny+getHeight(floating_hint) > ScrHeight then
		ny = ScrHeight-34-getHeight(floating_hint);
	end;
	setY(floating_hint,ny);
	if (X+getWidth(floating_hint) > ScrWidth) then
		setX(floating_hint,ScrWidth-getWidth(floating_hint));
	end;
	bringToFront(floating_hint);
	setVisible(floating_hint,true);

	floating_hint.timer = AddRepeatableTimer(5,'setVisible(floating_hint,false);',floating_hint.timer);
end;

function FROMSGUI_HINT_HIDE()
	setVisible(floating_hint,false);
end;
