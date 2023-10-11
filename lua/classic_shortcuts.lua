menu.window_shortcuts = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = WHITEA(0)
    }
);

function showShortcuts(mode)
    if mode > 0 then
        showOptions(0);
        setVisible(menu.window_shortcuts, true);
    else
        showOptions(1);
        setVisible(menu.window_shortcuts, false);
    end;
end;

--clDebug(OW_GET_KEYBOARD_SHORTCUTS('POL'));