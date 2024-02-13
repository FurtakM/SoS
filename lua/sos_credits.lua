--[[function showCredits()
    playCreditsMusic(1);
    menu.window_credits.content.y = ScrHeight + 20;
    sgui_set(menu.window_credits.content.ID, PROP_Y, menu.window_credits.content.y);
    setVisible(menu.window_credits, true);
    setVisible(menu.window_credits.content, true);
    showMenuButton(0);
end;

function hideCredits()
    if getVisible(menu.window_credits) then
        playCreditsMusic(0);
        setVisible(menu.window_credits, false);
        setVisible(menu.window_credits.content, false);
        showMenuButton(1);
    end;
end;

OW_loadcredits(menu.window_credits.content.ID, 'credits/credits');--]]

function credits:fboScene()
    OGL_GLENABLE(GL_BLEND);
        OGL_QUAD_BEGIN2D(credits.fbo.W,credits.fbo.H);
            SGUI_DRAWELEMENT(menu.ID);
            SGUI_DRAWELEMENT(menu.window_credits.ID);
        OGL_QUAD_END2D();
    OGL_GLDISABLE(GL_BLEND);
end;

function showCredits()
    playCreditsMusic(1);
    setVisible(menu.window_credits, true);
    showMenuButton(0);
    credits:onShow();
end;

function hideCredits()
    if getVisible(menu.window_credits) then
        playCreditsMusic(0);
        setVisible(menu.window_credits, false);
        showMenuButton(1);
        credits:onHide();
    end;
end;

SGUI_SETPARENT(credits.ID,menu.window_credits.ID);
setXYWH(credits,XYWH(0,0,getWidth(menu.window_credits),getHeight(menu.window_credits)));
setNoMouseEvent(credits,true);
credits.width = getWidth(menu.window_credits); 

OW_loadcredits(credits.ID, 'credits/credits');