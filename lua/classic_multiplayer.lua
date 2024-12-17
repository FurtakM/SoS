include('classic_multiplayer_dialog');

-- constants & variables
BOX_IRC = 0;
BOX_SERVER = 1;
MULTIPLAYER_SERVER = {}; -- contains server data which user choose, should be reset each time when user leave server

-- structure
menu.window_multiplayer = getElementEX(
    menu, 
    anchorNone, 
    XYWH(0, 0, LayoutWidth, LayoutHeight), 
    false, 
    {
        colour1 = BLACKA(150)
    }
);

menu.window_multiplayer.panel = getElementEX(
	menu.window_multiplayer, 
	anchorLTRB,
	XYWH(
		menu.window_multiplayer.width / 2 - 512, 
		menu.window_multiplayer.height / 2 - 384, 
		1024,
		768
	),
	true,
	{
		texture = 'classic/edit/multiplayer_window.png'
	}
);

menu.window_multiplayer.panel.IRC = clTextBoxWithTexture(
    menu.window_multiplayer.panel,
    anchorLTRB,
    XYWH(8, 18, 764, 435), 
    '',
    {
    	texture = 'classic/edit/textbox_irc.png',
        font_colour = BLACK(),
        nomouseevent = true,
        font_name = ADMUI3L,
    }
);

menu.window_multiplayer.panel.IRC2 = clTextBoxWithTexture(
    menu.window_multiplayer.panel,
    anchorLTRB,
    XYWH(1, 1, 1, 1), 
    '',
    {
    	visible = false,
    }
);

menu.window_multiplayer.panel.IRC.Users = clListBoxCustom(
	menu.window_multiplayer.panel, 
	XYWH(774, 18, 242, 435), 
	{
		added = 'clListBoxCustomItemNew(' .. BOX_IRC .. ', %id, %rowid, %index, %data);',
		updated = 'clListBoxCustomItemUpdate(' .. BOX_IRC .. ', %rowid, %index, %data);',
		selected = 'clListBoxCustomItemSelected(%rowid);',
		unselected = 'clListBoxCustomItemUnselected(%rowid);',
	},
	{
		texture = 'classic/edit/listbox_users.png'
	}
);

menu.window_multiplayer.panel.IRC2.Users = clListBoxCustom(
	menu.window_multiplayer.panel, 
	XYWH(1, 1, 1, 1), 
	{},
	{
		visible = false
	}
);

menu.window_multiplayer.panel.IRC.messageInput = getEditEX(
    menu.window_multiplayer.panel,
    anchorNone,
    XYWH(14, 460, 900, 14),
    BankGotic_14,
    '',
    '',
    {},
    {
        font_colour = BLACK(),
        font_name = Arial_14,
        callback_keypress = 'watchIRCMessage(%id, %k);'
    }
);

menu.window_multiplayer.panel.IRC.sendButton = clButton(
    menu.window_multiplayer.panel, 
    930, 
    457, 
    88,
    27, 
    loc(TID_InGame_Chat_Send), 
    'sendIRCMessage(' .. menu.window_multiplayer.panel.IRC.messageInput.ID .. ');',
    {
    	texture = 'classic/edit/menu_button_send_l.png',
    	texture2 = 'classic/edit/menu_button_send_c.png',
    	texture3 = 'classic/edit/menu_button_send_r.png'
    }
);

-- server list
menu.window_multiplayer.panel.serverList = clListBoxCustom(
	menu.window_multiplayer.panel, 
	XYWH(8, 504, 764, 215), 
	{
		added = 'clListBoxCustomServerItemNew(' .. BOX_SERVER .. ', %id, %rowid, %index, %data);',
		updated = 'clListBoxCustomItemServerUpdate(' .. BOX_SERVER .. ', %rowid, %index, %data);'
	},
	{
		texture = 'classic/edit/msservers_listbox.png'
	}
);

-- player list on server
menu.window_multiplayer.panel.playersList = clListBox(
    menu.window_multiplayer.panel, 
    XYWH(774, 504, 242, 215), 
    {}, 
    0, 
    '', 
    {
        texture = 'classic/edit/msplayers_listbox.png'
    }
);

-- bottom buttons
menu.window_multiplayer.panel.quit = clButton(
    menu.window_multiplayer.panel, 
    46, 
    723, 
    184,
    30, 
    loc(TID_Main_Menu_Back_To_Menu), 
    'showMultiplayerWindow(0);',
    {}
);


menu.window_multiplayer.panel.changeName = clButton(
    menu.window_multiplayer.panel, 
    233, 
    723, 
    184,
    30, 
    loc(TID_Main_Menu_Change_Name), 
    'clOpenPrompt(menu.window_multiplayer.changePlayerName.ID, getPlayerName());',
    {}
);

menu.window_multiplayer.panel.createGame = clButton(
    menu.window_multiplayer.panel, 
    420, 
    723, 
    184,
    30, 
    loc(TID_Multi_button_create_server), 
    'ShowDialog(menu.window_multiplayer.createServer)',
    {}
);

menu.window_multiplayer.panel.joinGame = clButton(
    menu.window_multiplayer.panel, 
    607, 
    723, 
    184,
    30, 
    loc(TID_Multi_button_join_game), 
    '', -- see: clickOnServer()
    {
        disabled = true
    }
);

menu.window_multiplayer.panel.setIPAddr = clButton(
    menu.window_multiplayer.panel, 
    794, 
    723, 
    184,
    30, 
    loc(TID_Multi_button_enter_ip), 
    'requestJoinToServerIP();',
    {}
);

menu.window_multiplayer.createServer = clCreateServerDialog(dialog.back, 'createMultiplayerGame()', '');
menu.window_multiplayer.enterIP = clEnterIPDialog('clOpenPrompt(menu.window_multiplayer.enterPassword.ID, "")');
menu.window_multiplayer.enterPassword = clPrompt(
    'joinToServer();', 
    {
        backgroundColor = BLACKA(0),
        title = loc(TID_Main_Menu_Password)
    }
);
menu.window_multiplayer.changePlayerName = clPrompt(
    'changePlayerName();',
    {
        title = loc(TID_Main_Menu_Change_Name)
    }
);

-- handlers
function FROMOW_MULTIPLAYER_JOINFAILED(MESSAGE, STATUS)
    -- debug(STATUS);
end;

function FROMOW_MULTIPLAYER_DOJOINROOM(ADDRESS, PASSWORD)
	showMultiplayerWindow(1);

    if OW_ROOM_JOIN(ADDRESS, PASSWORD, false) then
        showMultiplayerGame();
    end;
end;

function FROMOW_MULTIPLAYER_HOSTGAME()
	showMultiplayerWindow(1);
end;

function FROMOW_MULTIPLAYER_OPEN()
	showMultiplayerWindow(1);
end;

function FROMOW_MULTIPLAYER_STARTGAME()
    IN_LOBBY = false;
    OW_IRC_DESTROY();
end;

function FROMOW_MULTIPLAYER_MODCHANGE()
	showMultiplayerWindow(0);
end;

function FROMOW_SERVER_PLAYERLIST(DATA)
    displayServerPlayerList(DATA.PLAYERS);
end;

----- functions -----
function getPlayerName()
    return OW_SETTING_READ_STRING("MP", "NAME", getvalue(OWV_USERNAME));
end;

function changePlayerName()
    local nickName = getText(menu.window_multiplayer.changePlayerName.prompt.input);

    if (nickName ~= "") then
        OW_MULTIROOM_SET_MYNAME(nickName);
        OW_SETTING_WRITE("MP", "NAME", nickName);
    else
        OW_MULTIROOM_SET_MYNAME(getvalue(OWV_USERNAME));
        OW_SETTING_WRITE("MP", "NAME", getvalue(OWV_USERNAME));
    end;

    clClosePrompt(menu.window_multiplayer.changePlayerName.ID);
end;

function createMultiplayerGame()
	local passwdText = '';

	if (getEnabled(menu.window_multiplayer.createServer.USE_PASSWD)) then
		passwdText = getText(menu.window_multiplayer.createServer.PASSWD);
	end;

	if OW_ROOM_CREATE(getText(menu.window_multiplayer.createServer.SERVER), passwdText) then
		showMultiplayerGame();
	end;
end;

-- user select server
function clickOnServer(ROW_ID, HAS_PASSWORD, INDEX) 
    MULTIPLAYER_SERVER.Mode = 0;
    MULTIPLAYER_SERVER.Index = INDEX;

    local listItems = getChildren({ID=menu.window_multiplayer.panel.serverList.LIST.ID});

    for i = 1, #listItems do
        setColour1({ID=listItems[i].ID}, RGB(231, 222, 214));
    end;

    setEnabled(menu.window_multiplayer.panel.joinGame, true);
    set_Callback(menu.window_multiplayer.panel.joinGame.ID, CALLBACK_MOUSECLICK, 'requestJoinToServer(' .. parseInt(HAS_PASSWORD) .. ',' .. INDEX .. ');');

    setColour1({ID=ROW_ID}, RGB(191, 191, 191));

    -- triggers FROMOW_SERVER_PLAYERLIST(DATA)
    OW_LOBBY_SERVERLISTBOX_CLICK(CUSTOM_LISTBOX_LIST[BOX_SERVER][INDEX].ROOMID);
end;

-- join to server using item from servers list
function requestJoinToServer(HAS_PASSWORD, INDEX)
	MULTIPLAYER_SERVER.Mode = 0;
	MULTIPLAYER_SERVER.Index = INDEX;

	if (HAS_PASSWORD == 1) then
		clOpenPrompt(menu.window_multiplayer.enterPassword.ID, nil);
	else
		joinToServer();
	end;
end;

-- display list of players on current server
function displayServerPlayerList(LIST)
    clSetListItems(menu.window_multiplayer.panel.playersList, split(LIST, "\n"), 0, '', {static = true});
end;

-- join to server using `Enter IP prompt`
function requestJoinToServerIP()
	MULTIPLAYER_SERVER.Mode = 1;
	MULTIPLAYER_SERVER.Index = 0;

	clOpenPrompt(menu.window_multiplayer.enterIP.ID, nil);
end;

function joinToServer()
	clClosePrompt(menu.window_multiplayer.enterPassword.ID);
	clClosePrompt(menu.window_multiplayer.enterIP.ID);

	local MODE = MULTIPLAYER_SERVER.Mode; -- 0: without IP, 1: with IP
	local INDEX = MULTIPLAYER_SERVER.Index;

	local password = getText(menu.window_multiplayer.enterPassword.prompt.input);

	if (parseInt(MODE) == 0) then
		if OW_ROOM_JOIN(CUSTOM_LISTBOX_LIST[BOX_SERVER][INDEX].ROOMID, password, false) then
            showMultiplayerGame();
        end;
	else
		local ip = getText(menu.window_multiplayer.enterIP.prompt.input);

		-- if 3rd param is true then error dialog is not display
		if OW_ROOM_JOIN_IP(ip, password, false) then
			showMultiplayerGame();
		end;
	end;
end;

function generateMultiplayerServerData(ROW_ID, INDEX, DATA)
    local netType = '';
    local serverName = '';
    local gameVer = '';
    local playerCount = DATA.NUMPLAYERS;
    local playerMaxCount = DATA.MAXPLAYERS;
    local modDir = DATA.MODDIR;
    local modVer = DATA.MODVER;
    local isDedicated = DATA.ISDEDICATED;
    local ping = DATA.REPLYTIME;
    local hasPassword = DATA.HASPASSWORD;
    local allowToJoin = getvalue(OWV_PROTOCOLVERSION) == DATA.PROTOCOLVERSION and (string.lower(getvalue(OWV_MODDIR)) == string.lower(modDir));

 	if (allowToJoin) then
 		fontColour = RGB(0, 0, 0);
 	else
 		fontColour = RGB(255, 0, 0);
 	end;

    if (isDedicated) then
        playerCount = playerCount - 1;
        playerMaxCount = playerMaxCount - 1;
    end;

    if (DATA.NETTYPE ~= '') then
        if (DATA.NETTYPE == 'NET') then
            netType = 'Internet';
        else
            netType = DATA.NETTYPE;
        end;
    end;

    if (DATA.SERVERNAME ~= '') then
        serverName = DATA.SERVERNAME;
    end;

    if DATA.GAMEVERSION ~= '' then
        gameVer = ' ' .. DATA.GAMEVERSION .. ' ';
    end;

    sgui_deletechildren(ROW_ID);

    local row = getElementEX(
        {ID = ROW_ID},
        anchorNone,
        XYWH(
            0,
            0,
            getWidthID(ROW_ID), 
            getHeightID(ROW_ID)
        ),
        true,
        {
            colour1 = WHITEA()
        }
    );

    local nettypeLabel = getLabelEX(
        row, 
        anchorNone, 
        XYWH(0, 0, 70, getHeight(row)), 
        nil, 
        netType, 
        {
            colour1 = WHITEA(),
            font_name = ADMUI3L,
            border_colour = WHITEA(),
            font_colour = fontColour,
            nomouseevent = true,
            scissor = true
        }
    );

    local gameVerLabel = getLabelEX(
        row, 
        anchorNone, 
        XYWH(80, 0, 80, getHeight(row)), 
        nil, 
        gameVer, 
        {
           	colour1 = WHITEA(),
            font_name = ADMUI3L,
            border_colour = WHITEA(),
            font_colour = fontColour,
            nomouseevent = true,
            scissor = true
        }
    );

    local serverLabel = serverName .. '  ' .. playerCount .. '/' .. playerMaxCount;

    if (modDir ~= '') then
    	serverLabel = modDir .. ' (' .. modVer .. ')  ' .. serverLabel;
    end;

    local serverNameLabel = getLabelEX(
        row, 
        anchorNone, 
        XYWH(170, 0, 340, getHeight(row)), 
        nil, 
        serverLabel,
        {
            colour1 = WHITEA(),
            font_name = ADMUI3L,
            border_colour = WHITEA(),
            font_colour = fontColour,
            nomouseevent = true,
            scissor = true
        }
    );

    if (hasPassword) then
	    local lockerIcon = getElementEX(
	    	row,
	        anchorR,
	        XYWH(
	          getWidth(row) - 60,
	          3,
	          11, 
	          11
	        ),
	        true,
	        {
	            texture = 'classic/edit/lock.png'
	        }
	    );
	end;

    if (isDedicated) then
        local dediIcon = getElementEX(
            row,
            anchorR,
            XYWH(
              getWidth(row) - 40,
              3,
              11, 
              11
            ),
            true,
            {
                texture = 'classic/edit/dedi.png'
            }
        );
    end;

	local pingIcon = getElementEX(
    	row,
        anchorR,
        XYWH(
          getWidth(row) - 20,
          1,
          13, 
          14
        ),
        true,
        {
            colour1 = pingColour(ping)
        }
    );

    set_Callback(row.ID, CALLBACK_MOUSECLICK, 'clickOnServer(' .. ROW_ID .. ', ' .. parseInt(hasPassword) .. ', ' .. INDEX .. ');');
    set_Callback(row.ID, CALLBACK_MOUSEDBLCLICK, 'requestJoinToServer(' .. parseInt(hasPassword) .. ',' .. INDEX .. ');');
end;

function pingColour(ping)
	if (ping < 60) then
		return RGB(12, 112, 39);
	end;

	if (ping < 100) then
		return RGB(56, 207, 116);
	end;

	if (ping < 300) then
		return RGB(192, 201, 52);
	end;

	if (ping < 500) then
		return RGB(201, 159, 52);
	end;

	if (ping < 1000) then
		return RGB(201, 74, 52);
	end;

	return RGB(207, 17, 17);
end;

function clListBoxCustomServerItemNew(BOX_ID, ID, ROW_ID, INDEX, DATA)
    generateMultiplayerServerData(ROW_ID, INDEX, DATA);

    if (CUSTOM_LISTBOX_LIST[BOX_ID] == nil) then
        CUSTOM_LISTBOX_LIST[BOX_ID] = {};
    end;

    CUSTOM_LISTBOX_LIST[BOX_ID][INDEX] = DATA; 
end;

function clListBoxCustomItemServerUpdate(BOX_ID, ROW_ID, INDEX, DATA)
    generateMultiplayerServerData(ROW_ID, INDEX, DATA);
    
    CUSTOM_LISTBOX_LIST[BOX_ID][INDEX] = DATA; 
end;

-- watch message input IRC
function watchIRCMessage(INPUT_ID, KEY)
	if (KEY == VK_ESC) then
		setText({ID = INPUT_ID}, '');
		clearFocus();
	end;

	if (KEY == VK_ENTER) then
		sendIRCMessage(INPUT_ID);
	end;
end;

function getIRCActiveChannel()
	if (getIndex(menu.window_multiplayer.panel.IRC.Users.LIST) > 0) then
		return CUSTOM_LISTBOX_LIST[BOX_IRC][getIndex(menu.window_multiplayer.panel.IRC.Users.LIST)].name;
	end;

	return '';
end;

-- send message to IRC from current text input
function sendIRCMessage(INPUT_ID)
	local text = getText({ID = INPUT_ID});

	if (strlen(text) == 0) then
		return;
	end;

	OW_IRC_SENDTEXT(text, getIRCActiveChannel());
	setText({ID = INPUT_ID}, '');
end;

-- init multiplayer when user join to lobby
function initMultiplayer()
	OW_IRC_CREATE();
    OW_MULTI_ENABLE(true);
    IN_LOBBY = true;
end;

-- destroy multiplayer instance when user left lobby
function destroyMultiplayer()
    IN_LOBBY = false;
	OW_IRC_DESTROY();
	OW_MULTI_ENABLE(false);
end;

function showMultiplayerWindow(MODE)
	if MODE == 1 then
		showMenuButton(0);
		setVisible(menu.window_multiplayer, true);
		initMultiplayer();
	else
		destroyMultiplayer();
		setVisible(menu.window_multiplayer, false);
		showMenuButton(2);
	end;
end;

function updateServersList()
	if IN_LOBBY then
    	OW_MULTILOBBY_IDLE();
    end;
end;

-- function which put text data intro controls. Should be replaced by something else
OW_IRC_BOXES(
	menu.window_multiplayer.panel.IRC.TEXTBOX.ID, 
	menu.window_multiplayer.panel.IRC.Users.LIST.ID,
	menu.window_multiplayer.panel.IRC2.TEXTBOX.ID, 
	menu.window_multiplayer.panel.IRC2.Users.LIST.ID
);

-- function which get server list data
OW_UI_SET_LOBBY_SERVERLISTBOX(menu.window_multiplayer.panel.serverList.LIST.ID);

-- callback
-- send request for server list
regTickCallback('updateServersList();');

include('classic_multiplayer_room');