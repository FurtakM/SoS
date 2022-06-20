--[[
-- to use in vanilla
function leaveDebrief()
	if isClassicInterface() then
		setVisible(Multi_Debrief, false);
		showMenuButton(1);
	else
		setVisible(profilebar, true);

		if SteamInitialized then
			setVisible(Multi_Room.SteamBar.Invite, false);
			setVisible(profile_label, true);
		else
			setVisible(Multi_Room.Profile.MPName, false);
		end;

		setVisible(profile_button, true);
		setVisible(Multi_Debrief, false);
		handleMultiroomSideMenu(bool);
		ChangeInterface(0);
		backToMenu_Multiplayer();

		setEnabled(Multi_Debrief.Menu.Score, true);
	end;
end;]]--

function leaveDebrief()
	setVisible(Multi_Debrief, false);
	showMultiplayerWindow(1);
end;