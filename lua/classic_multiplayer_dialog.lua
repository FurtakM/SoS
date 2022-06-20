--------------------------------------------
-- by Evil
-- modified by Serpent
-- intened to be used along with ShowDialog to block outside inputs
-- will close itself using HideDialog so do make sure to use the correct API.
function clCreateServerDialog(PARENT, AFTER_OK, AFTER_CANCEL)

	local ELEMENT = getElementEX(
		PARENT,
		anchorNone,
		XYWH(0, 0, 452, 195), --X,Y matters not, @see ShowDialog
        false,
        {
        	texture = 'classic/edit/background_createserver.png'
        }
    ); 
    -- do not create as visible. The use casee is to create at init but show only after a while.
	-- damn you Stu and your insistence on using strings a callbacks, this would be as simple as 
	-- function() HideDialog(ELEMENT) end;
	-- instead I gotta do it using the eReg magic, it works, but feels very dirty
	local hideSelf = ';clearFocus();HideDialog(eReg:get( '.. ELEMENT.ID ..'));';
	
	ELEMENT.CANCEL = clButton(
		ELEMENT, 
		ELEMENT.width / 2 + 8,
		ELEMENT.height - 30 - 17,
		150,
		30, 
		loc(TID_msg_Cancel),
		hideSelf .. AFTER_CANCEL,
		{}
	);

	ELEMENT.OK = clButton(
		ELEMENT, 
		ELEMENT.width / 2 - 159,
		ELEMENT.height - 30 - 17,
		150,
		30, 
		loc(TID_msg_Ok), 
		hideSelf .. AFTER_OK,
		{}
	); 

	--used to use ADMUI3L - not supported all characters
	ELEMENT.SERVER_Label = getLabelEX(
		ELEMENT, 
		anchorTLR,
		XYWH(
			(ELEMENT.width - 250) / 2 - 2,
			20,
			30,
			250,
			20
		),
		BankGotic_14, 
		loc(TID_MultiServerNameLBL), 
	    {
			font_colour = BLACKA(255);
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
	    }
	);

	ELEMENT.SERVER = getEditEX(
		ELEMENT, 
		anchorTLR, 
		XYWH((ELEMENT.width - 249) / 2, 35, 249, 20),
		BankGotic_14,
		loc_format(TID_Lobby_AutoServerName, { getvalue(OWV_USERNAME) }),
		'', 
		{},
		{
			font_colour = BLACKA(255);
			colour = WHITEA(255),
		}  
	);
	
	ELEMENT.PASSWD_Label = getLabelEX(
		ELEMENT, 
		anchorTLR,
		XYWH(
			(ELEMENT.width-250) / 2 - 2,
			90,
			30,
			250,
			20
		),
		BankGotic_14, 
		loc(TID_MultiEnterARoomPass), 
		{
			font_colour = BLACKA(255),
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
		}
	);

	ELEMENT.PASSWD = getEditEX(
		ELEMENT, 
		anchorTLR, 
		XYWH(
			(ELEMENT.width - 249) / 2,
			106,
			249,
			19
		),
		BankGotic_14,
		'',
		'',
		{},
		{
			font_colour = BLACKA(255),
			colour = WHITEA(255),
			disabled = true,
			visible = true
		}
	);

	ELEMENT.PASSWD_BACK = getElementEX(
		ELEMENT, 
		anchorTLRB, 
		XYWH(ELEMENT.PASSWD.x,ELEMENT.PASSWD.y,ELEMENT.PASSWD.width, ELEMENT.PASSWD.height),
		true, 
		{
			visible = not ELEMENT.PASSWD.disabled,
			texture = 'classic/edit/multi_passedit.png'
		}
	);

	bringToFront(ELEMENT.PASSWD);
		
	ELEMENT.PASSWD.switch = function (self)
		if (getEnabled(self)) then
			setEnabled(self, false);			
			setVisible(ELEMENT.PASSWD_BACK, false);
			setFocus(ELEMENT.SERVER);
		else
			setEnabled(self,true);			
			setVisible(ELEMENT.PASSWD_BACK, true);
		end;
	end;

	ELEMENT.USE_PASSWD = clCheckbox(
		ELEMENT,
		(ELEMENT.width - 250) / 2,
		69,
		'eReg:get(' .. ELEMENT.PASSWD.ID .. '):switch()',
		{
			checked = not ELEMENT.PASSWD.disabled 
		}
	);
	
	ELEMENT.USE_PASSWD_LABEL = getLabelEX(
		ELEMENT, 
		anchorTLR,
		XYWH(
			(ELEMENT.width - 250) / 2 + 20,
			69,
			150,
			20
		),
		BankGotic_14, 
		loc(TID_Main_Menu_UsePassword), 
	    {
			font_colour = BLACKA(255);
	        shadowtext = false,
	        nomouseevent = true,
	        text_halign = ALIGN_LEFT,
	        text_valign = ALIGN_TOP,
	        wordwrap = false,
	    }
	);

	set_Callback(ELEMENT.SERVER.ID,CALLBACK_KEYUP,'if ((%k == VK_TAB or %k == VK_RETURN) and getEnabled({ID='.. ELEMENT.PASSWD.ID ..'})) then setFocus({ ID ='..ELEMENT.PASSWD.ID..'})' ..
													'else invokeCallback({ ID ='..ELEMENT.ID..'}, CALLBACK_KEYUP, {["id"] ="'..ELEMENT.ID..'", ["k"] = "%k"})' ..
													'end;'); -- %id = Element ID, %k = Virtual Key Code
	
	set_Callback(ELEMENT.PASSWD.ID,CALLBACK_KEYUP,'if (%k == VK_TAB) then setFocus({ ID ='..ELEMENT.SERVER.ID..'}) '..
												  'elseif (%k == VK_RETURN) then invokeCallback({ ID ='..ELEMENT.OK.ID..'}, CALLBACK_MOUSECLICK) '..
												  'else invokeCallback({ ID ='..ELEMENT.ID..'}, CALLBACK_KEYUP, {["id"] ="'..ELEMENT.ID..'", ["k"] = "%k"}) end;'); -- %id = Element ID, %k = Virtual Key Code
	
	set_Callback(ELEMENT.ID, CALLBACK_KEYUP, 'if (%k == VK_ESC) then invokeCallback({ ID ='..ELEMENT.CANCEL.ID..'}, CALLBACK_MOUSECLICK) '..
											'elseif (%k == VK_RETURN) then invokeCallback({ ID ='..ELEMENT.OK.ID..'}, CALLBACK_MOUSECLICK) end;');
											
	set_Callback(ELEMENT.ID,CALLBACK_VISIBILITY,'if (%vis) then setFocus({ID = ' .. ELEMENT.SERVER.ID .. '})' .. 
														'if( getText({ID = ' .. ELEMENT.SERVER.ID .. '}) == "") then '..
															'setText({ID = ' .. ELEMENT.SERVER.ID .. '},loc_format(TID_Lobby_AutoServerName,{ getvalue(OWV_USERNAME)}) );' ..
														'end;'..
												'end; ');
	return ELEMENT;
end;

function clEnterIPDialog(AFTER_OK) 
		local ELEMENT = clPrompt(AFTER_OK, {title = loc(TID_Main_Menu_Enter_IP)});

		set_Property(ELEMENT.prompt.input.ID, PROP_INVALIDCHARS, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghifjlmnopqrstuvwxyz");
		
		--taken straight from my edit of the vanill stuff :P
		set_Callback(ELEMENT.ID,CALLBACK_VISIBILITY,'if (getText( {ID = '..ELEMENT.prompt.input.ID..' }) == "") then ' ..
														'setText( {ID = '..ELEMENT.prompt.input.ID..'}, "127.0.0.1");' ..
													'end;');
		return ELEMENT;
end;