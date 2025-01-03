-----------------------------------------------------------------------------
---  Orig. File : /lua/InGame/game_pings.lua
---  Version    : 4
---
---  Summary    : Pings System
---
---  Created    : Petr 'Sali' Salak, Freya Group
---               Morgan Nao
------------------------------------------------------------------------------

function setCallbackForPing(bool,type)
	if bool then
		set_Callback(gamewindow.ID,CALLBACK_MOUSECLICK,'PingLocation(%x,%y,'.. type .. '); setCallbackForPing(false,0);');
	else
		set_Callback(gamewindow.ID,CALLBACK_MOUSECLICK,'');
	end;
end;

game.ui.ping={};

ping = {
	time = 0, 
	timer = {}
};

ping.transparentelement = getElementEX(
	gamewindow.overlay,
	anchorLTRB,
	XYWH(0, 0, ScrWidth, ScrHeight),
	true,
	{
		nomouseevent = true,
		colour1 = BLACKA(0)
	}
);
ping.transparentelement.ping = {};
ping.transparentelement.Count = 0;

function createPing(i, X, Y, S, T)
	ping.transparentelement.ping[i] = getElementEX(
		ping.transparentelement,
		anchorNone,
		XYWH(X - 15, Y - 15, 50, 50),
		true,
		{
			nomouseevent = true,
			colour1 = SIDE_COLOURS[S], 
			texture = 'SGUI/Pings/side.png',
			alpha = 0
		}
	);

	ping.transparentelement.ping[i].img = getElementEX(
		ping.transparentelement.ping[i],
		anchorNone,
		XYWH(0, 0, 50, 50),
		true,
		{
			nomouseevent = true,
			colour1 = WHITEA(250), 
			texture = 'SGUI/Pings/'.. ping.tex[T] ..'.png'
		}
	);

	ping.transparentelement.ping[i].side = S;
	
	AddEventFade(
		ping.transparentelement.ping[i].ID,
		200,
		menu_fade_time
	);
end;

ping.colours = {
	[1] = RGBA(0,255,255,255),
	[2] = RGBA(255,255,0,255),
	[3] = RGBA(255,0,0,255),
	[4] = RGBA(255,255,255,255),
};
ping.tex = {
	[1] = 'defend',
	[2] = 'assist',
	[3] = 'attack',
	[4] = 'move',
};
ping.sounds = {
	[1] = 'Effects/Pings/10.ogg',
	[2] = 'Effects/Pings/3.ogg',
	[3] = 'Effects/Pings/1.ogg',
	[4] = 'Effects/Pings/11.ogg',
};

--pingMode = OW_SETTING_READ_BOOLEAN('OPTIONS', 'pingMode', false);
function PingLocation(X,Y,T)
    local MVR = OW_GETMVRXY();
	local HV = {};
	if pingMode then
		HV = getChatRecipients(1);  -- 1 ally, 2 friends, 3 all, 4 custom
	else
		HV = getChatRecipients(game.chat.currentpool);
	end;
	local recipients = 0;
	for k, v in pairs(HV) do
		recipients = OW_BINARY_ADD(recipients,1,v,1);
	end;
	
	--debugIngameChat('recipients number ' .. recipients);
	
    OW_CUSTOM_COMMAND_SGUI(42000,T,X+MVR.X,Y+MVR.Y,recipients);
end;

function LocalPing(side,T,X,Y)
	local r = OW_HEXTOSCREEN(X,Y);

	SetPing(side,T,r.X,r.Y);
end;

function SetPing(side,T,X,Y)
	local i = ping.transparentelement.Count+1;
	local sidePings = {};
	local sidePingsCount = 0;
	for n= 1, ping.transparentelement.Count do
		if not ping.transparentelement.ping[n] then
			if n < i then
				i = n;
			end;
		elseif (ping.transparentelement.ping[n].side == side) and getVisible(ping.transparentelement.ping[n]) then
			sidePingsCount = sidePingsCount+1;
			sidePings[sidePingsCount] = ping.transparentelement.ping[n];
		end;
	end;
	if i > ping.transparentelement.Count then
		ping.transparentelement.Count = i;
	end;
	createPing(i,X,Y,side,T);
	AddSingleUseTimer(10,'ping_delete('..i..');');

	local MDATA = OW_MAPTOMINIMAPXY(X,Y);
	local MPing = getElementEX(game.ui.minimap.map.img,anchorLT,XYWH(MDATA.X-10,MDATA.Y-10,20,20),true,{nomouseevent=true,colour1=ping.colours[T], texture='SGUI/Pings/minimap point.png'});

	AddSingleUseTimer(3,'sgui_delete('..MPing.ID..');');
	sound.play(ping.sounds[T],'',VOLUME_EFFECTS);
	
	if sidePingsCount > 1 then
		for i =1 , sidePingsCount-1 do
			if getVisible(sidePings[i]) then
				AddEventFade(sidePings[i].ID,0,menu_fade_time,'setVisibleID('..sidePings[i].ID..',false)');
			end;
		end;
	end;
end;

function ping_delete(id)
	
	AddEventFade(ping.transparentelement.ping[id].ID,0,menu_fade_time,'setVisibleID('..ping.transparentelement.ping[id].ID..',false)');
	AddSingleUseTimer(3,'sgui_delete(ping.transparentelement.ping['..id..'].ID); ping.transparentelement.ping['..id..'] = nil;');

end;
--[[
function ping.tick(FRAMETIME)
--    ping.time = ping.time + FRAMETIME;
 --   if ping.time > 0.1 then
--        ping.time = 0;
	local show = false;
	for i = 1,ping.transparentelement.Count do
		if ping.transparentelement.ping[i] then
			show = true;
		end;
	end;
	if show and not getVisible (ping.transparentelement) then
		setVisible(ping.transparentelement,true);
	elseif not show and getVisible (ping.transparentelement) then
		setVisible(ping.transparentelement,false)
	end;

	--if getVisible (ping.transparentelement) then
	--		ping.MVR = OW_GETMVRXY();
	--		setXY(ping.transparentelement,-ping.MVR.X,-ping.MVR.Y);
	--end;
end;
--]]
--regTickCallback('ping.tick(%frametime);');

function FromOW_Ping(side, Param1, Param2, Param3, Param4)
	local thisPSide = 0;

	if MULTI_PLAYERINFO_CURRENT_PLID[MyID] then
		thisPSide = MULTI_PLAYERINFO_CURRENT_PLID[MyID].COLOUR + 1;
	end;
--	if not thisPSide == 0 then
		local isInRec = (OW_BINARY_GETBIT(Param4, thisPSide, 1) == 1);
		--debugIngameChat('isInRec number ' .. tostring(isInRec));
		if isInRec or side > 8 then
			SetPing(side + 1, Param1, Param2, Param3);
		end;
--	end;
end;


ping.clone = getElementEX(nil,anchorLT,XYWH(0,0,ScrWidth,ScrHeight),false,{colour1=BLACKA(0)});

set_Callback(gamewindow.ID,CALLBACK_MOUSEDOWN,'gamewindow.onMouseDown(%b,%x,%y);');
set_Callback(ping.clone.ID,CALLBACK_MOUSEUP,'HidePings(%b,false)');
set_Callback(gamewindow.ID,CALLBACK_MOUSEUP,'');


ping.wheelBox = getElementEX(ping.clone,anchorLT,XYWH(0,0,132,132),true,{nomouseevent=false, colour1=BLACKA(0)});
set_Callback(ping.wheelBox.ID,CALLBACK_MOUSEUP,'HidePings(%b,false)');
--   220, 220
--T 32,0,156,77
--L 0,32,77,156
--R 143,32,77,156
--B 32,143,156,77
-- 58,12,40,40
--  12,52,40,40
-- 28,58,40,40
-- 58,28,40,40
ping.wheelT = getElementEX(ping.wheelBox,anchorLTRB,XYWH(19,0,94,46),true,{nomouseevent=false, colour1=WHITEA(255),texture = 'SGUI/Pings/TopB.png',mask='SGUI/Pings/TopM.png'});
ping.wheelL = getElementEX(ping.wheelBox,anchorLTRB,XYWH(0,19,46,94),true,{nomouseevent=false, colour1=WHITEA(255),texture = 'SGUI/Pings/LeftB.png',mask='SGUI/Pings/LeftM.png'});
ping.wheelR = getElementEX(ping.wheelBox,anchorLTRB,XYWH(86,19,46,94),true,{nomouseevent=false, colour1=WHITEA(255),texture = 'SGUI/Pings/RightB.png',mask='SGUI/Pings/RightM.png'});
ping.wheelB = getElementEX(ping.wheelBox,anchorLTRB,XYWH(19,86,94,46),true,{nomouseevent=false, colour1=WHITEA(255),texture = 'SGUI/Pings/BottomB.png',mask='SGUI/Pings/BottomM.png'});
ping.wheelT.img = getElementEX(ping.wheelT,anchorLTRB,XYWH(35,7,25,25),true,{nomouseevent=true, colour1=WHITEA(255),texture='SGUI/Pings/Defend.png'});
ping.wheelL.img = getElementEX(ping.wheelL,anchorLTRB,XYWH(7,35,25,25),true,{nomouseevent=true, colour1=WHITEA(255),texture='SGUI/Pings/Assist.png'});
ping.wheelR.img = getElementEX(ping.wheelR,anchorLTRB,XYWH(17,35,25,25),true,{nomouseevent=true, colour1=WHITEA(255),texture='SGUI/Pings/Attack.png'});
ping.wheelB.img = getElementEX(ping.wheelB,anchorLTRB,XYWH(35,17,25,25),true,{nomouseevent=true, colour1=WHITEA(255),texture='SGUI/Pings/Move.png'});
set_Callback(ping.wheelT.ID,CALLBACK_MOUSEUP,'HidePings(%b,true,1)');
set_Callback(ping.wheelL.ID,CALLBACK_MOUSEUP,'HidePings(%b,true,2)');
set_Callback(ping.wheelR.ID,CALLBACK_MOUSEUP,'HidePings(%b,true,3)');
set_Callback(ping.wheelB.ID,CALLBACK_MOUSEUP,'HidePings(%b,true,4)');
set_Callback(ping.wheelT.ID,CALLBACK_MOUSEOVER,'setTexture(ping.wheelT,"SGUI/Pings/TopS.png");');
set_Callback(ping.wheelT.ID,CALLBACK_MOUSELEAVE,'setTexture(ping.wheelT,"SGUI/Pings/TopB.png");');
set_Callback(ping.wheelL.ID,CALLBACK_MOUSEOVER,'setTexture(ping.wheelL,"SGUI/Pings/LeftS.png");');
set_Callback(ping.wheelL.ID,CALLBACK_MOUSELEAVE,'setTexture(ping.wheelL,"SGUI/Pings/LeftB.png");');
set_Callback(ping.wheelR.ID,CALLBACK_MOUSEOVER,'setTexture(ping.wheelR,"SGUI/Pings/RightS.png");');
set_Callback(ping.wheelR.ID,CALLBACK_MOUSELEAVE,'setTexture(ping.wheelR,"SGUI/Pings/RightB.png");');
set_Callback(ping.wheelB.ID,CALLBACK_MOUSEOVER,'setTexture(ping.wheelB,"SGUI/Pings/BottomS.png");');
set_Callback(ping.wheelB.ID,CALLBACK_MOUSELEAVE,'setTexture(ping.wheelB,"SGUI/Pings/BottomB.png");');
--setVisible( ping.clone,true);
ping.X = 0;
ping.Y = 0;

gamewindow.moveWindow = false;
gamewindow.moveMVR = {};
gamewindow.moveXY = {};

function gamewindow.onMouseDown(B,X,Y)
	if (B ~= 2) then
		return;
	end;

	--clDebug({B, X, Y, SGUI_getkeystate(VK_CTRL)});

	if SGUI_getkeystate(VK_CTRL) and getvalue(OWV_MULTIPLAYER) then
		ShowPings(B,X,Y);
	else
		gamewindow.moveWindow = true;
		gamewindow.moveXY     = {mX = X, mY = Y};
		gamewindow.moveMVR    = OW_GETMVRXY();
		set_Callback(gamewindow.ID,CALLBACK_MOUSEUPANY,'gamewindow.onMouseUp(%b,%x,%y);');
		set_Callback(gamewindow.ID,CALLBACK_MOUSEMOVE,'gamewindow.onMouseMove(%x,%y);');
	end;
end;

function gamewindow.onMouseUp(B,X,Y)
	if (B ~= 2) then
		return;
	end;

	gamewindow.moveWindow = false;
	set_Callback(gamewindow.ID,CALLBACK_MOUSEUPANY,'');
	set_Callback(gamewindow.ID,CALLBACK_MOUSEMOVE,'');
end;

function gamewindow.onMouseMove(X,Y)
	if not (gamewindow.moveWindow) then
		return;
	end;

	OW_SETMVRXY(gamewindow.moveMVR.X+gamewindow.moveXY.mX-X,gamewindow.moveMVR.Y+gamewindow.moveXY.mY-Y);
end;

function ShowPings(B,X,Y)
  if (B == 2) and SGUI_getkeystate(VK_CTRL) and getvalue(OWV_MULTIPLAYER) then
    setVisible(ping.clone,true);
    ping.X = X;
    ping.Y = Y;
    local OffX = X;
    local OffY = Y;

    if X < 55 then
    	OffX = 55;
    elseif X > ScrWidth - 55 then
    	OffX = ScrWidth - 55;
    end;
    if Y < 55 then
    	OffY = 55;
    elseif Y > ScrHeight - 55 then
    	OffY = ScrHeight - 55;
    end;
    setXYV(ping.wheelBox,OffX-55, OffY-55);
    setVisible(ping.wheelBox,true);
  end;

end;

function HidePings(B,P,T)
 if getVisible(ping.wheelBox) then
  if B == 2 and P then
    setVisible(ping.clone,false);
    PingLocation(ping.X,ping.Y,T);
  elseif B == 2 and not P then
    setVisible(ping.clone,false);
  end;
 end;
end;

function ping.OnCustomCommand()
	switch(ccSystem.DATA[2]) : caseof {
		[42000]  = function (x)
						FromOW_Ping(ccSystem.DATA[1],ccSystem.DATA[3],ccSystem.DATA[4],ccSystem.DATA[5],ccSystem.DATA[6]);
					end,
	};
end;

ccSystem.add('ping.OnCustomCommand();');
