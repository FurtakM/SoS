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

dialog.customDialog = getDialogEX(
	dialog.back, 
	anchorNone,
	XYWH(LayoutWidth / 2 - 200, 125, 400, 380), 
	SKINTYPE_DIALOG1,
	{
		tile = true
	}
);

dialog.customDialog.panel = getElementEX(
	dialog.customDialog,
	anchorLTRB,
	XYWH(20, 25, dialog.customDialog.width - 40, dialog.customDialog.height - 95),
	true,
	{
		colour1 = BLACKA(0),
	}
);

dialog.customDialog.ok = getImageButtonEX(
	dialog.customDialog,
	anchorB,
	XYWH(dialog.customDialog.width / 2 - 75, dialog.customDialog.height - 45, 150, 24),
    loc(TID_InGame_Mission_objectives_Continue),
    '',
    'HideDialog(dialog.customDialog);',
    SKINTYPE_BUTTON,
    {
    	font_colour_disabled = GRAY(127),
    }
);

-- ShowDialog(dialog.customDialog);
