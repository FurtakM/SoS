include('Extensions/Utils/fbo', 'Extensions/Utils/glsl', 'Extensions/Utils/ogltexture', 'Extensions/Utils/3dsprite');
include('Extensions/Utils/fast2D', 'Extensions/Utils/OpenGL', 'Extensions/Utils/stream', 'Extensions/Utils/grid2D');

transition = {
	TIME = 0,
	ACTIVE = false
};

function transition:init(WIDTH, HEIGHT)
	self.GLSL = loadGLSL('transition');
	self.QSLoc = self.GLSL:getLocation('QS');
	self.iTime = self.GLSL:getLocation('iTime');
	self.iTotalTime = self.GLSL:getLocation('iTotalTime');	
	
	self.FBO = fboclass.make(WIDTH, HEIGHT, false, true, false);
end;

function transition:getTextureID()
	return self.FBO:getTextureID();
end;

function transition:doRender(FRAMETIME)
	if not self.ACTIVE then
		return;
	end;

	if (self.TIME > self.TOTALTIME) then
		self.ACTIVE = false;
	end;

	-- debug2({self.TIME, self.TOTALTIME, self.iTime, self.ACTIVE});
	
	self.TIME = self.TIME + FRAMETIME;
	
	self.FBO:setClearColour(0, 0, 0, 255);
	
	self.FBO:doBegin();
	OGL_BEGIN();
	OGL_GLENABLE(GL_BLEND);
	OGL_QUAD_BEGIN2D(self.FBO.W,self.FBO.H);
	
	OGL_ACTIVE_TEXTURE(GL_TEXTURE1);
	OGL_TEXTURE_BINDID(self.TEXTURE1);
	OGL_ACTIVE_TEXTURE(GL_TEXTURE0);
	OGL_TEXTURE_BINDID(self.TEXTURE2);
	
	self.GLSL:use();
	
	self.GLSL:setUniform4F(self.QSLoc, 0, 0, self.FBO.W, self.FBO.H);
	self.GLSL:setUniform1F(self.iTime, self.TIME);
	-- self.GLSL:setUniform1F(self.iTotalTime, self.TOTALTIME);			
	
	OGL_DRAW_ARRAYS(GL_TRIANGLES, 0, 6);

	OGL_QUAD_END2D();
	OGL_GLDISABLE(GL_BLEND);
	OGL_END();
	self.FBO:doEnd();
end;

function transition:doTransition(TEXTURE1, TEXTURE2, TOTALTIME)
	self.TEXTURE1 = TEXTURE1;
	self.TEXTURE2 = TEXTURE2;
	self.TOTALTIME = TOTALTIME;
	self.ACTIVE   = true;
	self.TIME     = 0;
	-- self:doRender(0);
end;

function transition:setActivity(MODE)
	self.ACTIVE = MODE;
end;

function transition:repeatTransition(TEXTURE)
	self.TEXTURE1 = self.TEXTURE2;
	self.TEXTURE2 = TEXTURE;
	self.TIME = 1;
	self.ACTIVE = true;
	self:doRender(0);
end

SGUI_register_tick_callback('transition:doRender(%frametime)');