threedeespriteclass = {};

function threedeespriteclass.make(FILENAME)
	return {ID=THREEDEESPRITE_CREATE(FILENAME), free = threedeespriteclass.free, setPos = threedeespriteclass.setPos, getPos = threedeespriteclass.getPos,
			setFrame = threedeespriteclass.setFrame, getFrame = threedeespriteclass.getFrame, setVisible = threedeespriteclass.setVisible, getVisible = threedeespriteclass.getVisible,};
end;

function threedeespriteclass:free() -- Free's EXE Internals but not this class
	THREEDEESPRITE_FREE(self.ID);
end;

function threedeespriteclass:setPos(X,Y,Z)
	return THREEDEESPRITE_SETPOS(self.ID,X,Y,Z);
end;

function threedeespriteclass:getPos()
	return THREEDEESPRITE_GETPOS(self.ID);
end;

function threedeespriteclass:setFrame(FRAME)
	return THREEDEESPRITE_SETFRAME(self.ID,FRAME);
end;

function threedeespriteclass:getFrame()
	return THREEDEESPRITE_GETFRAME(self.ID);
end;

function threedeespriteclass:setVisible(ISVISIBLE)
	return THREEDEESPRITE_SETVISIBLE(self.ID,ISVISIBLE);
end;

function threedeespriteclass:getVisible()
	return THREEDEESPRITE_GETVISIBLE(self.ID);
end;

--------------------------------

function renderThreeDeeSprites()
	THREEDEESPRITE_RENDER();
end;

function setSunPosition(X,Y,Z)
	THREEDEESPRITE_SETSUNPOS(X,Y,Z);
end;

function loadThreeDeeSprite(FILENAME)
	return threedeespriteclass.make(FILENAME);
end;

