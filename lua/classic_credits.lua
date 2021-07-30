menu.window_credits = getElementEX(
    nil,
    anchorLTRB,
    XYWH(0, 0, LayoutWidth, LayoutHeight),
    false,
    {
        colour1 = BLACKA(150)
    }
);

menu.window_credits.content = getElementEX(
    menu.window_credits,
    anchorLTRB,
    XYWH(0, LayoutHeight + 20, LayoutWidth, 0),
    false,
    {
    	colour1 = BLACKA(0)
    }
);

set_Callback(menu.window_credits.ID, CALLBACK_MOUSECLICK, 'hideCredits();');

--override
function AddToCredits(element)
    element.parent = menu.window_credits.content;
    element.y = menu.window_credits.content.height;
    menu.window_credits.content.height = menu.window_credits.content.height + element.height + 2;

    return AddElement(element);
end;

function MakeCreditLabel(TEXT,FONTNAME,FONTSCALE)
    if FONTNAME == nil then
        FONTNAME = Tahoma_20B;
    end;

    local s = {
        type = TYPE_LABEL,
        anchor = {
            top = true,
            bottom = false,
            left = true,
            right = true
        },
        x = -1,
        width = menu.window_credits.content.width,
        height = 24,
        text = TEXT,
        font_colour = BLACKA(127),
        colour1 = BLACKA(0),
        text_halign = ALIGN_MIDDLE,
        font_name = FONTNAME,
        shadowtext = true,
    }

    if FONTSCALE ~= nil then
        s.font_scale = FONTSCALE;
        s.height = s.height * (FONTSCALE / 0.64);
    else
        s.font_scale = 0.64;
    end;

    return s;
end;

function AddCreditImage(texture,width,height)
    local s = {
        type = TYPE_ELEMENT,
        anchor = {
            top = true,
            bottom = false,
            left = false,
            right = false
        },
        x = menu.window_credits.content.width / 2 - width / 2,
        width = width,
        height = height,
        texture = texture,
        colour1 = WHITE(),
    }

    AddToCredits(s);
end;

function AddCreditImageOffset(texture, width, height, rightalign, offset, creditheight)
    local xo = 0;

    if (rightalign) then
        xo = menu.window_credits.content.width - offset - width;
    else
        xo = offset;
    end;

    local s = {
        type = TYPE_ELEMENT,
        anchor = {
            top = true,
            bottom = false,
            left = not rightalign,
            right = rightalign
        },
        x = xo,
        width = width,
        height = height,
        texture = texture,
        colour1 = WHITE(),
    }

    AddToCredits(s);
    menu.window_credits.content.height = menu.window_credits.content.height - height + creditheight;
end;

function AddCreditSpace()
    menu.window_credits.content.height = menu.window_credits.content.height + creditsspace;
end;

function CreditsTick(FRAMETIME)
    if (getVisible(menu.window_credits.content)) then
        menu.window_credits.content.y = menu.window_credits.content.y - FRAMETIME / 0.02;

        if (menu.window_credits.content.y < 0 - menu.window_credits.content.height) then
            menu.window_credits.content.y = ScrHeight + 20;
        end;

        setYF(menu.window_credits.content, menu.window_credits.content.y);
    end;
end;

function showCredits()
	menu.window_credits.content.y = ScrHeight + 20;
	sgui_set(menu.window_credits.content.ID, PROP_Y, menu.window_credits.content.y);
    setVisible(menu.window_credits, true);
    setVisible(menu.window_credits.content, true);
    showMenuButton(0);
end;

function hideCredits()
    if getVisible(menu.window_credits) then
        setVisible(menu.window_credits, false);
        setVisible(menu.window_credits.content, false);
        showMenuButton(1);
    end;
end;

OW_loadcredits(menu.window_credits.content.ID, 'credits/test');