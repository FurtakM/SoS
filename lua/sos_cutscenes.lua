cutscene.onSeqEnd = 'setVisible(cutscene,false);OW_hidemouse(false);clearFocus();OW_SEQ_FINISH();OW_SET_VSYNC_VIDEOMODE(false);SEQ_VID_ID=-1;SEQ_DATA_LOADED=false;';

function cutscene.doCutscene(FILENAME, RECIEVER, CALLBACK)
    setTexture(cutscene.video, 'black.png');
    
    OW_menumusic(false);
    playMenuMusic(0);

    OW_hidemouse(true);
    setFocus(cutscene.video);
    setVisible(cutscene, true);

    setText(cutscene.subtitles, '');

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

function FROMOW_VIDEO_SUBTITLE(TEXT)
    setText(cutscene.subtitles, TEXT);
end;

SEQ_VID_ID = -1;
SEQ_VID_NAME = '';
SEQ_VID_EXT = '';
SEQ_DATA_LOADED = false;

function FROMOW_SEQ_VIDEO_UPDATE(ID, PLAYING, NAME)
    if PLAYING then
        SEQ_VID_ID = ID;

        local setting = OW_SETTING_READ_NUMBER('OPTIONS', 'SUBTITLES', 4);

        if (inArray({2, 4}, setting)) then
            SEQ_VID_NAME, SEQ_VID_EXT = string.match(NAME, "([^%.]+)");

            PlayCustomVideoSubtitles();
        end;
    else
        setText(cutscene.subtitles, '');
        SEQ_VID_NAME = '';
        SEQ_VID_EXT = '';
        SEQ_VID_ID = -1;
    end;
end;

function FROMOW_SEQ_GLOBAL_DATA_LOADED()
    SEQ_DATA_LOADED = true;
end;

function PlayCustomVideoSubtitles();
    if SEQ_VID_ID == -1 then
        return;
    end;

    local lang = OW_SPECIAL_SETTINGS_GET(SETTING_SPECIAL_AUDIOLANG);

    if lang == nil then
        lang = 'ENG';
    end;

    -- ładujemy z pliku odpowiedni fragment napisów wg. timestampa
    if (strlen(SEQ_VID_NAME) and SOS_SUBTITLES[lang][SEQ_VID_NAME] ~= nil) then
        for i, v in pairs(SOS_SUBTITLES[lang][SEQ_VID_NAME]) do
            local t = VIDEO_TIME(SEQ_VID_ID);

            if (t >= v.min and t <= v.max) then
                if (v.var ~= nil) then
                    local set = nil;

                    if (SEQ_DATA_LOADED and OW_GET_GLOBAL_CHARACTER_SET_SIZE(v.var)) then
                        set = v.yes;
                    else
                        set = v.no;
                    end;

                    if (set ~= nil) then
                        for _i, _v in pairs(set) do   
                            if (t >= _v.min and t <= _v.max) then
                                setText(cutscene.subtitles, _v.text);
                                goto outerBreak;
                            end;
                        end;
                    end;
                else
                    setText(cutscene.subtitles, v.text);
                    break;
                end;
            end;

            setText(cutscene.subtitles, '');
        end;
    end;

    ::outerBreak::

    timer:single(0.1, 'PlayCustomVideoSubtitles()');
end;