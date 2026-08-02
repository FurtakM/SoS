function game.chat.show()
	if (getSetting(OPTION_CHAT)) then
		--setVisible(game.chat, true);
		game.chat.openclose(true);
	--else
		--setVisible(game.chat, false);
	end;
end;

function FROMOW_HINT_DO_WE_PLAY_SOUND(DATA)
	return (not isMultiplayer() or getSetting(OPTION_CHAT));
end;

OLD_FROMOW_ADD_CHAT = FROMOW_ADDCHAT;

function FROMOW_ADDCHAT(DATA)
	if (getSetting(OPTION_CHAT)) then
		OLD_FROMOW_ADD_CHAT(DATA);
	end;
end;