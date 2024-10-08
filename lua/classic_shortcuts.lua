function loadShortcutsFilesList()
    local list = OW_GET_KEYBOARD_SHORTCUT_FILELIST();

    if #list == 0 then
        return {
            '<' .. loc(TID_msg_Default) .. '>',
        };
    end;

    return list;
end;

function loadShortcutsPagesList()
    local pages = OW_GET_COMMPANEL_PAGES();
    local list = {};

    for i = 0, #pages do
        list[i] = pages[i].NAME;
    end;

    return list;
end;

function loadShortcutsButtonsList()
    local buttons = OW_GET_COMMPANEL_BUTTONS();
    local list = {};

    for i = 0, #buttons do
        local langText = loc(buttons[i].LANGID);

        if strlen(langText) == 0 then
            goto continue;
        end;

        local shortcut = SGUI_widesub(langText, 3, 3);    

        langText = OW_REMOVE_KEYBOARD_SHORTCUT_FROM_STRING(langText);
        langText = string.gsub(langText, "~", "");

        list = addToArray(list, string.gsub(text(('[' .. shortcut .. '] ' .. langText), 24, '..'), CHAR13, ""));
        ::continue::
    end;

    return list;
end;

function createShortcutIcon(PARENT, BTNINDEX, X, Y)
    local COL = 1;

    if (BTNINDEX > 85) then
        COL = 2;
        BTNINDEX = BTNINDEX - 85;
    end;

    local ELEMENT = getElementEX(
        PARENT,
        anchorNone,
        XYWH(X, Y, 41, 41),
        true,
        {
            texture = 'classic/edit/shortcuts/buttons.png',
            subtexture = true,
            subcoords = SUBCOORD(COL * 41, BTNINDEX * 41, 41, 41)
        }
    );

    return ELEMENT;
end;


menu.window_shortcuts = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

menu.window_shortcuts.panel = getElementEX(
    menu.window_shortcuts, 
    anchorNone, 
    XYWH(LayoutWidth / 2 - 322, LayoutHeight / 2 - 160, 644, 320), 
    true, 
    {
        texture = 'classic/edit/shortcuts/panel.png'
    }
);

menu.window_shortcuts.panel.cancel = clButton(
    menu.window_shortcuts.panel, 
    109, 
    280,
    140, 
    30,
    loc(TID_msg_Cancel), 
    'showShortcuts(0);',
    {}
);

menu.window_shortcuts.panel.saveAs = clButton(
    menu.window_shortcuts.panel, 
    252, 
    280,
    140, 
    30,
    loc(TID_msg_SaveAs), 
    '',
    {}
);

menu.window_shortcuts.panel.accept = clButton(
    menu.window_shortcuts.panel, 
    395, 
    280,
    140, 
    30,
    loc(TID_msg_Ok), 
    'showShortcuts(0);',
    {}
);

menu.window_shortcuts.panel.searchInput = getEditEX(
    menu.window_shortcuts.panel,
    anchorNone,
    XYWH(12, 25, 214, 14),
    BankGotic_14,
    '',
    '',
    {},
    {
        font_colour = BLACK(),
        font_name = Arial_14,
        callback_keypress = ''
    }
);

menu.window_shortcuts.panel.searchBtn = clButton(
    menu.window_shortcuts.panel, 
    234, 
    24, 
    88,
    27, 
    loc(TID_msg_Search), 
    '',
    {
        texture = 'classic/edit/menu_button_send_l.png',
        texture2 = 'classic/edit/menu_button_send_c.png',
        texture3 = 'classic/edit/menu_button_send_r.png'
    }
);

menu.window_shortcuts.panel.pagesList = clListBox(
    menu.window_shortcuts.panel, 
    XYWH(7, 50, 194, 226), 
    loadShortcutsPagesList(), 
    1, 
    '', 
    {}
);

menu.window_shortcuts.panel.buttonsList = clListBox(
    menu.window_shortcuts.panel, 
    XYWH(201, 50, 194, 226), 
    nil, -- loadShortcutsButtonsList(), 
    1, 
    '', 
    {}
);

menu.window_shortcuts.panel.filesList = clComboBox(
    menu.window_shortcuts.panel,
    406,
    20,
    loadShortcutsFilesList(),
    1,
    '',
    {
        texture = 'classic/edit/combobox-small-opt.png',
        textureButton = 'classic/edit/combobox-small-button-opt.png',
        textureButtonClick = 'classic/edit/combobox-small-button-click-opt.png',
        hint = loc(TID_Main_Menu_Shortcuts_Files_Hint)
    }
);

menu.window_shortcuts.panel.buttonsPanel = getElementEX(
    menu.window_shortcuts.panel, 
    anchorNone, 
    XYWH(400, 70, 130, 140), 
    true, 
    {
        colour1 = WHITEA()
    }
);


createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 1, 1, 13);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 2, 43, 13);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 3, 85, 13);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 11, 1, 54);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 12, 43, 54);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 13, 85, 54);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 21, 1, 95);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 22, 43, 95);
createShortcutIcon(menu.window_shortcuts.panel.buttonsPanel, 33, 85, 95);


function showShortcuts(MODE)
    if MODE > 0 then
        setVisible(menu.window_options, false);
        setVisible(menu.window_shortcuts, true);
    else
        setVisible(menu.window_options, true);
        setVisible(menu.window_shortcuts, false);
    end;
end;

--createShortcutIcon(menu.window_shortcuts, 2, 0, 0);

-- 
--clDebug(OW_GET_USER_KEYBOARD_SHORTCUTS());
--clDebug(OW_GET_KEYBOARD_SHORTCUTS(getvalue(OWV_LANG)));
--clDebug(OW_GET_KEYBOARD_SHORTCUTS('POL'));


--clDebug(OW_GET_COMMPANEL_BUTTONS());
--clDebug(OW_GET_COMMPANEL_PAGES()[2]);
--clDebug(loadShortcutsPagesList());