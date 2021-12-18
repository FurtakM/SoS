grid2Dclass = {};

function grid2Dclass.make(WIDTH,HEIGHT)
	return {ID=GRID2D_CREATE(WIDTH,HEIGHT), free=grid2Dclass.free, loadFromStream = grid2Dclass.loadFromStream, saveToStream = grid2Dclass.saveToStream, get = grid2Dclass.get, set = grid2Dclass.set};
end;

function grid2Dclass:free() -- Free's EXE Internals but not this class
	GRID2D_FREE(self.ID);
end;

function grid2Dclass:loadFromStream(STREAM)
	GRID2D_LOADFROMSTREAM(self.ID,STREAM.ID);
end;

function grid2Dclass:saveToStream(STREAM)
	GRID2D_SAVETOSTREAM(self.ID,STREAM.ID);
end;

function grid2Dclass:set(X,Y,VALUE)
	GRID2D_SET(self.ID,X,Y,VALUE);
end;

function grid2Dclass:get(X,Y)
	return GRID2D_GET(self.ID,X,Y);
end;
