dialog.map = getDialogEX(
	dialog.back,
	anchorNone,
	XYWH(LayoutWidth / 2 - 200,125,400,380),
	SKINTYPE_DIALOG1,
	{
		tile = true
	}
);

dialog.map.panel = getElementEX(
	dialog.map,
	anchorLTRB,
	XYWH(20, 25, dialog.map.width-40, dialog.map.height-50-30-15),
	true,
	{
		colour1 = BLACKA(0)
	}
);

dialog.map.panel.textbox = getElementEX(
	dialog.map.panel,
	anchorLTR,
	XYWH(0, 0, dialog.map.panel.width - 20, dialog.map.panel.height),
	true,
	{
		type = TYPE_TEXTBOX,
		text = '',
   		colour1 = RGB(16,31,24),
		font_name = Tahoma_13,
		wordwrap = true,
		bevel_colour1 = RGB(76,148,128),
		bevel_colour2 = RGB(76,148,128)
	}
);

dialog.map.panel.textboxscroll = getElementEX(
	dialog.map.panel,
	anchorTRB,
	XYWH(dialog.map.panel.textbox.width + 4, 0, 16, dialog.map.panel.textbox.height),
	true,
	{
		type = TYPE_SCROLLBAR,
		colour1 = WHITE(),
		colour2 = WHITE(),
		texture2 = "scrollbar.png",
		tile = true,
		skin = SKINTYPE_SCROLLBARWITHBUTTONS
	}
);

setInterfaceTexture1n2(
	dialog.map.panel.textboxscroll,
	'scrollbar_back_v.png',
	'scrollbar.png'
);

sgui_set(
	dialog.map.panel.textbox.ID,
	PROP_SCROLLBAR,
	dialog.map.panel.textboxscroll.ID
);

dialog.map.ok = getImageButtonEX(
	dialog.map,
	anchorB,
	XYWH(dialog.map.width/2-75,dialog.map.height-30-15,150,24),
    'OK',
    '',
    'HideDialog(dialog.map);OW_FORM_CLOSE(dialog.map.FORMID,OK);',
    SKINTYPE_BUTTON,
    {
    	font_colour_disabled = GRAY(127)
    }
);

function setMapDescription(MODE, TEXT)
	setEnabled(game.ui.toolbtns[5], MODE);
	setText(dialog.map.panel.textbox, TEXT);
end

--[[
  see: LangX.wri
	9900=Opis
	9901=Warunki wygranej
	9902=Warunki przegranej
	9903=Dodatkowe zasady
	9910=Zniszcz przeciwnika razem z sojusznikami.
	9911=Zniszcz przeciwników razem z sojusznikami.
	9912=Przegrasz jeśli Twój dowódca zginie.
	9913=Przegrasz jeśli wszyscy sojuszniczy dowódcy zginą.
	9913=Zdobądź wymaganą liczbę punktów. 
	9920=Punkty zdobywasz za
	9921=Niszczenie wrogich jednostek.
	9922=Budowanie pojazdów.
	9923=Wypełnianie celów specjalnych np. zabicie ważnej jednostki lub zdobycie artefaktu.
	9924=Doprowadzenie sojuszniczych jednostek do strefy ewakuacji.
	9930=Punkty tracisz za
	9931=Utratę postaci.
	9932=Zabijanie sojuszników.
]]--
function buildMapDescription(PARAMS)
	local result = '';


	return result;
end