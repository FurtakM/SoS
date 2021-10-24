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