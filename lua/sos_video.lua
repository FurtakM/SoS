function inGameOn(VIS)
	setVisible(game.filmtop, VIS == 1);
	setVisible(game.filmbottom, VIS == 1);
end;

function inGameOnEffect(VIS, CALLBACK)
	if (VIS == 1) then
		AddEventFade(game.filmtop.ID, 255, 0.5, CALLBACK);
		AddEventFade(game.filmbottom.ID, 255, 0.5, CALLBACK);
		AddEventFade(game.ui.ID, 0, 0.5);
		setVisible(game.ui, VIS == 0);
	else
		setVisible(game.ui, VIS == 0);
		AddEventFade(game.filmtop.ID, 0, 0.5, CALLBACK);
		AddEventFade(game.filmbottom.ID, 0, 0.5, CALLBACK);
		AddEventFade(game.ui.ID, 255, 0.5);
	end;
end;

setAlpha(game.filmtop, 0);
setAlpha(game.filmbottom, 0);
setHeight(game.filmbottom, getHeight(game.filmbottom) + 190);

function FROMOW_SHOWFILMS(VIS) -- OW CALLS THIS
	if (VIS) then		
		inGameOn(1);
		inGameOnEffect(1, "");
	else
		inGameOnEffect(0, 'inGameOn(0);');
	end;	

	MMLeft = false;
	SpliterMouse.Down = 0;
end;

function FROMOW_SETGAMEWINDOW(W, H, T)
    set_Property(gamewindow.ID, PROP_W, W);
    set_Property(gamewindow.ID, PROP_H, H - 190);
end;