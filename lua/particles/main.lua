------------------------| UTILS |------------------------
CONST_TIME = 1/35;
CONST_ANIMTIME = 1/12;

function SET_X(UID,PID,VALUE)
	PARTICLE_SET(UID,PID-1,PARTICLE_SET_X,VALUE);
end;
function SET_Y(UID,PID,VALUE)
	PARTICLE_SET(UID,PID-1,PARTICLE_SET_Y,VALUE);
end;
function SET_XY(UID,PID,VALUE1,VALUE2)
	SET_X(UID,PID,VALUE1);
	SET_Y(UID,PID,VALUE2);
end;
function SET_Z(UID,PID,VALUE)
	PARTICLE_SET(UID,PID-1,PARTICLE_SET_Z,VALUE);
end;
function SET_VIS(UID,PID,VALUE)
	PARTICLE_SET(UID,PID-1,PARTICLE_SET_VIS,VALUE);
end;
function SET_FRAME(UID,PID,VALUE)
	PARTICLE_SET(UID,PID-1,PARTICLE_SET_FRAME,VALUE);
end;
function SET_TEX(UID,PID,VALUE)
	PARTICLE_SET(UID,PID-1,PARTICLE_SET_TEX,VALUE);
end;

function distance( x1, y1, x2, y2 )
	return math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
end

------------------------| PARTICLES |------------------------

TEST = {LIST={}};

function TEST.add(UID,X,Y,COUNT)
	local CLOUD = {PARTICLES={}, C = COUNT, FADEOUT = false};
	
	for i = 1,COUNT do
		CLOUD.PARTICLES[i] = {IMG=nil,TIME=-i/10};
	end;
	
	TEST.LIST[UID+1] = CLOUD;
end;

PART_TEX_LIST = {[0]='obl0',[1]='obl1',[2]='obl2',[3]='plamen'};

function TEST.tick(UID,X,Y,PARTICLES)
	local CLOUD = TEST.LIST[UID+1];
	local P = nil;
	local CP = 0;
	
	for I = 1,CLOUD.C do
		P = CLOUD.PARTICLES[I];
		if not PARTICLES[I].VIS then
			if not CLOUD.FADEOUT then
				--if P.IMG == nil then
				--	SET_TEX(UID,I,'ohen/obl2');
				--	P.IMG = true;
				--end;
				
				if P.TIME < 0 then
					P.TIME = P.TIME + CONST_TIME;
				else				
					SET_TEX(UID,I,'ohen/'..PART_TEX_LIST[math.random(3)-1]);
			
					SET_VIS(UID,I,true);			
					SET_X(UID,I,X+math.random(100)-50);
					SET_Y(UID,I,Y+math.random(100)-50);
					SET_Z(UID,I,30);
					SET_FRAME(UID,I,1);
				end;
			end;
		else
			P.TIME = P.TIME + CONST_TIME;
			
			if P.TIME >= CONST_ANIMTIME then
				PARTICLES[I].FRAME = PARTICLES[I].FRAME + 1;
				P.TIME = P.TIME - CONST_ANIMTIME;
				if PARTICLES[I].FRAME > 15 then
					PARTICLES[I].FRAME = 1;
					SET_VIS(UID,I,false);
				end;
				
				SET_FRAME(UID,I,PARTICLES[I].FRAME);
				
				PARTICLES[I].Z = PARTICLES[I].Z + 4;
				if PARTICLES[I].Z > 127 then
					PARTICLES[I].Z = 30;
				end;
		
				SET_Z(UID,I,PARTICLES[I].Z);
			end;
			
			CP = CP + 1;
		end;
	end;
	
	if CLOUD.FADEOUT and (CP == 0) then -- We have no more particles active so kill the cloud
		CLOUD_KILL(UID);
	end;
end;

function TEST.fade(UID)
	local CLOUD = TEST.LIST[UID+1];
	CLOUD.FADEOUT = true;
end;

ACLOUD = {LIST={}};

function ACLOUD.add(UID,X,Y,COUNT)
	local CLOUD = {PARTICLES={}, C = COUNT, FADEOUT = false};
	
	for i = 1,COUNT do
		CLOUD.PARTICLES[i] = {IMG=nil,TIME=-i/10};
	end;
	
	ACLOUD.LIST[UID+1] = CLOUD;
end;

function ACLOUD.process(UID,P,I)
	local d = distance(P.X,P.Y,P.TOx,P.TOy);
	
	if d <= 1 then
		P.X = P.TOx;
		P.Y = P.TOy;
		SET_VIS(UID,I,false);
	else
		P.NormX = (P.TOx-P.X)/d; 
		P.NormY = (P.TOy-P.Y)/d;
	
		P.X = P.X + (P.TOx-P.X)/d;	
		P.Y = P.Y + (P.TOy-P.Y)/d;
	
		SET_X(UID,I,P.X);
		SET_Y(UID,I,P.Y);
	end;
end;

function ACLOUD.tick(UID,X,Y,PARTICLES)
	local CLOUD = ACLOUD.LIST[UID+1];
	local P = nil;
	local CP = 0;
	
	for I = 1,CLOUD.C do
		P = CLOUD.PARTICLES[I];
		if not PARTICLES[I].VIS then
			if not CLOUD.FADEOUT then
				--if P.IMG == nil then
				--	SET_TEX(UID,I,'ohen/obl2');
				--	P.IMG = true;
				--end;
				
				if P.TIME < 0 then
					P.TIME = P.TIME + CONST_TIME;
				else				
					P.TOx = 0;
					P.X = X+math.random(2000);
					P.Y = Y+math.random(2000)-1000;
					P.TOy = P.Y;
					SET_TEX(UID,I,'cloud');
			
					SET_VIS(UID,I,true);			
					SET_X(UID,I,P.X);
					SET_Y(UID,I,P.Y);
					SET_Z(UID,I,30);
					SET_FRAME(UID,I,math.random(1,6));
				end;
			end;
		else
			P.TIME = P.TIME + CONST_TIME;
			
			if P.TIME >= CONST_ANIMTIME then
				ACLOUD.process(UID,P,I);
			end;
			
			CP = CP + 1;
		end;
	end;
	
	if CLOUD.FADEOUT and (CP == 0) then -- We have no more particles active so kill the cloud
		CLOUD_KILL(UID);
	end;
end;

function ACLOUD.fade(UID)
	local CLOUD = ACLOUD.LIST[UID+1];
	CLOUD.FADEOUT = true;
end;

GHOST = {LIST={}};

function GHOST.add(UID,X,Y,COUNT)
	local CLOUD = {PARTICLES={}, C = COUNT, FADEOUT = false};
	
	for i = 1,COUNT do
		CLOUD.PARTICLES[i] = {IMG=nil,TIME=-i/10};
	end;
	
	GHOST.LIST[UID+1] = CLOUD;
end;

function GHOST.newPos(P)
	P.TOx = P.X + math.random(100)-51;
	P.TOy = P.Y + math.random(100)-51;
end;

function GHOST.process(UID,P,I)
	local d = distance(P.X,P.Y,P.TOx,P.TOy);
	
	if d <= 1 then
		GHOST.newPos(P);
	else
		P.NormX = (P.TOx-P.X)/d; 
		P.NormY = (P.TOy-P.Y)/d;
	
		P.X = P.X + (P.TOx-P.X)/d;	
		P.Y = P.Y + (P.TOy-P.Y)/d;
	
		SET_X(UID,I,P.X);
		SET_Y(UID,I,P.Y);
	end;
end;

function GHOST.tick(UID,X,Y,PARTICLES)
	local CLOUD = GHOST.LIST[UID+1];
	local P = nil;
	
	for I = 1,CLOUD.C do
		P = CLOUD.PARTICLES[I];
		if not PARTICLES[I].VIS then
			if not CLOUD.FADEOUT then
				--if P.IMG == nil then
				--	SET_TEX(UID,I,'ohen/obl2');
				--	P.IMG = true;
				--end;
				
				if P.TIME < 0 then
					P.TIME = P.TIME + CONST_TIME;
				else				
					SET_TEX(UID,I,'missiles/projektil_w-r-srock');
			
					SET_VIS(UID,I,true);	

					P.X = X;
					P.Y = Y;
					
					GHOST.newPos(P);
					
					SET_X(UID,I,X);
					SET_Y(UID,I,Y);
					SET_Z(UID,I,-200);
					
					SET_FRAME(UID,I,1);
				end;
			end;
		else
			P.TIME = P.TIME + CONST_TIME;
			
			if P.TIME >= CONST_ANIMTIME then
				P.TIME = P.TIME - CONST_ANIMTIME;
				
				--P.X = PARTICLES[I].X;
				--P.Y = PARTICLES[I].Y;
				
				GHOST.process(UID,P,I);
				
				SET_FRAME(UID,I,math.modf(13 + math.deg(math.atan2(P.NormY,P.NormX))/360*72,72)+1);
			end;
		end;
	end;
	
	if CLOUD.FADEOUT then
		CLOUD_KILL(UID);
	end;
end;

function GHOST.fade(UID)
	local CLOUD = GHOST.LIST[UID+1];
	CLOUD.FADEOUT = true;
end;