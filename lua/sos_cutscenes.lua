function cutscene.doCutscene(FILENAME, RECIEVER, CALLBACK)
    setTexture(cutscene.video, 'black.png');
    
    OW_menumusic(false);
    playMenuMusic(0);

    OW_hidemouse(true);
    setFocus(cutscene.video);
    setVisible(cutscene, true);

    setText(cutscene.subtitles,'');

    setVisible(cutscene.video.glare, RECIEVER);
    setVisible(cutscene.video.bord, RECIEVER);
    setVisible(cutscene.video.redled, RECIEVER);

    setVisible(cutscene.subtitles, OW_get(SETTING_SUBTITLES));

    OW_SEQ_RUN(cutscene.video.ID, 'videos/' .. FILENAME, CALLBACK);
    OW_SET_VSYNC_VIDEOMODE(true);
end;

function cutscene.doX1(FILENAME, CALLBACK)
    setColour1(cutscene, BLACK());
    setXYWH(cutscene.video, XYWH(0, 0, ScrWidth, ScrHeight));

    cutscene.doCutscene('X1/' .. FILENAME, false, CALLBACK);
end;

function cutscene.doX2(FILENAME, CALLBACK)
    setColour1(cutscene, BLACK());
    setXYWH(cutscene.video, XYWH(0, 0, ScrWidth, ScrHeight));

    cutscene.doCutscene('X2/' .. FILENAME, false, CALLBACK);
end;

function FROMOW_PLAYSEQ(SIDE, FILENAME)
    if SIDE == 0 then
        cutscene.doAM(FILENAME, cutscene.onSeqEnd);
    elseif SIDE == 1 then
        cutscene.doAR(FILENAME, cutscene.onSeqEnd);
    elseif SIDE == 2 then
        cutscene.doRU(FILENAME, cutscene.onSeqEnd);
    elseif SIDE == 4 then
        cutscene.doX1(FILENAME, cutscene.onSeqEnd);
    elseif SIDE == 5 then
        cutscene.doX2(FILENAME, cutscene.onSeqEnd);
    end;
end;