SOS_MUSIC_LIST = {'Hudba/Menu/MenuMain2.wav', 'Hudba/Menu/MenuAmer.wav', 'Hudba/Menu/MenuArab.wav', 'Hudba/Menu/MenuOriginal.wav', 'Hudba/Menu/MenuLeg.wav', 'Hudba/Menu/MenuRus.wav', 'Hudba/Menu/MenuMain.wav', 'Hudba/Menu/MenuRus2.wav'};
SOS_MUSIC_TRACK = -1;
SOS_MUSIC_CREDITS = 'Hudba/Menu/Credits.wav';
SOS_MUSIC_MENU_ID = 0;
SOS_MUSIC_CREDITS_ID = 0;

-- VOLUME_CREDITS = 10;
-- VOLUME_MUSIC_VALUE = OW_settings_getvolume(VOLUME_MUSIC);

OW_menumusic(false);
OW_settings_setvolume(VOLUME_MUSIC_MENU, OW_SETTING_READ_NUMBER('OPTIONS', 'MUSIC_MENU', 2200));

function sound.play(FILENAME, CALLBACK, VOLUMEID)
    sound:add({ID = OW_OAL_LOAD(FILENAME, false, true, 'sound.finish(' .. (sound.COUNT + 1) .. ');' .. CALLBACK, VOLUMEID)});
    OW_OAL_PLAY(sound:getLast().ID);
    return sound.COUNT;
end;

function sound.finish(ID)
    if (ID > 0) then
        OW_OAL_FREE(sound:get(ID).ID);
        sound:deleteID(ID);
    end;
end;

function killGameMusic()
    local music = sound:getLast();

    if music then
        OW_OAL_STOP(music.ID);
    end;
end

function playMusic(TRACK, CALLBACK)
    if (strlen(CALLBACK) == 0) then
        CALLBACK = 'OW_FORCEMUSICDISABLE(false);';
    end;

    sound.play('Hudba/' .. TRACK, CALLBACK, VOLUME_MUSIC);
end;

function playMenuMusic(MODE)
    if (getvalue(OWV_ISEDITOR) or CONFIG_LOGOS) then
        return;
    end;

    if (MODE == 0) then
        if (SOS_MUSIC_MENU_ID > 0) then
            sound.finish(SOS_MUSIC_MENU_ID);
            SOS_MUSIC_MENU_ID = 0;
        end;
    else
        if (SOS_MUSIC_MENU_ID == 0) then
            if (SOS_MUSIC_TRACK == -1) then
                SOS_MUSIC_TRACK = 0;
            else
                SOS_MUSIC_TRACK = math.random(0, #SOS_MUSIC_LIST - 1);
            end;
            playNextTrack(SOS_MUSIC_TRACK);
        end;
    end;
end;

function playCreditsMusic(MODE)
    if MODE == 1 then
        playMenuMusic(0);  

        SOS_MUSIC_CREDITS_ID = sound.play(SOS_MUSIC_CREDITS, 'playCreditsMusic(1);', VOLUME_MUSIC_MENU);
    else     
        sound.finish(SOS_MUSIC_CREDITS_ID);
        playMenuMusic(1);
    end;
end;

function changeVolumeChannel(STEP, MODE)
    if (STEP == 50) then
        if (MODE == 0) then
            OW_settings_setvolume(VOLUME_MUSIC_MENU, VOLUME_MUSIC_VALUE);
        end;

        return;
    end;

    if (MODE == 1) then 
        if (STEP == 1) then
            OW_settings_setvolume(VOLUME_CREDITS, 0);
            VOLUME_MUSIC_VALUE = OW_settings_getvolume(VOLUME_MUSIC_MENU);
        end;

        local tmp = VOLUME_MUSIC_VALUE / 50;
        OW_settings_setvolume(VOLUME_CREDITS, tmp * STEP);
        OW_settings_setvolume(VOLUME_MUSIC_MENU, tmp * (50 - STEP));
    else
        local tmp = VOLUME_MUSIC_VALUE / 50;
        OW_settings_setvolume(VOLUME_MUSIC_MENU, tmp * STEP);
        OW_settings_setvolume(VOLUME_CREDITS, tmp * (50 - STEP));
    end;

    STEP = STEP + 1;
    timer:single(0.1, 'changeVolumeChannel(' .. STEP .. ',' .. MODE .. ');');
end;

function playNextTrack()
    if (SOS_MUSIC_TRACK == #SOS_MUSIC_LIST) then
        SOS_MUSIC_TRACK = 1;
    else
        SOS_MUSIC_TRACK = SOS_MUSIC_TRACK + 1;
    end;

    OW_menumusic(false);
    changeBackgroundMenuImage();
    SOS_MUSIC_MENU_ID = sound.play(SOS_MUSIC_LIST[SOS_MUSIC_TRACK], 'playNextTrack();', VOLUME_MUSIC_MENU);
end;

function playNextTrackClick()
    sound.finish(SOS_MUSIC_MENU_ID);
    playNextTrack();
end;