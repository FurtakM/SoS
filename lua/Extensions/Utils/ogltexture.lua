ogltexclass = {};

function ogltexclass.make(FILENAME,LINEAR)
	local ourID = OGL_TEXTURE_LOAD(FILENAME,LINEAR);
	local width,height = OGL_TEXTURE_GET_WH(ourID);
	return {ID=ourID,TEXID=OGL_TEXTURE_GET_ID(ourID),W=width,H=height,
			free = ogltexclass.free, bind = ogltexclass.bind, getTextureID = ogltexclass.getTextureID, };
end;

function ogltexclass:free() -- Free's EXE Internals but not this class
	OGL_TEXTURE_FREE(self.ID);
end;

function ogltexclass:bind()
	OGL_TEXTURE_BIND(self.ID);
end;

function ogltexclass:getTextureID()
	return self.TEXID;
end;

----------------------------------------------------------

function loadOGLTexture(FILENAME,LINEAR)
	return ogltexclass.make(FILENAME,LINEAR);
end;