dialogUnpauseAfterClose = false;

function HideDialog(ADialog)
	if (ADialog.isShown == nil) or (ADialog.isShown == false) then
		return;
	end;
	
	ADialog.isShown = false;

	if dialog.activeDialogs < 2 then
		setVisible(dialog.back,false);
	end;

	setVisible(ADialog,false);

	dialog.activeDialogs = dialog.activeDialogs - 1;

	if dialog.activeDialogs < 0 then
		dialog.activeDialogs = 0;
	end;

	if (dialogUnpauseAfterClose and getVisible(gamewindow.pause)) then
		dialogUnpauseAfterClose = false;
		OW_PAUSE();
	end;
end;