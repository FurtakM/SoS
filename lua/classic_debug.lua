-- debug
debugLayout = getElementEX(
    nil,
    anchorLT,
    XYWH(0, 0, 300, 300),
    false,
    {
        colour1 = RGB(0, 0, 0)
    }
);

debugValue = getLabelEX(
    debugLayout, 
    anchorLT, 
    XYWH(0, 0, debugLayout.width, debugLayout.height), 
    BankGotic_14, 
    '', 
    {
        text_case = CASE_UPPER,
        font_colour = RGB(0, 255, 0),
        text_halign = ALIGN_TOP,
        text_valign = ALIGN_LEFT,
        border_size = 0, 
        shadowtext = false
    }
);

function centerPoint(LAYOUT)
    local X, Y, color;

    if LAYOUT == 1 then
       color = RGB(0, 255, 237);
       X = LayoutWidth;
       Y = LayoutHeight;
    else
       color = RGB(255, 0, 212);
       X = ScrWidth;
       Y = ScrHeight;
    end;

    local ELEMENT = getElementEX(
        nil,
        anchorNone,
        XYWH(X / 2 - 5, Y / 2 - 5, 10, 10),
        true,
        {
            colour1 = color
        }
    );

    bringToFront(ELEMENT);

    return ELEMENT;
end;

function debug(var)
    if not getVisible(debugLayout) then
        setVisible(debugLayout, true);
    end;

    setText(debugValue, getText(debugValue) .. '\n' .. dump(var));   
end;

function debug2(var)
    if not getVisible(debugLayout) then
        setVisible(debugLayout, true);
    end;

    setText(debugValue, dump(var));   
end;


function dump(o)
    if type(o) == 'table' then
        local s = '{ ';

        for k, v in pairs(o) do
            if type(k) ~= 'number' then 
                k = '"' .. k .. '"'; 
            end;

        s = s .. '\n' .. '[' .. k .. '] = ' .. dump(v)
        end;

        return s .. '\n' .. '} ';
    else
        return tostring(o);
    end;
end;

function netMask(PARENT)
    if (PARENT == nil) then
        PARENT = getElementEX(
            nil,
            anchorLTRB,
            XYWH(0, 0, ScrWidth, ScrHeight),
            true,
            {
            }
        );
        bringToFront(PARENT);
    end;

    local color = {
        red = 0,
        blue = 255,
        green = 255,
        alpha = 255
    };

    local W = PARENT.width;
    local H = PARENT.height;

    local texture = CTAPI_newTexture(W, H);
    local diffW = W / 10;
    local diffH = H / 10;

    for i = 1, 10 do
        CTAPI_drawLine(texture, diffW * i, 0, diffW * i, H, color);
        CTAPI_drawLine(texture, 0, diffH * i, W, diffH * i, color);
    end;
    
    CTAPI_updateTexture(texture);
    CTAPI_finishTexture(texture);
    
    CTAPI_setElementTexture(texture, PARENT);
    --CTAPI_freeTexture(texture);

    return PARENT;
end;

--[[
SGUI_ENABLE_CLICKTEST(true);

TestLabel = getLabelEX(nil,anchorLRB,XYWH(0,ScrHeight-50,ScrWidth,50),nil,'',{special=true});

function FROMOW_CLICKTEST(DATA)
    debug('ID:'..DATA.ID..' DOWN:'..boolToStr(DATA.DOWN));
end;]]--