-- From old options
soundoptionsy = 50;
otherSettings = 305;



soundoptionsy = soundoptionsy - 20;

function setting_set(setting,value)
	if (options_loading == false) then
		OW_set(setting,value);
		SETTING_TIMER_ID = AddRepeatableTimer(2,'OW_settings_save();',SETTING_TIMER_ID);
	end;
end;

function setting_setvolume(setting,value)
	if (options_loading == false) then
		OW_settings_setvolume(setting,value);
                SETTING_TIMER_ID = AddRepeatableTimer(2,'OW_settings_save();',SETTING_TIMER_ID);
	end;
end;


function addInGameOptionsSlider(X,Y,MIN,MAX,POS,HINT,CAPTION,CALLBACK)
        getLabelEX(dialog.options,anchorLT,XYWH(X,Y,150,16),Tahoma_13,CAPTION,
                   {font_colour=WHITE(), colour1=BLACKA(0), text_halign=ALIGN_LEFT, wordwrap=true,});

        local ele = AddSkinnedElement(addAlienSlider(dialog.options, anchorLTR, XYWH(X+150,Y,190,16), MIN, MAX, POS, HINT, CALLBACK),SKINTYPE_SLIDER);

        setGradientAll(ele.slider,false,ProgressBar_Gradient_Colour1,ProgressBar_Gradient_Colour2);
        setBevelAll(ele.slider,false,GRAY(40),GRAY(50));

        return ele;
end;

dialog.options                = getDialogEX(dialog.back,anchorNone,XYWH(LayoutWidth / 2 - 225,150,400,450),SKINTYPE_DIALOG1,{tile=true});

dialog.options.ok             = getImageButtonEX(dialog.options,anchorB,XYWH(dialog.options.width/2-75,dialog.options.height-30-15,150,24),
                                                 loc(TID_msg_Ok),'','dialog.options.Hide();',SKINTYPE_BUTTON,{font_colour_disabled=GRAY(127),});

dialog.options.solabel        = getLabelEX(dialog.options,anchorLTR,XYWH(15,soundoptionsy,dialog.options.width-15,0),Tahoma_13B,loc(TID_Main_Menu_Options_Sound_Options),
                                           {font_colour=WHITE(), colour1=BLACKA(0), text_halign=ALIGN_LEFT,text_case=CASE_TITLE, shadowtext=true,});

dialog.options.musicvolume    = addInGameOptionsSlider(20,soundoptionsy+20  ,0,5000,OW_settings_getvolume(VOLUME_MUSIC)  ,'',loc(547),
                                                       'setting_setvolume(VOLUME_MUSIC,dialog.options.musicvolume.POS);');
dialog.options.soundvolume    = addInGameOptionsSlider(20,soundoptionsy+20*2,0,5000,OW_settings_getvolume(VOLUME_SPEECH) ,'',loc(548),
                                                       'setting_setvolume(VOLUME_SPEECH,dialog.options.soundvolume.POS);');
dialog.options.effectsvolume  = addInGameOptionsSlider(20,soundoptionsy+20*3,0,5000,OW_settings_getvolume(VOLUME_EFFECTS),'',loc(549),
                                                       'setting_setvolume(VOLUME_EFFECTS,dialog.options.effectsvolume.POS);');
dialog.options.exclamationsvolume  = addInGameOptionsSlider(20,soundoptionsy+20*4,0,5000,OW_settings_getvolume(VOLUME_EXCLAMATIONS),'',loc(5061),
                                                       'setting_setvolume(VOLUME_EXCLAMATIONS,dialog.options.exclamationsvolume.POS);');

dialog.options.ublabel        = getLabelEX(dialog.options,anchorLTR,XYWH(15,dialog.options.exclamationsvolume.y+dialog.options.exclamationsvolume.height+20,dialog.options.width,0),Tahoma_13B,loc(569),
                                           {font_colour=WHITE(), colour1=BLACKA(0), text_halign=ALIGN_LEFT, text_case=CASE_TITLE, shadowtext=true,});

                                getLabelEX(dialog.options,anchorLTR,XYWH(20,dialog.options.ublabel.y+20,dialog.options.width-40,40),Tahoma_13,loc(570),
                                           {font_colour=WHITE(), colour1=BLACKA(0), text_halign=ALIGN_LEFT, wordwrap=true,});

dialog.options.rawound        = getCheckBoxEX_UI(dialog.options,anchorLT,XYWH(28,dialog.options.ublabel.y+20*3,17,17),loc(574),{},
                                                 'setting_set(SETTING_RAWOUNDED,%value);',{checked=true,});
dialog.options.ranoncombat    = getCheckBoxEX_UI(dialog.options,anchorLT,XYWH(28,dialog.options.rawound.y+22,17,17),loc(571),{},
                                                 'setting_set(SETTING_RANONCOMBAT,%value);',{checked=true,});
dialog.options.ravehicles     = getCheckBoxEX_UI(dialog.options,anchorLT,XYWH(28,dialog.options.rawound.y+22*2,17,17),loc(577),{},
                                                 'setting_set(SETTING_RAVEHICLES,%value);',{checked=true,});

dialog.options.misclabel      = getLabelEX(dialog.options,anchorLT,XYWH(15,otherSettings-20,dialog.options.width-15,0),Tahoma_13B,loc(TID_Main_Menu_Options_Misc),
                                           {font_colour=WHITE(), colour1=BLACKA(0), text_halign=ALIGN_LEFT, text_case=CASE_TITLE, shadowtext=true,})

dialog.options.showobjectives = getCheckBoxEX_UI(dialog.options,anchorLT,XYWH(28,otherSettings,17,17),loc(563),{},'setting_set(SETTING_AUTOMISSION,%value);',{checked=true,});
dialog.options.subtitles      = getCheckBoxEX_UI(dialog.options,anchorLT,XYWH(28,dialog.options.showobjectives.y+22,17,17),loc(550),{},'setting_set(SETTING_SUBTITLES,%value);',{checked=true,});
dialog.options.altFact      = getCheckBoxEX_UI(dialog.options,anchorLT,XYWH(28,dialog.options.subtitles.y+22,17,17),loc(TID_Options_Alternative)..' '..loc(TID_Options_AltFact),{},'dialog.options.setAltFact(%value);',{checked=true,});
dialog.options.lockCursor      = getCheckBoxEX_UI(dialog.options,anchorLT,XYWH(28,dialog.options.altFact.y+22,17,17),loc(TID_Options_LockCursor),{},'dialog.options.setLockCursor(%value);',{checked=true,});

function dialog.options.Show()
	options_loading = true;
        setChecked(dialog.options.subtitles,     OW_get(SETTING_SUBTITLES));
        setChecked(dialog.options.showobjectives,OW_get(SETTING_AUTOMISSION));
        setChecked(dialog.options.rawound,       OW_get(SETTING_RAWOUNDED));
        setChecked(dialog.options.ranoncombat,   OW_get(SETTING_RANONCOMBAT));
        setChecked(dialog.options.ravehicles,    OW_get(SETTING_RAVEHICLES));
		setChecked(dialog.options.altFact  , altFact.inUse );
		setChecked(dialog.options.lockCursor  , OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_LIMITMOUSE) );
		
        dialog.options.musicvolume:setPos(OW_settings_getvolume(VOLUME_MUSIC));
        dialog.options.soundvolume:setPos(OW_settings_getvolume(VOLUME_SPEECH));
        dialog.options.effectsvolume:setPos(OW_settings_getvolume(VOLUME_EFFECTS));
        dialog.options.exclamationsvolume:setPos(OW_settings_getvolume(VOLUME_EXCLAMATIONS));

        options_loading = false;

        ShowDialogPause(dialog.options,false);
end;

function dialog.options.setAltFact(value);
		OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_altFact', value);
		altFact.inUse = value;
end;

function dialog.options.setLockCursor(value);
		OW_SPECIAL_SETTINGS_SET(SETTING_SPECIAL_LIMITMOUSE, value);
		OW_GSETTING_WRITE(getvalue(OWV_PROFILENAME), 'GS_LIMITMOUSE', value);
end;

function dialog.options.Hide()
        HideDialogPause(dialog.options);
end;
