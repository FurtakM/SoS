-- Override original debrief logic
-- Single_Debrief.leave.ID : callback_mouseclick='hideSingleDebrief();';--'OW_FORM_CLOSE(Single_Debrief.FORMID,0);',

function loading.doEnterGame()
    setVisible(game, true);
    setVisible(loading, false);
    loading.State = false;

    bringToFront(Single_Debrief);
    
    local gameTypeSkirmish = getvalue(OWV_SKIRMISH);

    showLoadGame(0);
    setVisible(Single_Debrief.continue, gameTypeSkirmish == false);
end;
