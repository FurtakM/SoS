SOS_LOCKER_ID = nil;

function lockerChangeCypher(ID)
    local n = parseInt(sgui_get(ID, PROP_TAG)) + 1;

    if n > 9 then
        n = 0;
    end;

    sound.play('Effects/Interface/dclick.wav', "", 1);
    set_Property(ID, PROP_TAG, n);
    setTextureID(ID, 'SGUI/locker/' .. n .. '.png');
end;

function lockerCheckCode(validCode, e1, e2, e3, e4, e)
    sound.play('Effects/Interface/dclick.wav', "", 1);

    local currentCode = parseInt(sgui_get(e1, PROP_TAG) .. sgui_get(e2, PROP_TAG) .. sgui_get(e3, PROP_TAG) .. sgui_get(e4, PROP_TAG));
    local result = currentCode == validCode or 1994 == currentCode;

    OW_CUSTOM_COMMAND(102, parseInt(result));
    
    if getVisible(gamewindow.pause) then
        OW_PAUSE();
    end;

    sgui_delete(e);
    SOS_LOCKER_ID = nil;
end

function destroyLocker()
    if (SOS_LOCKER_ID ~= nil) then
        OW_CUSTOM_COMMAND(102, 0);
        sgui_delete(SOS_LOCKER_ID);
        SOS_LOCKER_ID = nil;
    end;
end

function initLockerMinigame(validCodeNumber)
    if not getVisible(gamewindow.pause) then
        OW_PAUSE();
    end;

    local codes = {
        3928,
        0711,
        2035,
        0151,
        2015,
        1994,
    };

    validCodeNumber = parseInt(validCodeNumber);

    if validCodeNumber == 0 then
        validCodeNumber = 6;
    end;

    local ELEMENT = getElementEX(
        game, 
        anchorNone, 
        XYWH(0, 0, ScrWidth, ScrHeight), 
        true, 
        {
            colour1 = BLACKA(125)
        }
    );

    ELEMENT.panel = getElementEX(
        ELEMENT, 
        anchorLRTB, 
        XYWH(ELEMENT.width / 2 - 280, ELEMENT.height / 2 - 280, 560, 560), 
        true,
        {
            texture = 'SGUI/locker/main.png',
            scissor = true
        }
    );

    ELEMENT.panel.cypher1 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(160, 270, 28, 42), 
        true,
        {
            texture = 'SGUI/locker/0.png',
        }
    );

    ELEMENT.panel.cypher2 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(230, 270, 28, 42), 
        true,
        {
            texture = 'SGUI/locker/0.png',
        }
    );

    ELEMENT.panel.cypher3 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(300, 270, 28, 42), 
        true,
        {
            texture = 'SGUI/locker/0.png',
        }
    );

    ELEMENT.panel.cypher4 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(370, 270, 28, 42), 
        true,
        {
            texture = 'SGUI/locker/0.png',
        }
    );

    ELEMENT.panel.btn1 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(160, 330, 30, 30), 
        true,
        {
            colour1 = WHITEA(),
            callback_mousedown = 'lockerChangeCypher(' .. ELEMENT.panel.cypher1.ID .. ')',
        }
    );

    ELEMENT.panel.btn2 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(230, 330, 30, 30), 
        true,
        {
            colour1 = WHITEA(),
            callback_mousedown = 'lockerChangeCypher(' .. ELEMENT.panel.cypher2.ID .. ')',
        }
    );

    ELEMENT.panel.btn3 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(300, 330, 30, 30), 
        true,
        {
            colour1 = WHITEA(),
            callback_mousedown = 'lockerChangeCypher(' .. ELEMENT.panel.cypher3.ID .. ')',
        }
    );

    ELEMENT.panel.btn4 = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(370, 330, 30, 30), 
        true,
        {
            colour1 = WHITEA(),
            callback_mousedown = 'lockerChangeCypher(' .. ELEMENT.panel.cypher4.ID .. ')',
        }
    );

    ELEMENT.panel.btnConfirm = getElementEX(
        ELEMENT.panel, 
        anchorLRTB, 
        XYWH(396, 456, 50, 30), 
        true,
        {
            colour1 = WHITEA(),
            callback_mousedown = 'lockerCheckCode(' 
                .. codes[validCodeNumber] .. ', ' 
                .. ELEMENT.panel.cypher1.ID .. ', '
                .. ELEMENT.panel.cypher2.ID .. ', '
                .. ELEMENT.panel.cypher3.ID .. ', '
                .. ELEMENT.panel.cypher4.ID .. ', '
                .. ELEMENT.ID .. ''
                .. '); '
        }
    );

    SOS_LOCKER_ID = ELEMENT.ID;
end;
