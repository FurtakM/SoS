SOS_DIALOG_BIO_FIRST = {
	ID = 1,
	TEXT = loc(9300),
	CALLBACK = ''
};


--[[
OW_CUSTOMSAVE_NEW
OW_CUSTOMSAVE_CLOSE
OW_CUSTOMSAVE_LOAD
OW_CUSTOMSAVE_DELETE
OW_CUSTOMSAVE_SAVE
OW_CUSTOMSAVE_READ
OW_CUSTOMSAVE_WRITE
]]--

function displayDialogMessage(message, onlyOnce)
	local dialogSave;

	if onlyOnce then
		if (not saveExists('sos_messages')) then
			dialogSave = OW_CUSTOMSAVE_NEW();
		else
			dialogSave = OW_CUSTOMSAVE_LOAD('sos_messages');
		end;

		local hasBeenRead = OW_CUSTOMSAVE_READ(dialogSave, message.ID);

		if hasBeenRead then
			OW_CUSTOMSAVE_CLOSE(dialogSave);
			return;
		end;

		OW_CUSTOMSAVE_WRITE(dialogSave, message.ID, true);
		OW_CUSTOMSAVE_SAVE(dialogSave, 'sos_messages');
        OW_CUSTOMSAVE_CLOSE(dialogSave);
	end;

	getCustomDialog({
        COUNT = 1,
        QUESTION = message.TEXT,
        LIST = {
            {
                NAME = loc(TID_Main_Menu_Quit),
                CALLBACK = message.CALLBACK
            }
        }
    });
end;