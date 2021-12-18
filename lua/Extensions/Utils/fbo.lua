fboclass = {};

function fboclass.make(WIDTH,HEIGHT,ISTRANSPARENT,USELINEAR,MULTISAMPLE) -- Multisample is 0 for no Multisample.
	return {ID=OGL_FBO_CREATE(WIDTH,HEIGHT,ISTRANSPARENT,USELINEAR,MULTISAMPLE),W=WIDTH,H=HEIGHT,T=ISTRANSPARENT,LINEAR=USELINEAR, free = fboclass.free, getTextureID = fboclass.getTextureID, doBegin = fboclass.doBegin,
			doEnd = fboclass.doEnd, resize = fboclass.resize, setClearColour = fboclass.setClearColour, copyToFBO = fboclass.copyToFBO };
end;

function fboclass:free() -- Free's EXE Internals but not this class
	OGL_FBO_FREE(self.ID);
end;

function fboclass:getTextureID()
	return OGL_FBO_GET_TEXTUREID(self.ID);
end;

function fboclass:doBegin()
	OGL_FBO_BEGIN(self.ID);
end;

function fboclass:doEnd()
	OGL_FBO_END(self.ID);
end;

function fboclass:setClearColour(R,G,B,A) -- 0 to 255 RGBA values
	OGL_FBO_CLEARCOLOUR(self.ID,R,G,B,A);
end;

function fboclass:copyToFBO(TARGET) -- Copy from Multisample to non-multisample FBO
	OGL_FBO_COPY(self.ID,TARGET.ID);
end;

function fboclass:resize(WIDTH,HEIGHT)
	if (WIDTH == self.W) and (HEIGHT == self.H) then
		return false;
	end;

	self:free();
	self.W  = WIDTH;
	self.H  = HEIGHT;
	self.ID = OGL_FBO_CREATE(self.W,self.H,self.T,self.LINEAR);
	return true;
end;