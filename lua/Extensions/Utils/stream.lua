STREAM_I8   = 0;
STREAM_I16  = 1;
STREAM_I32  = 2;
STREAM_UI8  = 3;
STREAM_UI16 = 4;
STREAM_UI32 = 5;
STREAM_CHAR = 7;
STREAM_BOOL = 8;

streamclass = {};

function streamclass.make(FILENAME,OPENREAD)
	return {ID=STREAM_CREATE(FILENAME,OPENREAD), 
			free = streamclass.free, size = streamclass.size, getPos = streamclass.getPos, reset = streamclass.reset, readData = streamclass.readData
			, writeData = streamclass.writeData};
end;

function streamclass:free() -- Free's EXE Internals but not this class
	STREAM_FREE(self.ID);
end;

function streamclass:size()
	return STREAM_SIZE(self.ID);
end;

function streamclass:getPos()
	return STREAM_GETPOS(self.ID);
end;

function streamclass:setPos(VALUE)
	STREAM_SETPOS(self.ID,VALUE);
end;

function streamclass:reset()
	STREAM_RESET(self.ID);
end;

function streamclass:readData(TYP)
	return STREAM_READ(self.ID,TYP);
end;

function streamclass:writeData(TYP,VALUE)
	return STREAM_WRITE(self.ID,TYP,VALUE);
end;
