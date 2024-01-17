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

--clDebug(OW_GET_USER_KEYBOARD_SHORTCUTS());
--clDebug(OW_GET_KEYBOARD_SHORTCUTS('POL'));
--clDebug(OW_GET_KEYBOARD_SHORTCUT_FILELIST());

--clDebug(OW_GET_COMMPANEL_BUTTONS());
--clDebug(OW_GET_COMMPANEL_PAGES());