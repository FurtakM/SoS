function UV(SX,SY,SW,SH) -- Identical to XYWH
	return {X = SX, Y = SY, W = SW, H = SH};
end;

fast2Dclass = {};

function fast2Dclass.make(XYWHV,HEIGHT)
	return {ID=FAST2D_CREATE(XYWHV.X,HEIGHT-XYWHV.H,XYWHV.W,HEIGHT-XYWHV.Y),H=HEIGHT, COUNT=0, free=fast2Dclass.free, addEX=fast2Dclass.addEX, add=fast2Dclass.add, delete=fast2Dclass.delete, 
			clear=fast2Dclass.clear, render=fast2Dclass.render, renderSingleList=fast2Dclass.renderSingleList,
	        setVisible=fast2Dclass.setVisible, setTexture=fast2Dclass.setTexture, setXYWH=fast2Dclass.setXYWH, setUV=fast2Dclass.setUV, setALL=fast2Dclass.setALL, getXY=fast2Dclass.getXY,
			getVisible=fast2Dclass.getVisible, setFrustrum = fast2Dclass.setFrustrum, setExtra = fast2Dclass.setExtra, getExtra = fast2Dclass.getExtra};
end;

function fast2Dclass:free() -- Free's EXE Internals but not this class
	FAST2D_FREE(self.ID);
end;

function fast2Dclass:setFrustrum(XYWHV)
	FAST2D_SETFRUSTRUM(self.ID,XYWHV.X,self.H-XYWHV.H,XYWHV.W,self.H-XYWHV.Y);
end;

function fast2Dclass:addEX(XYWHV,UVV,Z,PALOFF,TEXTUREID,VISIBLE,EXTRA1,EXTRA2,EXTRA3,EXTRA4)
	return FAST2D_ADD(self.ID,XYWHV.X,self.H-XYWHV.Y-XYWHV.H,XYWHV.W,XYWHV.H,UVV.X,UVV.Y,UVV.W,UVV.H,Z,PALOFF,TEXTUREID,VISIBLE,EXTRA1,EXTRA2,EXTRA3,EXTRA4);
end;

function fast2Dclass:add(XYWHV,TEXTUREID,VISIBLE)
	return self:addEX(XYWHV,UV(0,0,1,1),0,0,TEXTUREID,VISIBLE);
end;

function fast2Dclass:delete(INDEX)
	FAST2D_DELETE(self.ID,INDEX);
end;

function fast2Dclass:clear()
	FAST2D_CLEAR(self.ID);
end;

function fast2Dclass:render(MODE,CLEAR,EXITCLEAR) -- Use this if you don't care about render order. It is faster (Less draw calls)
	FAST2D_RENDER(self.ID,MODE,CLEAR,EXITCLEAR);
end;

function fast2Dclass:renderSingleList(MODE) -- Use this if you need to preserve the order things are rendered. It is slower (More draw calls)
	FAST2D_RENDER_SL(self.ID,MODE);
end;

function fast2Dclass:setVisible(INDEX,VISIBLE)
	FAST2D_SETVISIBLE(self.ID,INDEX,VISIBLE);
end;

function fast2Dclass:setTexture(INDEX,TEXTUREID)
	FAST2D_SETTEXTUREID(self.ID,INDEX,TEXTUREID);
end;

function fast2Dclass:setXYWH(INDEX,XYWHV)
	FAST2D_SETXYWH(self.ID,INDEX,XYWHV.X,self.H-XYWHV.Y-XYWHV.H,XYWHV.W,XYWHV.H);
end;

function fast2Dclass:setUV(INDEX,UVV) -- use UV() to set
	FAST2D_SETUV(self.ID,INDEX,UVV.X,UVV.Y,UVV.W,UVV.H);
end;

function fast2Dclass:setALL(INDEX,XYWHV,UVV,Z,PALOFF,TEXTUREID,VISIBLE)
	FAST2D_SETALL(self.ID,INDEX,XYWHV.X,XYWHV.Y,XYWHV.W,XYWHV.H,UVV.X,UVV.Y,UVV.W,UVV.H,Z,PALOFF,TEXTUREID,VISIBLE);
end;

function fast2Dclass:getXY(INDEX)
	local X,Y,H = FAST2D_GETXYH(self.ID,INDEX);
	return X,self.H-(Y+H);
end;

function fast2Dclass:getVisible(INDEX)
	return FAST2D_GETVISIBLE(self.ID,INDEX);
end;

function fast2Dclass:setExtra(INDEX,A,B,C,D)
	FAST2D_SETEXTRA2(self.ID,INDEX,A,B,C,D);
end;

function fast2Dclass:getExtra(INDEX,A,B,C,D)
	return FAST2D_GETEXTRA2(self.ID,INDEX,A,B,C,D);
end;