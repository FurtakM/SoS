interface.alien.dialog.victory = {
	X = 40,
	Y = 18,
	Y2 = 34
};

interface.ally.dialog.victory = {
	X = 40,
	Y = 18,
	Y2 = 34
};

interface.spec.dialog.victory = {
	X = 40,
	Y = 18,
	Y2 = 34
};

interface.amer.dialog.victory = {
	X = 40,
	Y = 18,
	Y2 = 34
};

interface.arab.dialog.victory = {
	X = 40,
	Y = 2,
	Y2 = 18
};

interface.rus.dialog.victory = {
	X = 40,
	Y = 2,
	Y2 = 18
};

dialog.medals.maintext = getLabelEX(
	dialog.medals,
	anchorT,
	XYWH(40, 34, dialog.medals.width - 80, 39),
	Tahoma_13,
	'',
	{
		text_halign = ALIGN_MIDDLE,	
		-- text_valign = ALIGN_MIDDLE,
		wordwrap = true,
		nomouseevent = true
	}
);


OLD_FROMOW_MEDALS_SHOW = FROMOW_MEDALS_SHOW;

function FROMOW_MEDALS_SHOW(DATA)
	OLD_FROMOW_MEDALS_SHOW(DATA);

	setText(dialog.medals.maintext, DATA.MR.maintxt);
end;


OLD_DoInterfaceChange_Dialog = DoInterfaceChange_Dialog;

function DoInterfaceChange_Dialog(Layout)
	OLD_DoInterfaceChange_Dialog(Layout);

	setY(dialog.medals.victory, Layout.dialog.victory.Y);
	setY(dialog.medals.maintext, Layout.dialog.victory.Y2);
end;