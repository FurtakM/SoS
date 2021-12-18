glslclass = {};

function glslclass.make(NAME)
	return {ID=OGL_GLSL_CREATE('shaders/'..NAME..'.vglsl','shaders/'..NAME..'.fglsl'),free = glslclass.free, use = glslclass.use, setMatrixs = glslclass.setMatrixs, getLocation = glslclass.getLocation,
	setUniform1F = glslclass.setUniform1F, setUniform2F = glslclass.setUniform2F, setUniform3F = glslclass.setUniform3F, setUniform4F = glslclass.setUniform4F};
end;

function glslclass:free() -- Free's EXE Internals but not this class
	OGL_GLSL_FREE(self.ID);
end;

function glslclass:use() 
	OGL_GLSL_BIND(self.ID);
	OGL_GLSL_SETMATRIXS(self.ID);
end;

function glslclass:setMatrixs()
	OGL_GLSL_SETMATRIXS(self.ID);
end;

function glslclass:getLocation(NAME)
	return OGL_GLSL_GETLOCATION(self.ID,NAME);
end;

function glslclass:setUniform1F(LOCATION_ID, VALUE1)
	OGL_GLSL_SETUNIFORM1F(self.ID, LOCATION_ID, VALUE1);
end;

function glslclass:setUniform2F(LOCATION_ID, VALUE1, VALUE2)
	OGL_GLSL_SETUNIFORM2F(self.ID, LOCATION_ID, VALUE1, VALUE2);
end;

function glslclass:setUniform3F(LOCATION_ID, VALUE1, VALUE2, VALUE3)
	OGL_GLSL_SETUNIFORM3F(self.ID, LOCATION_ID, VALUE1, VALUE2, VALUE3);
end;

function glslclass:setUniform4F(LOCATION_ID, VALUE1, VALUE2, VALUE3, VALUE4)
	OGL_GLSL_SETUNIFORM4F(self.ID, LOCATION_ID, VALUE1, VALUE2, VALUE3, VALUE4);
end;

----------------------------------------------------------------------------------------

function loadGLSL(NAME)
	return glslclass.make(NAME);
end;