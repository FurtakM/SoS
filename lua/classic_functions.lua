--[[
    Author: Serpent
    03-2020
--]]
function clSliderElement(PARENT, ANCHOR, POSSIZE, MIN, MAX, POS, CALLBACK, PROPERTIES)
    if PROPERTIES.colour1 == nil then
        PROPERTIES.colour1 = WHITE();
    end;

    if PROPERTIES.textureButtonUp == nil then
        PROPERTIES.textureButtonUp = 'classic/edit/scrollbar_horiz_right.png';
    end;

    if PROPERTIES.textureButtonDown == nil then
        PROPERTIES.textureButtonDown = 'classic/edit/scrollbar_horiz_left.png';
    end;

    if PROPERTIES.textureBar == nil then
        PROPERTIES.textureBar = 'classic/edit/scrollbar_horiz2.png';
    end;

    if PROPERTIES.textureSlider == nil then
        PROPERTIES.textureSlider = 'classic/edit/scrollbar_horiz_slider.png';
    end;

    if PROPERTIES.hint == nil then
        PROPERTIES.hint = '';
    end;

    local ELEMENT = {};

    ELEMENT.type = TYPE_ELEMENT;
    ELEMENT.parent = PARENT;
    ELEMENT.anchor = ANCHOR;
    ELEMENT.x = POSSIZE.X;
    ELEMENT.y = POSSIZE.Y;
    ELEMENT.width = POSSIZE.W;
    ELEMENT.height = POSSIZE.H;
    ELEMENT.MIN = MIN;
    ELEMENT.MAX = MAX;
    ELEMENT.DIFF = MAX - MIN;
    ELEMENT.POS = POS;
    ELEMENT.LASTPOS = POS;
    ELEMENT.CALLBACK = CALLBACK;
    ELEMENT.TIMER = 0;

    ELEMENT = sliderclass:add(AddElement(ELEMENT));
    ELEMENT.setPos = sliderclass.setPos;
    ELEMENT.setElementPos = sliderclass.setElementPos;
    ELEMENT.setMINMAX  = sliderclass.setMINMAX;

    setColour1(ELEMENT, PROPERTIES.colour1);

    ELEMENT.buttonup = AddImageButtonElement(
        ELEMENT,
        XYWH(POSSIZE.W - 14, 0, 14, POSSIZE.H),
        anchorLTR,
        '',
        PROPERTIES.textureButtonUp,
        'sliderclass.buttonClick(' .. ELEMENT.inListID .. ', ' .. ELEMENT.MAX / 25 .. ')',
        {
            callback_mousedown = ''
        }
    );

    ELEMENT.buttondown = AddImageButtonElement(
        ELEMENT,
        XYWH(0, 0, 14, POSSIZE.H),
        anchorLRB,
        '',
        PROPERTIES.textureButtonDown,
        'sliderclass.buttonClick(' .. ELEMENT.inListID .. ', - ' .. ELEMENT.MAX / 25 .. ')',
        {}
    );
    
    ELEMENT.bar = getElementEX(
        ELEMENT,
        anchorLTRB,
        XYWH(15, 0, POSSIZE.W - 30, POSSIZE.H),
        true,
        {
            colour1 = PROPERTIES.colour1,
            texture = PROPERTIES.textureBar,
            hint = PROPERTIES.hint
        }
    );

    ELEMENT.slider = getImageButtonEX(
        ELEMENT.bar,
        anchorLTR,
        XYWH(0, 0, 8, 13),
        '',
        PROPERTIES.textureSlider,
        '',
        SKINTYPE_NONE,
        {
            callback_mouseupany = CALLBACK
        }
    );

    set_Callback(
        ELEMENT.bar.ID,
        CALLBACK_MOUSEDOWN,
        'sliderclass.mouseDown(' .. ELEMENT.inListID .. ', %x, %y)'
    );

    setNoMouseEvent(ELEMENT.slider, true);

    ELEMENT:setElementPos();

    return ELEMENT;
end;

--[[
    see: clScrollboxEX - PROPERTIES.returnAllData
]]--
function clUpdateScrollboxEX(DATA, INTERFACE)
    if DATA.horizontal then
        setTextureID(DATA.scrollBarID, 'SGUI/' .. INTERFACE .. '/scrollbar_back_h.png');
        setTexture2ID(DATA.scrollBarID, 'SGUI/' .. INTERFACE .. '/scrollbar.png');
        setTextureID(DATA.buttonLeft, 'SGUI/' .. INTERFACE .. '/scrollleft.png');
        setTextureID(DATA.buttonRight, 'SGUI/' .. INTERFACE .. '/scrollright.png');
    else
        setTextureID(DATA.scrollBarID, 'SGUI/' .. INTERFACE .. '/scrollbar_back_v.png');
        setTexture2ID(DATA.scrollBarID, 'SGUI/' .. INTERFACE .. '/scrollbar.png');
        setTextureID(DATA.buttonUp, 'SGUI/' .. INTERFACE .. '/scrollup.png');
        setTextureID(DATA.buttonDown, 'SGUI/' .. INTERFACE .. '/scrolldown.png');
    end;

    local barPos, parentPos;

    parentPos = getXYWH({ID = DATA.id});

    if DATA.horizontal then
        if INTERFACE == 'Amer' then
            barPos = XYWH(16, 0, parentPos.W - 32, 16);
        elseif INTERFACE == 'Arab' then
            barPos = XYWH(16, 0, parentPos.W - 32, 16);
        elseif INTERFACE == 'Rus' then
            barPos = XYWH(16, 3, parentPos.W - 32, 10);
        else
            barPos = XYWH(16, 0, parentPos.W - 32, 16); 
        end; 
    else
        if INTERFACE == 'Amer' then
            barPos = XYWH(0, 16, 16, parentPos.H - 32);
        elseif INTERFACE == 'Arab' then
            barPos = XYWH(0, 16, 16, parentPos.H - 32);
        elseif INTERFACE == 'Rus' then
            barPos = XYWH(3, 16, 10, parentPos.H - 32);
        else
            barPos = XYWH(0, 16, 16, parentPos.H - 32);
        end;
    end;

    setXYWH({ID=DATA.scrollBarID}, barPos);

    if DATA.horizontal then
        setXYWH({ID=DATA.buttonLeft}, XYWH(0, 0, 16, 16));
        setXYWH({ID=DATA.buttonRight}, XYWH(parentPos.W - 16, 0, 16, 16));
    else
        setXYWH({ID=DATA.buttonUp}, XYWH(0, 0, 16, 16));
        setXYWH({ID=DATA.buttonDown}, XYWH(0, parentPos.H - 16, 16, 16));
    end;
end;

function clScrollboxEX(PARENT, ANCHOR, POSSIZE, BINDTO, SKINTYPE, HORIZONTAL, INTERFACE, PROPERTIES)
    if PROPERTIES.returnAllData then
        local DATA = {};
    end;

    if HORIZONTAL then
        PROPERTIES.scrollslidertexture = 'SGUI/' .. INTERFACE .. '/scrollbar.png';
        PROPERTIES.scrollbartexture = 'SGUI/' .. INTERFACE .. '/scrollbar_back_h.png';
        PROPERTIES.scrolllefttexture = 'SGUI/' .. INTERFACE .. '/scrollleft.png';
        PROPERTIES.scrollrighttexture = 'SGUI/' .. INTERFACE .. '/scrollright.png';
    else
        PROPERTIES.scrollslidertexture = 'SGUI/' .. INTERFACE .. '/scrollbar.png';
        PROPERTIES.scrollbartexture = 'SGUI/' .. INTERFACE .. '/scrollbar_back_v.png';
        PROPERTIES.scrolluptexture = 'SGUI/' .. INTERFACE .. '/scrollup.png';
        PROPERTIES.scrolldowntexture = 'SGUI/' .. INTERFACE .. '/scrolldown.png';
    end;

    PROPERTIES.colour1 = WHITEA();
    PROPERTIES.SKIN = SKINTYPE;

    local ELEMENT = getElementEX(
        PARENT, 
        ANCHOR, 
        XYWH(POSSIZE.X, POSSIZE.Y, POSSIZE.W, POSSIZE.H), 
        PROPERTIES.visible,
        PROPERTIES
    );

    local barPos;

    if HORIZONTAL then
        if INTERFACE == 'Amer' then
            barPos = XYWH(16, 0, POSSIZE.W - 32, 16);
        elseif INTERFACE == 'Arab' then
            barPos = XYWH(16, 0, POSSIZE.W - 32, 16);
        elseif INTERFACE == 'Rus' then
            barPos = XYWH(10, 0, POSSIZE.W - 20, 10);
        else
            barPos = XYWH(16, 0, POSSIZE.W - 32, 16); 
        end; 
    else
        if INTERFACE == 'Amer' then
            barPos = XYWH(0, 16, 16, POSSIZE.H - 32);
        elseif INTERFACE == 'Arab' then
            barPos = XYWH(0, 16, 16, POSSIZE.H - 32);
        elseif INTERFACE == 'Rus' then
            barPos = XYWH(0, 10, 10, POSSIZE.H - 20);
        else
            barPos = XYWH(0, 16, 16, POSSIZE.H - 32);
        end;
    end;

    ELEMENT.bar = getElementEX(
        ELEMENT, 
        anchorLTRB, 
        barPos, 
        true,
        {
            type = TYPE_SCROLLBAR,
            texture = ELEMENT.scrollbartexture,
            texture2 = ELEMENT.scrollslidertexture,
            tile = true, 
            vertical = (not HORIZONTAL),
            colour2 = WHITE()
        }
    );

    set_Property(ELEMENT.bar.ID, PROP_AUTOHIDESCROLL, true);
    set_Property(ELEMENT.bar.ID, PROP_SCROLLSIZEADJUST, false);

    if PROPERTIES.returnAllData then
        DATA = {
            id = ELEMENT.ID,
            scrollBarID = ELEMENT.bar.ID,
            horizontal = HORIZONTAL
        }
    end;        

    if HORIZONTAL then
        ELEMENT.buttonLeft = getImageButtonEX(
            ELEMENT,
            anchorLTR,
            XYWH(0, 0, 16, 16),
            '',
            ELEMENT.scrolllefttexture,
            '',
            SKINTYPE_NONE,
            {
                callback_mousedown = 'SGUI_scrollbar_scroll('  .. ELEMENT.bar.ID .. ', 100);',
            }
        );

        ELEMENT.buttonRight = getImageButtonEX(
            ELEMENT,
            anchorLRB,
            XYWH(POSSIZE.W - 16, 0, 16, 16),
            '',
            ELEMENT.scrollrighttexture,
            '',
            SKINTYPE_NONE,
            {
                callback_mousedown = 'SGUI_scrollbar_scroll('  .. ELEMENT.bar.ID .. ', -100);',
            }
        );

        if PROPERTIES.returnAllData then
            DATA.buttonLeft = ELEMENT.buttonLeft.ID;
            DATA.buttonRight = ELEMENT.buttonRight.ID;
        end;

        set_Callback(ELEMENT.bar.ID, CALLBACK_VISIBILITY, 'setVisibleID(' .. ELEMENT.buttonLeft.ID .. ', %vis); setVisibleID(' .. ELEMENT.buttonRight.ID .. ', %vis);');
    else
        ELEMENT.buttonUp = getImageButtonEX(
            ELEMENT,
            anchorLTR,
            XYWH(0, 0, 16, 16),
            '',
            ELEMENT.scrolluptexture,
            '',
            SKINTYPE_NONE,
            {
                callback_mousedown = 'SGUI_scrollbar_scroll('  .. ELEMENT.bar.ID .. ', 100);',
            }
        );

        ELEMENT.buttonDown = getImageButtonEX(
            ELEMENT,
            anchorLRB,
            XYWH(0, POSSIZE.H - 16, 16, 16),
            '',
            ELEMENT.scrolldowntexture,
            '',
            SKINTYPE_NONE,
            {
                callback_mousedown = 'SGUI_scrollbar_scroll('  .. ELEMENT.bar.ID .. ', -100);',
            }
        );

        if PROPERTIES.returnAllData then
            DATA.buttonUp = ELEMENT.buttonUp.ID;
            DATA.buttonDown = ELEMENT.buttonDown.ID;
        end;

        set_Callback(ELEMENT.bar.ID, CALLBACK_VISIBILITY, 'setVisibleID(' .. ELEMENT.buttonUp.ID .. ', %vis); setVisibleID(' .. ELEMENT.buttonDown.ID .. ', %vis);');
    end;

    if BINDTO ~= nil then
        if sgui_get(ELEMENT.bar.ID, PROP_VERTICAL) then
            sgui_set(BINDTO.ID, PROP_SCROLLBAR, ELEMENT.bar.ID);
        else
            sgui_set(BINDTO.ID, PROP_SCROLLBAR2, ELEMENT.bar.ID);
        end;
    end;

    if PROPERTIES.returnAllData then
        return DATA;
    end;

    return ELEMENT;
end;

function clScrollBarEX2(PARENT, ANCHOR, POSSIZE, BINDTO, SKINTYPE, HORIZONTAL, PROPERTIES)

    if HORIZONTAL then
        -- todo        
    else
        PROPERTIES.scrollslidertexture = 'classic/edit/scrollbar_slider.png';
        PROPERTIES.scrollbartexture = 'classic/edit/scrollbar_vert_cc.png';
        PROPERTIES.scrolluptexture = 'classic/edit/scrollbar_vert_uc_invert.png';
        PROPERTIES.scrolldowntexture = 'classic/edit/scrollbar_vert_dc_invert.png';

        PROPERTIES.scrolluptextureclick = 'classic/edit/scrollbar_vert_u_over_ac_click_invert.png';
        PROPERTIES.scrolldowntextureclick = 'classic/edit/scrollbar_vert_d_over_ac_click_invert.png';
    end;

    PROPERTIES.colour1 = WHITEA();
    PROPERTIES.SKIN = SKINTYPE;

    local ELEMENT = getElementEX(
        PARENT, 
        ANCHOR, 
        XYWH(POSSIZE.X, POSSIZE.Y, POSSIZE.W, POSSIZE.H), 
        PROPERTIES.visible,
        PROPERTIES
    );

    ELEMENT.bar = getElementEX(
        ELEMENT, 
        anchorLTRB, 
        XYWH(0, 22, 17, POSSIZE.H - 45), 
        true,
        {
            type = TYPE_SCROLLBAR,
            texture = ELEMENT.scrollbartexture,
            texture2 = ELEMENT.scrollslidertexture,
            tile = true, 
            vertical = (not HORIZONTAL),
            colour2 = WHITE() 
        }
    );

    set_Property(ELEMENT.bar.ID, PROP_AUTOHIDESCROLL, false);

    ELEMENT.buttonup = getImageButtonEX(
        ELEMENT,
        anchorLTR,
        XYWH(0, 0, 17, 23),
        '',
        ELEMENT.scrolluptexture,
        '',
        SKINTYPE_NONE,
        {
            callback_mousedown = 'clScrollUpEventOn(%b, %id, ' .. ELEMENT.bar.ID .. ', "' .. ELEMENT.scrolluptextureclick .. '")',
            callback_mouseup = 'clScrollUpEventOff(%id, "' .. ELEMENT.scrolluptexture .. '")',
        }
    );

    ELEMENT.buttondown = getImageButtonEX(
        ELEMENT,
        anchorLRB,
        XYWH(0, POSSIZE.H - 23, 17, 23),
        '',
        ELEMENT.scrolldowntexture,
        '',
        SKINTYPE_NONE,
        {
            callback_mousedown = 'clScrollDownEventOn(%b, %id, ' .. ELEMENT.bar.ID .. ', "' .. ELEMENT.scrolldowntextureclick .. '")',
            callback_mouseup = 'clScrollDownEventOff(%id, "' .. ELEMENT.scrolldowntexture .. '")',
        }
    );

    if BINDTO ~= nil then
    	if sgui_get(ELEMENT.bar.ID, PROP_VERTICAL) then
        	sgui_set(BINDTO.ID, PROP_SCROLLBAR, ELEMENT.bar.ID);
        else
        	sgui_set(BINDTO.ID, PROP_SCROLLBAR2, ELEMENT.bar.ID);
        end;
    end;

    return ELEMENT;
end;

function clScrollUpEventOn(MOUSEBUTTON, ELEMENT, SCROLL, TEXTURE)
    local value = 200;

    if (MOUSEBUTTON == 1) then
        value = 600;
    end;

    setTextureID(ELEMENT, TEXTURE);        
    SGUI_scrollbar_scroll(SCROLL, value);
end;

function clScrollUpEventOff(ELEMENT, TEXTURE)
    setTextureID(ELEMENT, TEXTURE);
end;

function clScrollDownEventOn(MOUSEBUTTON, ELEMENT, SCROLL, TEXTURE)
    local value = -200;

    if (MOUSEBUTTON == 1) then
        value = -600;
    end;

    setTextureID(ELEMENT, TEXTURE);        
    SGUI_scrollbar_scroll(SCROLL, value);
end;

function clScrollDownEventOff(ELEMENT, TEXTURE)
    setTextureID(ELEMENT, TEXTURE);
end;

function clButton(PARENT, X, Y, W, H, CAPTION, EVENT, PROPERTIES)
    if (PROPERTIES.font_colour == nil) then
        PROPERTIES.font_colour = RGB(0, 0, 0);
    end;

    if (PROPERTIES.font_name == nil) then
        PROPERTIES.font_name = BankGotic_14;
    end;

    if (PROPERTIES.disabled == nil) then
        PROPERTIES.disabled = false;
    end;

    if (PROPERTIES.texture == nil) then
        PROPERTIES.texture = 'classic/edit/menu_button_l.png';
    end;

    if (PROPERTIES.texture2 == nil) then
        PROPERTIES.texture2 = 'classic/edit/menu_button_c.png';
    end;

    if (PROPERTIES.texture3 == nil) then
        PROPERTIES.texture3 = 'classic/edit/menu_button_r.png';
    end;

    if (PROPERTIES.skintype == nil) then
        PROPERTIES.skintype = SKINTYPE_NONE;
    end;

    if (PROPERTIES.clickSound == nil) then
        PROPERTIES.clickSound = '"Effects/Interface/bclick.wav"';
    end;

    if (PROPERTIES.clickSoundCancel) then
        PROPERTIES.clickSound = '"Effects/Interface/cancel.wav"';
    end;

    if (PROPERTIES.clickSoundOpen) then
        PROPERTIES.clickSound = '"Effects/Interface/funkce.wav"';
    end;

    if (PROPERTIES.clickSoundSelect) then
        PROPERTIES.clickSound = '"Effects/Interface/vyber.wav"';
    end;

    return getImageButtonEX(
        PARENT, 
        anchorNone, 
        XYWH(X, Y, W, H), 
        CAPTION, 
        '', 
        'sound.play(' .. PROPERTIES.clickSound .. ', "", 1);' .. EVENT, 
        PROPERTIES.skintype,
        {
            font_colour = PROPERTIES.font_colour,
            font_name = PROPERTIES.font_name,
            texture = PROPERTIES.texture,
            texture2 = PROPERTIES.texture2,
            texture3 = PROPERTIES.texture3,
            disabled = PROPERTIES.disabled
        }
    );
end;

function clRadioBox(PARENT, GROUP, X, Y, EVENT, PROPERTIES)
    if PROPERTIES.W == nil then
        PROPERTIES.W = 16;
    end;

    if PROPERTIES.H == nil then
        PROPERTIES.H = 16;
    end;

    if PROPERTIES.textureChecked == nil then
        PROPERTIES.textureChecked = 'classic/edit/checkbox_on.png';
    end;

    if PROPERTIES.textureUnchecked == nil then
        PROPERTIES.textureUnchecked = 'classic/edit/checkbox_off.png';
    end;

    if PROPERTIES.interface then
        PROPERTIES.textureChecked = 'SGUI/' .. PROPERTIES.interface .. '/checkbox_checked.png';
        PROPERTIES.textureUnchecked = 'SGUI/' .. PROPERTIES.interface .. '/checkbox_unchecked.png';
        PROPERTIES.W = 17;
        PROPERTIES.H = 17;
    end;

    if PROPERTIES.checked == nil then
        PROPERTIES.checked = false;
    end;

    if (PROPERTIES.label == nil) then
        PROPERTIES.label = '';
    end;

    PROPERTIES.texture = PROPERTIES.textureUnchecked;
    PROPERTIES.texture2 = PROPERTIES.textureChecked;    

    if PROPERTIES.colour1 == nil then
        PROPERTIES.colour1 = WHITE();
    end;
    
    if PROPERTIES.colour2 == nil then
        PROPERTIES.colour2 = WHITE();
    end;

    local ELEMENT = getRadioEX(
        PARENT, 
        anchorNone, 
        XYWH(X, Y, PROPERTIES.W, PROPERTIES.H),
        PROPERTIES.checked,
        GROUP,
        PROPERTIES.label,
        {
            colour1 = PROPERTIES.colour1,
            colour2 = PROPERTIES.colour2
        },
        PROPERTIES
    );

    set_Callback(ELEMENT.ID, CALLBACK_CHECKED, EVENT);

    return ELEMENT;
end;

function clCheckbox(PARENT, X, Y, EVENT, PROPERTIES)
    if PROPERTIES.W == nil then
        PROPERTIES.W = 16;
    end;

    if PROPERTIES.H == nil then
        PROPERTIES.H = 16;
    end;

    if PROPERTIES.textureChecked == nil then
        PROPERTIES.textureChecked = 'classic/edit/checkbox_on.png';
    end;

    if PROPERTIES.textureUnchecked == nil then
        PROPERTIES.textureUnchecked = 'classic/edit/checkbox_off.png';
    end;

    if PROPERTIES.interface then
        PROPERTIES.textureChecked = 'SGUI/' .. PROPERTIES.interface .. '/checkbox_checked.png';
        PROPERTIES.textureUnchecked = 'SGUI/' .. PROPERTIES.interface .. '/checkbox_unchecked.png';
        PROPERTIES.W = 17;
        PROPERTIES.H = 17;
    end;

    if PROPERTIES.visible == nil then
        PROPERTIES.visible = true;
    end;    

    PROPERTIES.texture = PROPERTIES.textureUnchecked;
    PROPERTIES.texture2 = PROPERTIES.textureChecked;    

    PROPERTIES.type = TYPE_CHECKBOX;
    
    if PROPERTIES.colour2 == nil then
        PROPERTIES.colour2 = WHITE();
    end;

    local ELEMENT = getElementEX(
        PARENT, 
        anchorNone, 
        XYWH(X, Y, PROPERTIES.W, PROPERTIES.H),
        PROPERTIES.visible,
        PROPERTIES
    );

    set_Callback(ELEMENT.ID, CALLBACK_MOUSEDOWN, EVENT);

    return ELEMENT;
end;

function clComboBox(PARENT, X, Y, ITEMS, SELECTEDITEM, CALLBACK, PROPERTIES)
    if PROPERTIES.texture == nil then
        PROPERTIES.texture = 'classic/edit/combobox-small-text.png';
    end;

    if PROPERTIES.textureButton == nil then
        PROPERTIES.textureButton = 'classic/edit/combobox-small-button.png';
    end;

    if PROPERTIES.textureButtonClick == nil then
        PROPERTIES.textureButtonClick = 'classic/edit/combobox-small-button-click.png';
    end;

    if PROPERTIES.textureList == nil then
        PROPERTIES.textureList = 'classic/edit/combobox-small-list.png';
    end;

    if PROPERTIES.visible == nil then
        PROPERTIES.visible = true;
    end;

    if PROPERTIES.disabled == nil then
        PROPERTIES.disabled = false;
    end;

    local ELEMENT = getElementEX(
        PARENT, 
        anchorNone, 
        XYWH(X, Y, 234, 22), 
        PROPERTIES.visible,
        {
            colour1 = WHITEA(),
            disabled = PROPERTIES.disabled
        }
    );

    ELEMENT.comboBox = getElementEX(
        ELEMENT,
        anchorLTRB,
        XYWH(0, 0, 234, 22),
        true,
        {
            colour1 = WHITEA()
        }
    );

    ELEMENT.comboBox.selected = getElementEX(
        ELEMENT.comboBox,
        anchorL,
        XYWH(0, 0, 213, 22),
        true,
        {
            texture = PROPERTIES.texture,
        }
    );

    ELEMENT.comboBox.selected.label = getLabelEX(
        ELEMENT.comboBox.selected,
        anchorLTRB,
        XYWH(4, 0, 211, 22),
        nil,
        SGUI_widesub(ITEMS[SELECTEDITEM], 1, 22),
        {
            font_colour = BLACK(),
            nomouseevent = true,
            font_name = BankGotic_14
        }
    );

    ELEMENT.comboBox.button = getImageButtonEX(
        ELEMENT.comboBox,
        anchorR,
        XYWH(213, 0, 21, 22),
        '',
        '',
        '',
        SKINTYPE_NONE,
        {
            texture = PROPERTIES.textureButton,
        }
    );

    ELEMENT.background = getElementEX(
        nil,
        anchorNone,
        XYWH(0, 0, ScrWidth, ScrHeight),
        false,
        {
            colour1 = WHITEA()
        }
    );

    ELEMENT.list = getElementEX(
        ELEMENT.background,
        anchorNone,
        XYWH(getAbsX(ELEMENT), getAbsY(ELEMENT) + 22, 234, 270),
        false,
        {
            colour1 = WHITEA()
        }
    );

    ELEMENT.combo = getElementEX(
        ELEMENT.list,
        anchorNone,
        XYWH(0, 0, 214, 270),
        true,
        {
            texture = PROPERTIES.textureList,
        }
    );

    ELEMENT.list.scroll = getScrollboxEX(
        ELEMENT.combo, 
        anchorNone, 
        XYWH(0, 5, 214, 262),
        {
            colour1 = WHITEA()
        }
    );

    set_Property(ELEMENT.list.scroll.ID, PROP_AUTOHIDESCROLL, false);

    ELEMENT.list.scrollBar = clScrollBarEX2(
        ELEMENT.list,
        anchorNone,
        XYWH(214, 0, 20, 270), 
        ELEMENT.list.scroll, 
        SKINTYPE_NONE,
        false,
        {}
    );

    local elements = {};

    for i = 1, table.getn(ITEMS) do
        elements = addToArray(elements, clComboBoxItem(
            ELEMENT.list.scroll, 
            i, 
            ITEMS[i], 
            (SELECTEDITEM == i),
            ELEMENT.ID,
            ELEMENT.background.ID,
            ELEMENT.list.ID, 
            ELEMENT.comboBox.button.ID, 
            ELEMENT.comboBox.selected.label.ID,
            PROPERTIES.textureButton,
            PROPERTIES.textureButtonClick,
            CALLBACK
        ));
    end;

    if PROPERTIES.hint then
        setHint(ELEMENT.comboBox.selected, PROPERTIES.hint);
    end;

    set_Callback(ELEMENT.background.ID, CALLBACK_MOUSEDOWN, 'clShowComboBoxList(' .. ELEMENT.list.ID .. ',' .. ELEMENT.ID .. ',' .. ELEMENT.background.ID .. ', ' .. ELEMENT.comboBox.button.ID .. ', "' .. PROPERTIES.textureButton .. '", "' .. PROPERTIES.textureButtonClick .. '")');
    set_Callback(ELEMENT.comboBox.button.ID, CALLBACK_MOUSEDOWN, 'clShowComboBoxList(' .. ELEMENT.list.ID .. ',' .. ELEMENT.ID .. ',' .. ELEMENT.background.ID .. ', ' .. ELEMENT.comboBox.button.ID .. ', "' .. PROPERTIES.textureButton .. '", "' .. PROPERTIES.textureButtonClick .. '")');
    set_Callback(ELEMENT.comboBox.selected.ID, CALLBACK_MOUSEDOWN, 'clShowComboBoxList(' .. ELEMENT.list.ID .. ',' .. ELEMENT.ID .. ',' .. ELEMENT.background.ID .. ', ' .. ELEMENT.comboBox.button.ID .. ', "' .. PROPERTIES.textureButton .. '", "' .. PROPERTIES.textureButtonClick .. '")');

    COMBOBOX_LIST[ELEMENT.list.scroll.ID] = {
        ID = ELEMENT.list.scroll.ID,
        PARENT = ELEMENT.list.ID,
        BACKGROUND = ELEMENT.background.ID,
        BUTTON = ELEMENT.comboBox.button.ID,
        TEXTURE = PROPERTIES.textureButton,
        ITEMS = ITEMS,
        SELECTED = SELECTEDITEM,
        ELEMENTS = elements
    };

    return ELEMENT;
end;

function clComboBoxItem(PARENT, INDEX, VALUE, SELECTED, ELEMENTID, BACKGROUNDID, LISTID, COMBOBOXBUTTONID, COMBOBOXLABELID, BUTTONTEXTURE, BUTTONCLICKTEXTURE, CALLBACK)
    CALLBACK = string.gsub(CALLBACK, "%VALUE", VALUE);
    CALLBACK = string.gsub(CALLBACK, "%INDEX", INDEX);

    local colour = WHITEA();

    if (SELECTED) then
        colour = RGB(191, 191, 191);
    end;

    local item = getElementEX(
        PARENT,
        anchorLTRB,
        XYWH(3, 15 * (INDEX - 1), 207, 15),
        true,
        {
            hint = VALUE,
            colour1 = colour,
            callback_mouseleave = 'clHoverItem(%id, 0, ' .. BoolToInt(SELECTED) .. ');',
            callback_mouseover = 'clHoverItem(%id, 1, ' .. BoolToInt(SELECTED) .. ');',
            callback_mousedown = 'clSelectComboBoxItem(%id, ' .. PARENT.ID .. ',' .. BACKGROUNDID .. ',' .. ELEMENTID .. ',' .. LISTID .. ',' .. COMBOBOXBUTTONID .. ', ' .. COMBOBOXLABELID .. ', "' .. BUTTONTEXTURE .. '", "' .. BUTTONCLICKTEXTURE .. '", ' .. INDEX .. ', "'.. VALUE .. '"); ' .. CALLBACK
        }
    );
    
    item.label = getLabelEX(
        item,
        anchorLTRB,
        XYWH(0, 0, 207, 15),
        nil,
        SGUI_widesub(VALUE, 1, 22),
        {
            font_colour = BLACK(),
            nomouseevent = true,
            font_name = BankGotic_14,
        }
    );

    return item.ID;
end;

function clSelectComboBoxItem(ID, PARENTID, BACKGROUNDID, ELEMENTID, LISTID, COMBOBOXBUTTONID, COMBOBOXLABELID, BUTTONTEXTURE, BUTTONCLICKTEXTURE, INDEX, VALUE)
    clSetComboBoxValue(COMBOBOXLABELID, VALUE);
    clShowComboBoxList(LISTID, PARENTID, BACKGROUNDID, COMBOBOXBUTTONID, BUTTONTEXTURE, BUTTONCLICKTEXTURE);
    clSetComboBoxSelectedItem(PARENTID, INDEX);
end;

function clSetComboBoxSelectedItem(ID, INDEX)
    if COMBOBOX_LIST[ID] == nil then
        return;
    end;

    COMBOBOX_LIST[ID].SELECTEDITEM = parseInt(INDEX);

    for i = 1, table.getn(COMBOBOX_LIST[ID].ELEMENTS) do
        set_Callback(COMBOBOX_LIST[ID].ELEMENTS[i], CALLBACK_MOUSELEAVE, 'clHoverItem(' .. COMBOBOX_LIST[ID].ELEMENTS[i] .. ', 0, ' .. BoolToInt(i == INDEX) .. ')');
        set_Callback(COMBOBOX_LIST[ID].ELEMENTS[i], CALLBACK_MOUSEOVER, 'clHoverItem(' .. COMBOBOX_LIST[ID].ELEMENTS[i] .. ', 1, ' .. BoolToInt(i == INDEX) .. ')');
        setColour1({ID = COMBOBOX_LIST[ID].ELEMENTS[i]}, WHITEA());
    end;
    
    setColour1({ID = COMBOBOX_LIST[ID].ELEMENTS[COMBOBOX_LIST[ID].SELECTEDITEM]}, RGB(191, 191, 191));
end;

function clSetComboBoxValue(ID, VALUE)
    setText({ID=ID}, SGUI_widesub(VALUE, 1, 22));
end;

function clShowComboBoxList(ID, PARENTID, BACKGROUNDID, BUTTONID, BUTTONTEXTURE, BUTTONCLICKTEXTURE)
    local mode = getVisible({ID=ID});

    if mode then
        setTextureID(BUTTONID, BUTTONTEXTURE);
    else
        bringToFront({ID=BACKGROUNDID});
        bringToFront({ID=ID});
        setTextureID(BUTTONID, BUTTONCLICKTEXTURE);
    end;

    setVisible({ID=BACKGROUNDID}, (not mode));
    setVisible({ID=ID}, (not mode));
end;

function clHideComboBoxList(ID, BACKGROUNDID, BUTTONID, BUTTONTEXTURE)
    setTextureID(BUTTONID, BUTTONTEXTURE);
    setVisible({ID=BACKGROUNDID}, false)
    setVisible({ID=ID}, false);
end;

function clHideAllComboBoxList()
    for _, v in pairs(COMBOBOX_LIST) do
        if (getVisibleID(v.ID)) then
            clHideComboBoxList(v.PARENT, v.BACKGROUND, v.BUTTON, v.TEXTURE);
        end;
    end;
end;

function clHoverItem(ID, MODE, SELECTED)
    if (MODE == 1 and SELECTED == 0) then
        setColour1({ID=ID}, RGB(202, 224, 218));
    else
        if (SELECTED == 1) then
            setColour1({ID=ID}, RGB(191, 191, 191));
        else
            setColour1({ID=ID}, WHITEA());
        end;
    end;
end;

function clListBox(PARENT, POS, ITEMS, SELECTEDITEM, CALLBACK, PROPERTIES)
    if (PROPERTIES.autoHideScroll == nil) then
        PROPERTIES.autoHideScroll = false;
    end;

    if (PROPERTIES.visible == nil) then
        PROPERTIES.visible = true;
    end;

    if (PROPERTIES.texture == nil) then
        PROPERTIES.texture = 'classic/edit/combobox-small-list.png';
    end;

    local ELEMENT = getElementEX(
        PARENT,
        anchorNone,
        POS,
        PROPERTIES.visible,
        {
            colour1 = WHITEA()
        }
    );

    ELEMENT.list = getElementEX(
        ELEMENT,
        anchorNone,
        XYWH(
            0, 
            0,
            ELEMENT.width - 20,
            ELEMENT.height
        ),
        true,
        {
            texture = PROPERTIES.texture
        }
    );

    ELEMENT.list.scroll = getScrollboxEX(
        ELEMENT, 
        anchorNone, 
        XYWH(0, 0, ELEMENT.list.width, ELEMENT.list.height - 6),
        {
            colour1 = WHITEA()
        }
    );

    set_Property(ELEMENT.list.scroll.ID, PROP_AUTOHIDESCROLL, PROPERTIES.autoHideScroll);

    ELEMENT.list.scrollBar = clScrollBarEX2(
        ELEMENT,
        anchorNone,
        XYWH(
            ELEMENT.list.x + ELEMENT.list.width + 1, 
            ELEMENT.list.y, 
            12,
            ELEMENT.list.height
        ), 
        ELEMENT.list.scroll, 
        SKINTYPE_NONE,
        false,
        {
            visible = PROPERTIES.visible
        }
    );

    clSetListItems(ELEMENT.list.scroll, ITEMS, SELECTEDITEM, CALLBACK, PROPERTIES);    

    return ELEMENT.list.scroll;
end;

function clListBoxCustom(PARENT, POS, CALLBACKS, PROPERTIES)
    if (PROPERTIES.autoHideScroll == nil) then
        PROPERTIES.autoHideScroll = false;
    end;

    if (PROPERTIES.visible == nil) then
        PROPERTIES.visible = true;
    end;

    if (PROPERTIES.texture == nil) then
        PROPERTIES.texture = 'classic/edit/combobox-small-list.png';
    end;

    if (PROPERTIES.itemHeight == nil) then
        PROPERTIES.itemHeight = 16;
    end;

    if (CALLBACKS.added == nil) then
        CALLBACKS.added = '';
    end;

    if (CALLBACKS.updated == nil) then
        CALLBACKS.updated = '';
    end;

    if (CALLBACKS.selected == nil) then
        CALLBACKS.selected = '';
    end;

    if (CALLBACKS.unselected == nil) then
        CALLBACKS.unselected = '';
    end;

    if (CALLBACKS.mouseDblClick == nil) then
        CALLBACKS.mouseDblClick = '';
    end;

    local ELEMENT = getElementEX(
        PARENT,
        anchorNone,
        POS,
        PROPERTIES.visible,
        {
            colour1 = WHITEA()
        }
    );

    ELEMENT.container = getElementEX(
        ELEMENT,
        anchorNone,
        XYWH(
            0, 
            0,
            ELEMENT.width - 20,
            ELEMENT.height
        ),
        true,
        {
            texture = PROPERTIES.texture
        }
    );

    ELEMENT.list = getElementEX(
        ELEMENT.container,
        anchorNone,
        XYWH(
            3, 
            6,
            ELEMENT.container.width - 6,
            ELEMENT.container.height - 4
        ),
        true,
        {
            colour1 = WHITEA(),
            type = TYPE_CUSTOMLISTBOX,
            itemheight = PROPERTIES.itemHeight,
            callback_itemadded = CALLBACKS.added,
            callback_itemupdated = CALLBACKS.updated,
            callback_itemselected = CALLBACKS.selected,
            callback_itemunselected = CALLBACKS.unselected
        }
    );

    ELEMENT.list.scrollBar = clScrollBarEX2(
        ELEMENT,
        anchorNone,
        XYWH(
            ELEMENT.container.x + ELEMENT.container.width + 1, 
            ELEMENT.container.y, 
            12,
            ELEMENT.container.height
        ), 
        ELEMENT.list, 
        SKINTYPE_NONE,
        false,
        {
            visible = PROPERTIES.visible
        }
    ); 

    return {
        ELEMENT = ELEMENT,
        LIST = ELEMENT.list,
        SCROLL = ELEMENT.list.scroll,
    };
end;

function clListBoxCustomItemNew(BOX_ID, ID, ROW_ID, INDEX, DATA)
    local name = DATA.nick;

    if (name == nil) then
        name = DATA.name;
    end;

    local label = getLabelEX(
        {ID = ROW_ID}, 
        anchorNone, 
        XYWH(0, 0, getWidthID(ROW_ID), getHeightID(ROW_ID)), 
        nil, 
        name, 
        {
            colour1 = WHITEA(),
            font_name = ADMUI3L,
            border_colour = WHITEA(),
            font_colour = RGB(0, 0, 0),
            nomouseevent = true
        }
    );

    if (CUSTOM_LISTBOX_LIST[BOX_ID] == nil) then
        CUSTOM_LISTBOX_LIST[BOX_ID] = {};
    end;

    CUSTOM_LISTBOX_LIST[BOX_ID][INDEX] = {
        DATA = DATA,
        LABEL = label.ID
    }
end;

function clListBoxCustomItemUpdate(BOX_ID, ROW_ID, INDEX, DATA)
    CUSTOM_LISTBOX_LIST[BOX_ID][INDEX].DATA = DATA; 
    setTextID(CUSTOM_LISTBOX_LIST[BOX_ID][INDEX].LABEL, DATA.nick);
end;

function clListBoxCustomItemSelected(ROW_ID)
    setColour1({ID = ROW_ID}, RGB(191, 191, 191));
end;

function clListBoxCustomItemUnselected(ROW_ID)
    setColour1({ID = ROW_ID}, WHITEA());
end;

function clSetListItemHover(ID, MODE, STATIC, INDEX, SELECTED_ITEM)
    if (not STATIC) then
        return 'clHoverItem(%id,' .. MODE .. ', ' .. BoolToInt(INDEX == SELECTED_ITEM) .. ');';
    end;

    return '';
end;

function clSetListItems(PARENT, ITEMS, SELECTED_ITEM, CALLBACK, PROPERTIES)
    sgui_deletechildren(PARENT.ID);

    local tmpCallback = CALLBACK;
    local tmpElement = {};

    if (PROPERTIES.static == nil) then
        PROPERTIES.static = false;
    end;

    for i = 1, table.getn(ITEMS) do
        if (CALLBACK ~= '') then
            tmpCallback = CALLBACK;

            if string.find(CALLBACK, "VALUE") then
                tmpCallback = string.gsub(tmpCallback, "%VALUE", ITEMS[i]);
            end;

            if string.find(CALLBACK, "INDEX") then
                tmpCallback = string.gsub(tmpCallback, "%INDEX", i);
            end;
        end;

        local item = getElementEX(
            PARENT,
            anchorLTRB,
            XYWH(3, 3 + 17 * (i - 1), getWidth(PARENT) - 6, 15),
            true,
            {
                colour1 = WHITEA(),
                callback_mouseleave = clSetListItemHover('%id', 0, PROPERTIES.static, i, SELECTED_ITEM),
                callback_mouseover = clSetListItemHover('%id', 1, PROPERTIES.static, i, SELECTED_ITEM),
                callback_mousedown = tmpCallback,
            }
        );

        if (i == SELECTEDITEM) then
            setColour1({ID=item.ID}, RGB(191, 191, 191));
        end;
        
        item.label = getLabelEX(
            item,
            anchorLTRB,
            XYWH(0, 0, getWidth(item), 15),
            nil,
            ITEMS[i],
            {
                font_colour = BLACK(),
                nomouseevent = true,
                font_name = ADMUI3L,
            }
        );

        tmpElement[i] = item.ID;
    end;

    LISTBOX_LIST[PARENT.ID] = {
        ID = PARENT.ID,
        ITEMS = ITEMS,
        SELECTED = SELECTEDITEM,
        ELEMENTS = tmpElement
    };
end;

function clSetListSelectedItem(ID, INDEX)
    if LISTBOX_LIST[ID].ELEMENTS == nil then
        return;
    end;

    LISTBOX_LIST[ID].SELECTEDITEM = parseInt(INDEX);

    for i = 1, table.getn(LISTBOX_LIST[ID].ELEMENTS) do
        set_Callback(LISTBOX_LIST[ID].ELEMENTS[i], CALLBACK_MOUSELEAVE, 'clHoverItem(' .. LISTBOX_LIST[ID].ELEMENTS[i] .. ', 0, ' .. BoolToInt(i == INDEX) .. ')');
        set_Callback(LISTBOX_LIST[ID].ELEMENTS[i], CALLBACK_MOUSEOVER, 'clHoverItem(' .. LISTBOX_LIST[ID].ELEMENTS[i] .. ', 1, ' .. BoolToInt(i == INDEX) .. ')');
        setColour1({ID = LISTBOX_LIST[ID].ELEMENTS[i]}, WHITEA());
    end;
    
    setColour1({ID = LISTBOX_LIST[ID].ELEMENTS[LISTBOX_LIST[ID].SELECTEDITEM]}, RGB(191, 191, 191));
end;

function clGetListSelectedItem(ID)
    local list = LISTBOX_LIST[ID];
    return list.ITEMS[list.SELECTED];
end;

function clGetListSelectedIndex(ID)
    local list = LISTBOX_LIST[ID];
    return list.SELECTED;
end;

function clGetListSelectedElement(ID)
    return LISTBOX_LIST[ID].ELEMENTS[LISTBOX_LIST[ID].SELECTEDITEM];
end;

function clGetListItems(ID)
    return LISTBOX_LIST[ID].ITEMS;
end;

function clPrompt(CALLBACK, PROPERTIES)
    if (PROPERTIES.visible == nil) then
        PROPERTIES.visible = false;
    end;

    if (PROPERTIES.text == nil) then
        PROPERTIES.text = '';
    end;

    if (PROPERTIES.backgroundColor == nil) then
        PROPERTIES.backgroundColor = BLACKA(50);
    end;

    if (PROPERTIES.texture == nil) then
        PROPERTIES.texture = 'classic/edit/prompt.png';
    end;

    if (PROPERTIES.title ~= nil) then
        PROPERTIES.texture = 'classic/edit/prompt_title.png';
    end;

    local ELEMENT = getElementEX(
        nil,
        anchorLTRB,
        XYWH(0, 0, LayoutWidth, LayoutHeight),
        PROPERTIES.visible,
        {
            colour1 = PROPERTIES.backgroundColor
        }
    );
    
    ELEMENT.prompt = getElementEX(
        ELEMENT, 
        anchorNone, 
        XYWH(LayoutWidth / 2 - 151, LayoutHeight / 2 - 48, 302, 96), 
        true,
        {
            texture = PROPERTIES.texture,
        }
    );

    if (PROPERTIES.title ~= nil) then
        ELEMENT.title = getLabelEX(
            ELEMENT.prompt,
            anchorLTRB,
            XYWH(6, 6, 298, 16),
            nil,
            PROPERTIES.title,
            {
                font_colour = BLACKA(255),
                font_name = BankGotic_14
            }
        );
    end;

    ELEMENT.prompt.input = getEditEX(
        ELEMENT.prompt,
        anchorNone,
        XYWH(10, 26, 280, 14),
        BankGotic_14,
        PROPERTIES.text,
        '',
        {},
        {
            font_colour = BLACK(),
            font_name = Arial_14
        }
    );

    ELEMENT.prompt.cancel = clButton(
        ELEMENT.prompt, 
        9, 
        56,
        139, 
        30,
        loc(TID_msg_Cancel), 
        "clClosePrompt(".. ELEMENT.ID ..");",
        {}
    );

    ELEMENT.prompt.accept = clButton(
        ELEMENT.prompt, 
        154, 
        56,
        139, 
        30,
        loc(TID_msg_Ok), 
        string.gsub(CALLBACK, "%VALUE", ELEMENT.prompt.input.ID),
        {}
    );


	set_Callback(ELEMENT.prompt.input.ID,CALLBACK_KEYUP, 'if (%k == VK_ESC) then invokeCallback({ ID ='..ELEMENT.prompt.cancel.ID..'}, CALLBACK_MOUSECLICK) '..
												'elseif (%k == VK_RETURN) then invokeCallback({ ID ='..ELEMENT.prompt.accept.ID..'}, CALLBACK_MOUSECLICK) end;');

    PROMPT_LIST[ELEMENT.ID] = {
        ID = ELEMENT.ID,
        INPUT = ELEMENT.prompt.input.ID,
    }

    return ELEMENT;
end;

function clOpenPrompt(ID, VALUE)
    setVisibleID(ID, true);
	setFocusID(PROMPT_LIST[ID].INPUT);
	
    if (VALUE ~= nil) then
		setTextID(PROMPT_LIST[ID].INPUT, VALUE);
	end;
end;

function clClosePrompt(ID)
    setVisibleID(ID, false);
end;

function clTextBox(PARENT, ANCHOR, POSSIZE, TEXT, PROPERTIES)
    PROPERTIES.type = TYPE_TEXTBOX;
    
    if PROPERTIES.font_name == nil then
        PROPERTIES.font_name = ADMUI3L;
    end;

    PROPERTIES.text = TEXT;
    PROPERTIES.wordwrap = true;
    PROPERTIES.scissor = true;

    return getElementEX(PARENT, ANCHOR, POSSIZE, true, PROPERTIES);
end;

function clTextBoxWithTexture(PARENT, ANCHOR, POSSIZE, TEXT, PROPERTIES)
    if (PROPERTIES.visible == nil) then
        PROPERTIES.visible = true;
    end;

    if (PROPERTIES.texture == nil) then
        PROPERTIES.texture = 'classic/edit/textbox.png';
    end;

    if (PROPERTIES.autoHideScroll == nil) then
        PROPERTIES.autoHideScroll = false;
    end;

    if (PROPERTIES.font_colour == nil) then
        PROPERTIES.font_colour = RGB(0, 0, 0);
    end;

    if (PROPERTIES.padding == nil) then
        PROPERTIES.padding = {
            x = 4,
            y = 4
        };
    end;

    ELEMENT = getElementEX(
        PARENT, 
        ANCHOR, 
        XYWH(POSSIZE.X, POSSIZE.Y, POSSIZE.W, POSSIZE.H), 
        PROPERTIES.visible,
        {
            colour1 = WHITEA()
        }
    );

    ELEMENT.textbox = clTextBox(
        ELEMENT,
        anchorLTRB,
        XYWH(
            PROPERTIES.padding.x,
            PROPERTIES.padding.y,
            ELEMENT.width - 12 - PROPERTIES.padding.x,
            ELEMENT.height - PROPERTIES.padding.y
        ),
        TEXT,
        {
            font_name = PROPERTIES.font_name,
            font_colour = PROPERTIES.font_colour,
            texture = PROPERTIES.texture
        }
    );

    ELEMENT.textbox.scrollBar = clScrollBarEX2(
        ELEMENT,
        anchorNone,
        XYWH(
            ELEMENT.textbox.x + ELEMENT.textbox.width + 1, 
            ELEMENT.textbox.y - PROPERTIES.padding.y, 
            12,
            ELEMENT.textbox.height + PROPERTIES.padding.y
        ), 
        ELEMENT.textbox, 
        SKINTYPE_NONE,
        false,
        {
            visible = PROPERTIES.visible
        }
    );

    return {
        ELEMENT = ELEMENT,
        TEXTBOX = ELEMENT.textbox,
    };
end;

function clEditText(PARENT, ANCHOR, POSSIZE, PROPERTIES)
    if (PROPERTIES.font == nil) then
        PROPERTIES.font = BankGotic_14;
    end;

    if (PROPERTIES.text == nil) then
        PROPERTIES.text = '';
    end;

    if (PROPERTIES.notAllowedChars == nil) then
        PROPERTIES.notAllowedChars = '';
    end;

    if (PROPERTIES.fontColour == nil) then
        PROPERTIES.fontColour = BLACKA(255);
    end;

    if (PROPERTIES.colour == nil) then
        PROPERTIES.colour = WHITEA(255);
    end;

    if (PROPERTIES.fontDefaultColour == nil) then
        PROPERTIES.fontDefaultColour = RGB(191, 191, 191);
    end;

    if (PROPERTIES.defaultText == nil) then
        PROPERTIES.defaultText = '';
    end;

    if (PROPERTIES.colors == nil) then
        PROPERTIES.colors = {};
    end;

    if (PROPERTIES.visible == nil) then
        PROPERTIES.visible = true;
    end;

    if (PROPERTIES.disabled == nil) then
        PROPERTIES.disabled = false;
    end;

    local ELEMENT = getEditEX(
        PARENT, 
        ANCHOR, 
        POSSIZE,
        PROPERTIES.font,
        PROPERTIES.text,
        PROPERTIES.notAllowedChars, 
        PROPERTIES.colors,
        {
            font_colour = PROPERTIES.fontColour,
            colour1 = PROPERTIES.colour,
            visible = PROPERTIES.visible,
            disabled = PROPERTIES.disabled
        }  
    );

    if (strlen(PROPERTIES.defaultText) > 0) then
        setVisible(ELEMENT, false);

        local DEFAULT = getLabelEX(
            PARENT,
            anchorLTRB,
            POSSIZE,
            nil,
            PROPERTIES.defaultText,
            {
                font_colour = PROPERTIES.fontDefaultColour,
                font_name = PROPERTIES.font
            }
        ); 

        set_Callback(DEFAULT.ID, CALLBACK_MOUSECLICK, 'setVisibleID(' .. DEFAULT.ID .. ', false); setVisibleID(' .. ELEMENT.ID .. ', true); setFocusID(' .. ELEMENT.ID .. ');');
    end;

    return ELEMENT;
end;

function filesInMod(mod, directory)
    return OW_FILELIST('%ow%/mods/' .. mod .. '/' .. directory);
end;

function hasFilesInMod(mod, directory)
    return (table.getn(filesInMod(mod, directory)) > 0);
end;

function hasCampaignInMod(mod, campaign)
    return hasFilesInMod(mod, 'missions/__' .. campaign .. '/01') or hasFilesInMod(mod, 'Missions/__' .. string.lower(campaign) .. '/01');
end;

function hasSkirmishInMod(mod)
    return hasFilesInMod(mod, 'missions/_skirmish') or hasFilesInMod(mod, 'Missions/_Skirmish');
end;