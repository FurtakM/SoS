------------------------------------------------------------------------------
---  Orig. File : /lua/InGame/game_spectatorBar.lua
---  Version    : 5
---
---  Summary    : Players bars instead Resources bars.
---
---  Created    : Petr 'Sali' Salak, Freya Group
---  Modified   : Serpent/Rahol
------------------------------------------------------------------------------

SpecBar = {};
SpecBar.count = 0;
SpecBar.bars  = {};
SpecBar.tabs = {};
SpecBar.pages = {};
SpecBar.currentPage = 1;
SpecBar.activeSides = {};
SpecBar.metricRows = {};
SpecBar.damageRows = {};
SpecBar.killsRows = {};
SpecBar.sideNatTex = {};
SpecBar.sideNation = {};
SpecBar.researchBySide = {};
SpecBar.researchPayloadSide = nil;
SpecBar.killStats = {};
SpecBar.killPayloadSide = nil;
SpecBar.sideIndexBase = nil;
SpecBar.selectedSide = 1;
SpecBar.selectedNation = nil;
SpecBar.researchSlots = {};
SpecBar.commButtonIndexById = nil;
SpecBar.researchRenderKey = '';

SpecBar.tabNames = {
	[1] = loc(5078),
	[2] = loc(5079),
	[3] = loc(5080),
	[4] = loc(5081),
	[5] = loc(5082)
};

SpecBar.layout = {
	tabH = 22,
	tabGap = 2,
	rowsMax = 8
};

SpecBar.researchLayout = {
	iconSize = 41,
	slotSize = 41,
	cols = 8,
	gap = 4,
	x = 10,
	y = 34
};

local SPECBAR_BUTTONS_DIR = 'SGUI/Amer/SpecBar/buttons/';

specBarVisible = 0;
specBarFadeVisible = true;

function makeSpecBarLabel(element,ID,IX,IY,IW,IH)
	return AddElement({
		type=TYPE_LABEL,
		parent=element,
		anchor=anchorLT,
		x=IX,
		y=IY,
		width=IW,
		height=IH,
		font_name=Tahoma_10B,
		callback_mouseclick='',
		text='',
		scissor=true,
		scroll_text=true,
	});
end;

local function SpecBarGetX()
	local screenW = ScrWidth;
	
	if screenW == nil then
		screenW = game.ui.width;
	end;

	return screenW - interface.current.game.ui.specbar.width;
end;

local function SpecBarGetContentYOffset()
	return SpecBar.layout.tabH;
end;

local function SpecBarGetY(ID)
	return SpecBarGetContentYOffset() + (ID-1) * interface.current.game.ui.specbar.h;
end;

local function SpecBarGetTabWidth()
	local specbarui = interface.current.game.ui.specbar;
	return math.floor((specbarui.width - (SpecBar.layout.tabGap * 4)) / 5);
end;

function makeSpecBar(ID)
	local specbarui = interface.current.game.ui.specbar;

	local element = AddElement({
		type=TYPE_ELEMENT,
		parent=game.ui,
		anchor=anchorTL,
		x=SpecBarGetX(),
		y=SpecBarGetY(ID),
		width=specbarui.width,
		height=specbarui.h,
		callback_mouseclick='showFadeSpaceBar();',
		subtexture=true,
		subcoords=SUBCOORD(0,0,specbarui.wt,50),
		visible=false,
	});

	setInterfaceTexture(element,'SpecBar/SpecBar.png');
	
	element.l = {};

	element.l[1] = makeSpecBarLabel(element,ID,specbarui.x1,specbarui.y1,specbarui.w3,specbarui.h1);
	element.l[2] = makeSpecBarLabel(element,ID,specbarui.x2,specbarui.y1,specbarui.w1,specbarui.h1);
	element.l[3] = makeSpecBarLabel(element,ID,specbarui.x2+specbarui.w2,specbarui.y1,specbarui.w1,specbarui.h1);
	element.l[4] = makeSpecBarLabel(element,ID,specbarui.x2+specbarui.w2*2,specbarui.y1,specbarui.w1,specbarui.h1);
	element.l[5] = makeSpecBarLabel(element,ID,specbarui.x2+specbarui.w2*3,specbarui.y1,specbarui.w1,specbarui.h1);

	element.logo = {};

	element.logo[1] = getElementEX(
		element,
		anchorRT,
		XYWH(
			specbarui.x1-specbarui.logoX,
			specbarui.logoY,
			specbarui.logoW,
			specbarui.logoH
		),
		true,
		{
			colour1 = SIDE_COLOURS[ID+1],
			texture = 'SGUI/Alien/Multiplayer/Nat/back.png',
		}
	);

	element.logo[1].nat = getElementEX(
		element.logo[1],
		anchorRT,
		XYWH(
			0,
			0,
			specbarui.logoW,
			specbarui.logoH
		),
		true,
		{
			colour1 = GRAY(SIDE_COLOURS[ID+1].c),
			texture = 'SGUI/Alien/Multiplayer/Nat/am.png',
		}
	);

	for i=1,4 do
		element.logo[i+1] = getElementEX(
			element,
			anchorRT,
			XYWH(
				specbarui.x2+specbarui.w2*(i-1)-specbarui.logoX,
				specbarui.logoY,
				specbarui.logoW,
				specbarui.logoH
			),
			true,
			{
				colour1 = WHITEA(255),
				texture = 'empty.png',
			}
		);
		element.logo[i+1].iconName = "";
	end;

	return element;
end;

local function SpecBarMakeTab(ID)
	local tabW = SpecBarGetTabWidth();
	local tabX = SpecBarGetX() + (ID - 1) * (tabW + SpecBar.layout.tabGap);

	local tab = AddElement({
		type = TYPE_LABEL,
		parent = game.ui,
		anchor = anchorLT,
		x = tabX,
		y = 0,
		width = tabW,
		height = SpecBar.layout.tabH,
		font_name = Tahoma_10B,
		text_halign = ALIGN_MIDDLE,
		text_valign = ALIGN_MIDDLE,
		callback_mouseclick = 'SpecBarSetPage(' .. ID .. ');',
		text = SpecBar.tabNames[ID],
		scissor = true,
		visible = false
	});

	setColour1(tab, RGBA(25, 25, 25, 200));
	setFontColour(tab, RGB(220, 220, 220));

	return tab;
end;

local function SpecBarMakePage()
	local specbarui = interface.current.game.ui.specbar;

	local el = AddElement({
		type = TYPE_ELEMENT,
		parent = game.ui,
		anchor = anchorLT,
		x = SpecBarGetX(),
		y = SpecBar.layout.tabH,
		width = specbarui.width,
		height = specbarui.h * SpecBar.layout.rowsMax,
		callback_mouseclick = 'showFadeSpaceBar();',
		visible = false
	});

	setColour1(el, BLACKA(0));

	return el;
end;

local function SpecBarReflowResourceRows()
	local yOffSet = SpecBarGetContentYOffset();

	for _, side in ipairs(SpecBar.activeSides) do
		if SpecBar.bars[side] and SpecBar.bars[side].isInGame then
			setY(SpecBar.bars[side], yOffSet);
			yOffSet = yOffSet + interface.current.game.ui.specbar.h;
		end;
	end;
end;

local function SpecBarSafeNumber(value)
	if value == nil then
		return 0;
	end;
	local n = tonumber(value);
	if n == nil then
		return 0;
	end;
	return n;
end;

local function SpecBarGetDamageTable()
	if type(OW_GET_SIDE_DAMAGE_DONE) ~= 'function' then
		return nil;
	end;

	local ok, data = pcall(OW_GET_SIDE_DAMAGE_DONE);

	if ok then
		return data;
	end;

	return nil;
end;

local function SpecBarGetSideDamage(side)
	local data = SpecBarGetDamageTable();

	if type(data) ~= 'table' then
		return 0;
	end;

	if type(data[side]) == 'table' then
		return SpecBarSafeNumber(data[side].value or data[side].damage or data[side][1]);
	end;

	return SpecBarSafeNumber(data[side]);
end;

local function SpecBarReadKillValue(data, key1, key2, index)
	if type(data) ~= 'table' then
		return 0;
	end;

	if key1 ~= nil and data[key1] ~= nil then
		return SpecBarSafeNumber(data[key1]);
	end;

	if key2 ~= nil and data[key2] ~= nil then
		return SpecBarSafeNumber(data[key2]);
	end;

	if index ~= nil and data[index] ~= nil then
		return SpecBarSafeNumber(data[index]);
	end;

	return 0;
end;

local function SpecBarDecodeKillRow(row)
	local kills = {
		buildings = 0,
		people = 0,
		vehicles = 0
	};

	if type(row) ~= 'table' then
		return kills;
	end;

	-- Prefer explicit field names when available.
	kills.people = SpecBarReadKillValue(row, 'people', 'humans', nil);
	kills.vehicles = SpecBarReadKillValue(row, 'vehicles', 'vehicle', nil);
	kills.buildings = SpecBarReadKillValue(row, 'buildings', 'building', nil);

	if kills.people ~= 0 or kills.vehicles ~= 0 or kills.buildings ~= 0 then
		return kills;
	end;

	local isZeroBased = (row[0] ~= nil) and (row[3] == nil);

	if isZeroBased then
		kills.people = SpecBarReadKillValue(row, nil, nil, 0);
		kills.vehicles = SpecBarReadKillValue(row, nil, nil, 1);
		kills.buildings = SpecBarReadKillValue(row, nil, nil, 2);
		return kills;
	end;

	-- Fallback to numeric slots: [1]=people, [2]=vehicles, [3]=buildings.
	if row[1] ~= nil or row[2] ~= nil or row[3] ~= nil then
		kills.people = SpecBarReadKillValue(row, nil, nil, 1);
		kills.vehicles = SpecBarReadKillValue(row, nil, nil, 2);
		kills.buildings = SpecBarReadKillValue(row, nil, nil, 3);
		return kills;
	end;

	return kills;
end;

local function SpecBarGetSideKillValues(side)
	local kills = {
		buildings = 0,
		people = 0,
		vehicles = 0
	};

	-- Get data from setPlayerKills (sent by game all at once, like Badania)
	if SpecBar.killStats and type(SpecBar.killStats[side]) == 'table' then
		kills = SpecBarDecodeKillRow(SpecBar.killStats[side]);
	end;

	return kills;
end;

local function SpecBarGetSideList()
	local list = {};

	for _, side in ipairs(SpecBar.activeSides) do
		list[#list + 1] = side;
	end;

	if #list > 0 then
		return list;
	end;

	for i = 1, 8 do
		if SpecBar.bars[i] and SpecBar.bars[i].isInGame then
			list[#list + 1] = i;
		end;
	end;

	return list;
end;

local function SpecBarGetSelectedSide()
	if SpecBar.selectedSide and SpecBar.bars[SpecBar.selectedSide] and SpecBar.bars[SpecBar.selectedSide].isInGame then
		return SpecBar.selectedSide;
	end;

	if SpecBar.activeSides and #SpecBar.activeSides > 0 then
		SpecBar.selectedSide = SpecBar.activeSides[1];
		return SpecBar.selectedSide;
	end;

	for i = 1, 8 do
		if SpecBar.bars[i] and SpecBar.bars[i].isInGame then
			SpecBar.selectedSide = i;
			return i;
		end;
	end;

	SpecBar.selectedSide = 1;

	return 1;
end;

local function SpecBarNormalizeSide(side)
	local s = tonumber(side);

	if s == nil then
		return nil;
	end;

	-- Auto-detect side indexing mode once we get an unambiguous value.
	if s == 0 then
		SpecBar.sideIndexBase = 0;
		return 1;
	end;
	if s == 8 then
		SpecBar.sideIndexBase = 1;
		return 8;
	end;

	if SpecBar.sideIndexBase == 0 then
		if s >= 0 and s <= 7 then
			return s + 1;
		end;
		return nil;
	end;

	if SpecBar.sideIndexBase == 1 then
		if s >= 1 and s <= 8 then
			return s;
		end;
		return nil;
	end;

	if s >= 1 and s <= 8 then
		return s;
	end;

	if s >= 0 and s <= 7 then
		return s + 1;
	end;

	return nil;
end;

local function SpecBarNormalizeNation(nation)
	local n = tonumber(nation);

	if n == nil then
		return nil;
	end;

	if n >= 1 and n <= 3 then
		return n;
	end;

	return nil;
end;

local function SpecBarGetNationName(nation)
	if nation == 1 then
		return loc(810);
	end;

	if nation == 2 then
		return loc(811);
	end;

	if nation == 3 then
		return loc(812);
	end;

	return '-';
end;

local function SpecBarGetResearchButtonTexture(buttonID, researched)
	local id = tonumber(buttonID);

	if id == nil then
		return nil;
	end;

	if researched then
		return SPECBAR_BUTTONS_DIR .. tostring(id) .. '-1.png';
	end;

	return SPECBAR_BUTTONS_DIR .. tostring(id) .. '.png';
end;

local function SpecBarGetNationForSide(side)
	if SpecBar.selectedNation ~= nil then
		return SpecBar.selectedNation;
	end;

	if SpecBar.sideNation and SpecBar.sideNation[side] ~= nil then
		return SpecBarNormalizeNation(SpecBar.sideNation[side]);
	end;

	return nil;
end;

local function SpecBarGetNationResearchButtonIDs(nation)
	if nation == 1 and type(AmerButtIDs) == 'table' then
		return AmerButtIDs;
	end;

	if nation == 2 and type(ArButtIDs) == 'table' then
		return ArButtIDs;
	end;

	if nation == 3 and type(RusButtIds) == 'table' then
		return RusButtIds;
	end;

	return nil;
end;

local function SpecBarGetButtonTechID(buttonID)
	if type(buttonIDsToTechID) == 'table' then
		return buttonIDsToTechID[buttonID];
	end;

	return nil;
end;

local function SpecBarIsTechInResearchList(side, techID)
	if techID == nil then
		return false;
	end;

	local list = SpecBar.researchBySide and SpecBar.researchBySide[side];
	if type(list) ~= 'table' then
		return false;
	end;

	for _, entry in ipairs(list) do
		if tonumber(entry) == tonumber(techID) then
			return true;
		end;
		if type(entry) == 'table' then
			if tonumber(entry.tech or entry.TECH or entry.id or entry.ID) == tonumber(techID) then
				return true;
			end;
		end;
	end;

	for _, entry in pairs(list) do
		if tonumber(entry) == tonumber(techID) then
			return true;
		end;
		if type(entry) == 'table' then
			if tonumber(entry.tech or entry.TECH or entry.id or entry.ID) == tonumber(techID) then
				return true;
			end;
		end;
	end;

	return false;
end;

local function SpecBarIsResearchCompleted(side, buttonID)
	local techID = SpecBarGetButtonTechID(buttonID);

	if techID == nil then
		return false;
	end;

	return SpecBarIsTechInResearchList(side, techID);
end;

local SpecBarRefreshResearchPage;

local function SpecBarSelectSide(side)
	local normalized = SpecBarNormalizeSide(side);

	-- On Research tab for spectators, always bind to selected unit side.
	if SpecBar.currentPage == 2 and type(getvalue) == 'function' and getvalue(OWV_MYSIDE) == 9 then
		if SELECTED_UNIT ~= nil and SELECTED_UNIT.SIDE ~= nil then
			local forced = SpecBarNormalizeSide(SELECTED_UNIT.SIDE);
			if forced ~= nil then
				normalized = forced;
			end;
		end;
	end;

	if normalized == nil then
		return;
	end;

	SpecBar.selectedSide = normalized;
	SpecBar.researchRenderKey = '';

	if SpecBar.currentPage == 2 and SpecBarRefreshResearchPage ~= nil then
		SpecBarRefreshResearchPage();
	end;
end;

local function SpecBarEnsureResearchSlots(count)
	if SpecBar.pages[2] == nil or SpecBar.pages[2].grid == nil then
		return;
	end;

	for i = #SpecBar.researchSlots + 1, count do
		local slot = {};

		slot.box = AddElement({
			type = TYPE_ELEMENT,
			parent = SpecBar.pages[2].grid,
			anchor = anchorLT,
			x = 0,
			y = 0,
			width = SpecBar.researchLayout.slotSize,
			height = SpecBar.researchLayout.slotSize,
			visible = false,
		});

		setColour1(slot.box, RGBA(35, 35, 35, 220));

		slot.icon = AddElement({
			type = TYPE_ELEMENT,
			parent = slot.box,
			anchor = anchorLT,
			x = 0,
			y = 0,
			width = SpecBar.researchLayout.iconSize,
			height = SpecBar.researchLayout.iconSize,
			subtexture = false,
			visible = true,
		});

		setTexture(slot.icon, 'empty.png');

		slot.fallback = AddElement({
			type = TYPE_LABEL,
			parent = slot.box,
			anchor = anchorLT,
			x = 1,
			y = 12,
			width = SpecBar.researchLayout.slotSize - 2,
			height = 16,
			font_name = Tahoma_10B,
			text_halign = ALIGN_MIDDLE,
			text_valign = ALIGN_MIDDLE,
			text = '',
			visible = false,
		});

		slot.done = AddElement({
			type = TYPE_LABEL,
			parent = slot.box,
			anchor = anchorLT,
			x = 1,
			y = 24,
			width = SpecBar.researchLayout.slotSize - 2,
			height = 16,
			font_name = Tahoma_10B,
			text_halign = ALIGN_RIGHT,
			text_valign = ALIGN_MIDDLE,
			text = '',
			visible = true,
		});

		SpecBar.researchSlots[i] = slot;
	end;
end;

local function SpecBarGetResearchPageHeight(buttonCount)
	local cols = SpecBar.researchLayout.cols;
	local slotSize = SpecBar.researchLayout.slotSize;
	local gap = SpecBar.researchLayout.gap;
	local rows = math.max(1, math.ceil(math.max(0, tonumber(buttonCount) or 0) / cols));
	local gridHeight = (rows * slotSize) + ((rows - 1) * gap);
	local topArea = SpecBar.researchLayout.y + 6;
	
	return topArea + gridHeight;
end;

local function SpecBarResizeResearchPage(buttonCount)
	if SpecBar.pages[2] == nil then
		return;
	end;

	local specbarui = interface.current.game.ui.specbar;
	local pageHeight = SpecBarGetResearchPageHeight(buttonCount);
	local pageWidth = specbarui.width;
	local gridHeight = math.max(1, pageHeight - SpecBar.researchLayout.y);

	if SpecBar.pages[2] ~= nil then
		setHeight(SpecBar.pages[2], pageHeight);
	end;

	if SpecBar.pages[2].back ~= nil then
		setHeight(SpecBar.pages[2].back, pageHeight);
		setWidth(SpecBar.pages[2].back, pageWidth);
	end;

	if SpecBar.pages[2].grid ~= nil then
		setHeight(SpecBar.pages[2].grid, gridHeight);
		setWidth(SpecBar.pages[2].grid, pageWidth - (SpecBar.researchLayout.x * 2));
	end;
end;

local function SpecBarGetResearchTechName(entry, fallback)
	if type(entry) == 'table' then
		if entry.name ~= nil then
			return tostring(entry.name);
		end;

		if entry.NAME ~= nil then
			return tostring(entry.NAME);
		end;

		if entry.tech ~= nil then
			return tostring(entry.tech);
		end;

		if entry.TECH ~= nil then
			return tostring(entry.TECH);
		end;

		if entry.id ~= nil then
			return tostring(entry.id);
		end;

		if entry.ID ~= nil then
			return tostring(entry.ID);
		end;

		return tostring(fallback);
	end;

	if type(entry) == 'boolean' then
		if entry then
			return tostring(fallback);
		end;

		return nil;
	end;

	if entry == nil then
		return nil;
	end;

	return tostring(entry);
end;

local function SpecBarBuildResearchLines(side)
	local sideResearch = SpecBar.researchBySide and SpecBar.researchBySide[side];

	if type(sideResearch) ~= 'table' then
		return '';
	end;

	local lines = {};
	local used = {};

	for i, tech in ipairs(sideResearch) do
		local name = SpecBarGetResearchTechName(tech, i);

		if name and name ~= '' then
			lines[#lines + 1] = name;
			used[i] = true;
		end;
	end;

	for i, tech in pairs(sideResearch) do
		if not used[i] then
			local name = SpecBarGetResearchTechName(tech, i);
			if name and name ~= '' then
				lines[#lines + 1] = name;
			end;
		end;
	end;

	local text = '';

	for i = 1, #lines do
		text = text .. i .. '. ' .. lines[i];

		if i < #lines then
			text = text .. '\n';
		end;
	end;

	return text;
end;

local function SpecBarParseResearchString(payload)
	if type(payload) ~= 'string' then
		return nil;
	end;

	payload = string.gsub(payload, '^%s+', '');
	payload = string.gsub(payload, '%s+$', '');
	if payload == '' then
		return {};
	end;

	local normalized = string.gsub(payload, '%[', '{');
	normalized = string.gsub(normalized, '%]', '}');

	-- PrepareArray on a nested array produces "{...},{...},..." without outer braces.
	-- Wrap it so loadstring returns a single table of tables.
	if normalized:match('^%s*{') and normalized:match('}%s*,') then
		normalized = '{' .. normalized .. '}';
	end;

	local loader = loadstring or load;
	if type(loader) ~= 'function' then
		return nil;
	end;

	local chunk = loader('return ' .. normalized);
	if chunk == nil then
		return nil;
	end;

	local ok, data = pcall(chunk);

	if not ok or type(data) ~= 'table' then
		return nil;
	end;

	return data;
end;

local function SpecBarNormalizeResearchBySide(list, preferredSide)
	if type(list) ~= 'table' then
		return nil;
	end;

	local normalized = {};
	local hasNestedSideTables = false;
	local hasZeroBasedSideKeys = (list[0] ~= nil);

	for i = 1, 8 do
		normalized[i] = {};
		if type(SpecBar.researchBySide) == 'table' and type(SpecBar.researchBySide[i]) == 'table' then
			for j, v in ipairs(SpecBar.researchBySide[i]) do
				normalized[i][j] = v;
			end;
		end;
	end;

	for i = 1, 8 do
		if type(list[i]) == 'table' then
			hasNestedSideTables = true;
			break;
		end;
	end;

	for i = 0, 7 do
		if type(list[i]) == 'table' then
			hasNestedSideTables = true;
			break;
		end;
	end;

	if not hasNestedSideTables then
		local targetSide = SpecBarNormalizeSide(preferredSide);
		if targetSide ~= nil then
			-- Explicit side provided: update only that side.
			normalized[targetSide] = {};

			for i, tech in ipairs(list) do
				normalized[targetSide][i] = tech;
			end;
		else
			-- No explicit side: treat as global update and apply to all sides.
			for s = 1, 8 do
				normalized[s] = {};

				for i, tech in ipairs(list) do
					normalized[s][i] = tech;
				end;
			end;
		end;
	else
		for i = 1, 8 do
			local sourceIndex = i;

			if hasZeroBasedSideKeys then
				sourceIndex = i - 1;
			end;

			local sideResearch = list[sourceIndex];

			if type(sideResearch) == 'table' then
				normalized[i] = sideResearch;
			elseif sideResearch ~= nil then
				normalized[i] = {sideResearch};
			-- else: nil entry → keep pre-filled value from existing researchBySide
			end;
		end;
	end;

	return normalized;
end;

local function SpecBarSetTabStyle(tab, active)
	if active then
		setColour1(tab, RGBA(66, 120, 84, 220));
		setFontColour(tab, RGB(255, 255, 255));
	else
		setColour1(tab, RGBA(25, 25, 25, 200));
		setFontColour(tab, RGB(220, 220, 220));
	end;
end;

local function SpecBarCreateMetricRows(parent, targetRows)
	local specbarui = interface.current.game.ui.specbar;

	for i = 1, 8 do
		local rowY = (i - 1) * specbarui.h;
		local row = {};

		row.container = AddElement({
			type = TYPE_ELEMENT,
			parent = parent,
			anchor = anchorLT,
			x = 0,
			y = rowY,
			width = specbarui.width,
			height = specbarui.h,
			callback_mouseclick = 'showFadeSpaceBar();',
			visible = false,
		});

		setColour1(row.container, RGBA(10, 20, 45, 220));

		-- Nation logo – same structure as Surowce bars
		row.logo = getElementEX(
			row.container,
			anchorRT,
			XYWH(specbarui.x1 - specbarui.logoX, specbarui.logoY, specbarui.logoW, specbarui.logoH),
			true,
			{
				colour1 = SIDE_COLOURS[i + 1],
				texture = 'SGUI/Alien/Multiplayer/Nat/back.png',
			}
		);

		row.logo.nat = getElementEX(
			row.logo,
			anchorRT,
			XYWH(0, 0, specbarui.logoW, specbarui.logoH),
			true,
			{
				colour1 = GRAY(SIDE_COLOURS[i + 1].c),
				texture = 'SGUI/Alien/Multiplayer/Nat/am.png',
			}
		);

		-- Player name label (matches l[1] position in Surowce)
		row.name = AddElement({
			type = TYPE_LABEL,
			parent = row.container,
			anchor = anchorLT,
			x = specbarui.x1,
			y = specbarui.y1,
			width = specbarui.w3,
			height = specbarui.h1,
			font_name = Tahoma_10B,
			text = '',
			scissor = true,
			scroll_text = true,
		});

		-- Histogram background spanning first 3 resource column slots
		row.back = getElementEX(
			row.container,
			anchorLT,
			XYWH(specbarui.x2, specbarui.y1, specbarui.w2 * 3, specbarui.h1),
			true,
			{
				texture = 'empty.png',
				colour1 = RGBA(30, 30, 30, 200)
			}
		);

		-- Histogram fill bar
		row.fill = getElementEX(
			row.container,
			anchorLT,
			XYWH(specbarui.x2, specbarui.y1, 1, specbarui.h1),
			true,
			{
				texture = 'empty.png',
				colour1 = SIDE_COLOURS[i + 1] or RGB(180, 180, 180)
			}
		);

		-- Value label in 4th resource column slot
		row.value = AddElement({
			type = TYPE_LABEL,
			parent = row.container,
			anchor = anchorLT,
			x = specbarui.x2 + specbarui.w2 * 3,
			y = specbarui.y1,
			width = specbarui.w1,
			height = specbarui.h1,
			font_name = Tahoma_10B,
			text_halign = ALIGN_RIGHT,
			text = '0'
		});

		targetRows[i] = row;
	end;
end;

-- Kills column layout (x positions of each column center area)
local KILLS_COL = { people = 128, vehicles = 242, buildings = 356 };
local KILLS_COL_W = 100;

local function SpecBarKillsHeader(parent, specbarui)
	local iconTex = 'SGUI/Rus/Building ParamsIcons.png';
	-- All three icons from sprite sheet (people, vehicles, buildings)
	local spriteW = 19;
	local cols = {
		{ x = KILLS_COL.people,    srcX = 14 },
		{ x = KILLS_COL.vehicles,  srcX = 63 },
		{ x = KILLS_COL.buildings, srcX = 111 },
	};

	for _, col in ipairs(cols) do
		local ico = AddElement({
			type = TYPE_ELEMENT,
			parent = parent,
			anchor = anchorLT,
			x = col.x + math.floor((KILLS_COL_W - spriteW) / 2),
			y = 0,
			width = spriteW,
			height = 20,
			subtexture = true,
			subcoords = SUBCOORD(col.srcX, 0, spriteW, 20),
			callback_mouseclick = 'showFadeSpaceBar();',
			visible = true,
		});
		setTexture(ico, iconTex);
		setColour1(ico, WHITEA(255));
	end;
end;

local function SpecBarCreateKillsRows(parent)
	local specbarui = interface.current.game.ui.specbar;
	local headerH = 22;

	-- Column header icons (once, above all rows)
	local headerEl = AddElement({
		type = TYPE_ELEMENT,
		parent = parent,
		anchor = anchorLT,
		x = 0,
		y = 0,
		width = specbarui.width,
		height = headerH,
		callback_mouseclick = 'showFadeSpaceBar();',
	});

	setColour1(headerEl, RGBA(10, 20, 45, 180));
	SpecBarKillsHeader(headerEl, specbarui);

	for i = 1, 8 do
		local rowY = headerH + (i - 1) * specbarui.h;
		local row = {};

		row.container = AddElement({
			type = TYPE_ELEMENT,
			parent = parent,
			anchor = anchorLT,
			x = 0,
			y = rowY,
			width = specbarui.width,
			height = specbarui.h,
			callback_mouseclick = 'showFadeSpaceBar();',
			visible = false,
		});
		setColour1(row.container, RGBA(10, 20, 45, 220));

		row.name = AddElement({
			type = TYPE_LABEL,
			parent = row.container,
			anchor = anchorLT,
			x = 8,
			y = specbarui.y1,
			width = 116,
			height = specbarui.h1,
			font_name = Tahoma_10B,
			text = '',
			scissor = true,
		});

		row.valuePeople = AddElement({
			type = TYPE_LABEL,
			parent = row.container,
			anchor = anchorLT,
			x = KILLS_COL.people,
			y = specbarui.y1,
			width = KILLS_COL_W,
			height = specbarui.h1,
			font_name = Tahoma_10B,
			text_halign = ALIGN_MIDDLE,
			text = '0',
		});

		row.valueVehicles = AddElement({
			type = TYPE_LABEL,
			parent = row.container,
			anchor = anchorLT,
			x = KILLS_COL.vehicles,
			y = specbarui.y1,
			width = KILLS_COL_W,
			height = specbarui.h1,
			font_name = Tahoma_10B,
			text_halign = ALIGN_MIDDLE,
			text = '0',
		});

		row.valueBuildings = AddElement({
			type = TYPE_LABEL,
			parent = row.container,
			anchor = anchorLT,
			x = KILLS_COL.buildings,
			y = specbarui.y1,
			width = KILLS_COL_W,
			height = specbarui.h1,
			font_name = Tahoma_10B,
			text_halign = ALIGN_MIDDLE,
			text = '0',
		});

		SpecBar.killsRows[i] = row;
	end;
end;

local function SpecBarBuildTabsAndPages()
	for i = 1, 5 do
		SpecBar.tabs[i] = SpecBarMakeTab(i);
		SpecBar.pages[i] = SpecBarMakePage();
	end;

	SpecBar.pages[2].list = AddElement({
		type = TYPE_LABEL,
		parent = SpecBar.pages[2],
		anchor = anchorLT,
		x = 10,
		y = 34,
		width = interface.current.game.ui.specbar.width - 20,
		height = 18,
		font_name = Tahoma_10B,
		text_halign = ALIGN_LEFT,
		text_valign = ALIGN_MIDDLE,
		scissor = true,
		scroll_text = false,
		text = '',
		callback_mouseclick = 'showFadeSpaceBar();'
	});

	SpecBar.pages[2].back = AddElement({
		type = TYPE_ELEMENT,
		parent = SpecBar.pages[2],
		anchor = anchorLT,
		x = 0,
		y = 0,
		width = interface.current.game.ui.specbar.width,
		height = interface.current.game.ui.specbar.h * SpecBar.layout.rowsMax,
		visible = true,
		callback_mouseclick = 'showFadeSpaceBar();'
	});

	setColour1(SpecBar.pages[2].back, RGBA(12, 18, 32, 215));

	SpecBar.pages[2].title = AddElement({
		type = TYPE_LABEL,
		parent = SpecBar.pages[2],
		anchor = anchorLT,
		x = 10,
		y = 10,
		width = interface.current.game.ui.specbar.width - 20,
		height = 20,
		font_name = Tahoma_10B,
		text_halign = ALIGN_LEFT,
		text_valign = ALIGN_MIDDLE,
		visible = true,
		text = loc(5085)
	});

	SpecBar.pages[2].grid = AddElement({
		type = TYPE_ELEMENT,
		parent = SpecBar.pages[2],
		anchor = anchorLT,
		x = SpecBar.researchLayout.x,
		y = SpecBar.researchLayout.y,
		width = interface.current.game.ui.specbar.width - (SpecBar.researchLayout.x * 2),
		height = interface.current.game.ui.specbar.h * SpecBar.layout.rowsMax - SpecBar.researchLayout.y,
		visible = true,
		callback_mouseclick = 'showFadeSpaceBar();'
	});

	setColour1(SpecBar.pages[2].grid, BLACKA(0));

	SpecBarCreateMetricRows(SpecBar.pages[3], SpecBar.metricRows);
	SpecBarCreateMetricRows(SpecBar.pages[4], SpecBar.damageRows);
	SpecBarCreateKillsRows(SpecBar.pages[5]);
	-- page 5 rows start after header, account for that in height
end;

local function SpecBarUpdateMetricPage(rows, values)
	local sides = SpecBarGetSideList();
	local maxVal = 1;

	for i = 1, #sides do
		local side = sides[i];
		local v = SpecBarSafeNumber(values[side]);

		if v > maxVal then
			maxVal = v;
		end;
	end;

	for i = 1, 8 do
		local row = rows[i];

		if row == nil then
			break;
		end;

		local side = sides[i];
		if side ~= nil then
			local specbarui = interface.current.game.ui.specbar;
			local name = '';

			if SpecBar.bars[side] and SpecBar.bars[side].l and SpecBar.bars[side].l[1] then
				name = getText(SpecBar.bars[side].l[1]);
			end;

			setText(row.name, name);
			setFontColour(row.name, specbarui.fontcol1 or RGB(200, 200, 200));

			-- sync nation logo texture from Surowce bar
			if row.logo and SpecBar.sideNatTex and SpecBar.sideNatTex[side] then
				setColour1(row.logo, SIDE_COLOURS[side + 1]);
				setColour1(row.logo.nat, GRAY(SIDE_COLOURS[side + 1].c));
				setTexture(row.logo.nat, SpecBar.sideNatTex[side]);
			end;

			local value = SpecBarSafeNumber(values[side]);
			setText(row.value, tostring(math.floor(value)));
			local barW = math.floor((value / maxVal) * (specbarui.w2 * 3));

			if barW < 1 and value > 0 then
				barW = 1;
			end;

			setWidth(row.fill, barW);
			setColour1(row.fill, SIDE_COLOURS[side + 1] or RGB(180, 180, 180));
			setVisible(row.container, true);
		else
			setVisible(row.container, false);
		end;
	end;
end;

local function SpecBarRefreshPowerPage()
	local values = {};

	for i = 1, 8 do
		values[i] = SpecBar.strengthValues[i] or 0;
	end;

	SpecBarUpdateMetricPage(SpecBar.metricRows, values);
end;

local function SpecBarRefreshDamagePage()
	local values = {};

	for i = 1, 8 do
		values[i] = SpecBarGetSideDamage(i);
	end;

	SpecBarUpdateMetricPage(SpecBar.damageRows, values);
end;

local function SpecBarRefreshKillsPage()
	local sides = SpecBarGetSideList();

	for i = 1, 8 do
		local row = SpecBar.killsRows[i];

		if row == nil then
			break;
		end;

		local side = sides[i];

		if side ~= nil then
			local name = '';
			if SpecBar.bars[side] and SpecBar.bars[side].l and SpecBar.bars[side].l[1] then
				name = getText(SpecBar.bars[side].l[1]);
			end;
			setText(row.name, name);
			setFontColour(row.name, SIDE_COLOURS[side + 1] or RGB(220, 220, 220));

			local data = SpecBarGetSideKillValues(side);

			setText(row.valueBuildings, tostring(math.floor(data.buildings)));
			setText(row.valuePeople, tostring(math.floor(data.people)));
			setText(row.valueVehicles, tostring(math.floor(data.vehicles)));
			setVisible(row.container, true);
		else
			setVisible(row.container, false);
		end;
	end;
end;

SpecBarRefreshResearchPage = function()
	if SpecBar.pages[2] == nil or SpecBar.pages[2].title == nil or SpecBar.pages[2].list == nil then
		return;
	end;

	local side = SpecBarGetSelectedSide();
	local nation = SpecBarGetNationForSide(side);
	local buttonList = SpecBarGetNationResearchButtonIDs(nation);
	local sideName = loc(5083) .. ': ' .. tostring(side);
	
	if SpecBar.bars[side] and SpecBar.bars[side].l and SpecBar.bars[side].l[1] then
		sideName = getText(SpecBar.bars[side].l[1]);
	end;

	local title = loc(5079) .. ': ' .. sideName;

	if nation ~= nil then
		title = title .. ' (' .. SpecBarGetNationName(nation) .. ')';
	end;

	setText(SpecBar.pages[2].title, title);
	setFontColour(SpecBar.pages[2].title, SIDE_COLOURS[side + 1] or RGB(220, 220, 220));

	if type(buttonList) ~= 'table' or #buttonList == 0 then
		SpecBarResizeResearchPage(0);
		SpecBar.researchRenderKey = tostring(side) .. ':' .. tostring(nation);
		
		setText(SpecBar.pages[2].list, loc(5084));
		setFontColour(SpecBar.pages[2].list, RGB(220, 220, 220));
		
		for i = 1, #SpecBar.researchSlots do
			setVisible(SpecBar.researchSlots[i].box, false);
		end;
		
		return;
	end;

	SpecBarResizeResearchPage(#buttonList);

	local renderKey = tostring(side) .. ':' .. tostring(nation) .. ':';

	for i = 1, #buttonList do
		local bid = tonumber(buttonList[i]);
		local done = (bid ~= nil) and SpecBarIsResearchCompleted(side, bid) or false;
		
		renderKey = renderKey .. tostring(bid or '?') .. '=' .. (done and '1' or '0') .. ';';
	end;
	
	if SpecBar.researchRenderKey == renderKey then
		return;
	end;
	
	SpecBar.researchRenderKey = renderKey;

	SpecBarEnsureResearchSlots(#buttonList);

	local completed = 0;
	
	for i = 1, #SpecBar.researchSlots do
		local slot = SpecBar.researchSlots[i];
		if i <= #buttonList then
			local buttonID = tonumber(buttonList[i]);
			local col = (i - 1) % SpecBar.researchLayout.cols;
			local row = math.floor((i - 1) / SpecBar.researchLayout.cols);
			
			setXY(slot.box, col * (SpecBar.researchLayout.slotSize + SpecBar.researchLayout.gap), row * (SpecBar.researchLayout.slotSize + SpecBar.researchLayout.gap));
			setVisible(slot.box, true);

			local done = false;

			if buttonID ~= nil then
				done = SpecBarIsResearchCompleted(side, buttonID);
			end;

			if done then
				completed = completed + 1;
				setColour1(slot.box, RGBA(42, 112, 62, 220));
			else
				setColour1(slot.box, RGBA(35, 35, 35, 220));
			end;

			setText(slot.done, '');

			local iconTexture = SpecBarGetResearchButtonTexture(buttonID, done);

			if iconTexture ~= nil then
				setTexture(slot.icon, iconTexture);
				setVisible(slot.icon, true);
				setVisible(slot.fallback, false);
			else
				setVisible(slot.icon, false);
				setVisible(slot.fallback, true);
				setText(slot.fallback, tostring(buttonID or '?'));
				setFontColour(slot.fallback, RGB(240, 240, 240));
			end;
		else
			setVisible(slot.box, false);
		end;
	end;

	setText(SpecBar.pages[2].list, loc(5086) .. ': ' .. tostring(completed) .. '/' .. tostring(#buttonList));
	setFontColour(SpecBar.pages[2].list, RGB(220, 220, 220));
end;

local function SpecBarParseStrengthPayload(payload)
	if type(payload) ~= 'string' then
		return nil;
	end;

	payload = string.gsub(payload, '^%s+', '');
	payload = string.gsub(payload, '%s+$', '');
	if payload == '' then
		return {};
	end;

	local normalized = string.gsub(payload, '%[', '{');
	normalized = string.gsub(normalized, '%]', '}');
	normalized = string.gsub(normalized, '}%s*{', '},{');

	if normalized:match('^%s*{') and (normalized:match('}%s*,') or normalized:match('}%s*{')) then
		normalized = '{' .. normalized .. '}';
	end;

	local loader = loadstring or load;
	if type(loader) ~= 'function' then
		return nil;
	end;

	local chunk = loader('return ' .. normalized);
	if chunk == nil then
		return nil;
	end;

	local ok, data = pcall(chunk);
	if not ok or type(data) ~= 'table' then
		return nil;
	end;

	return data;
end;

local function SpecBarNormalizeStrengthValues(list)
	local normalized = {};
	for i = 1, 8 do
		normalized[i] = 0;
	end;

	if type(list) ~= 'table' then
		return normalized;
	end;

	for i = 1, 8 do
		normalized[i] = SpecBarSafeNumber(list[i]);
	end;

	if normalized[1] ~= 0 or normalized[2] ~= 0 or normalized[3] ~= 0 or normalized[4] ~= 0 or normalized[5] ~= 0 or normalized[6] ~= 0 or normalized[7] ~= 0 or normalized[8] ~= 0 then
		return normalized;
	end;

	if list[0] ~= nil then
		for i = 1, 8 do
			normalized[i] = SpecBarSafeNumber(list[i - 1]);
		end;
	end;

	return normalized;
end;

function SpecBarRefreshPages()
	--if SpecBar.currentPage == 2 then
		-- Research page refresh is event-driven (research/side/nation updates) to keep icons stable.
	--end;

	SpecBarRefreshPowerPage();
	SpecBarRefreshDamagePage();
	SpecBarRefreshKillsPage();
end;

SpecBar.strengthValues = {};

function setPlayerStrength(s1, s2, s3, s4, s5, s6, s7, s8)
	local list;

	if s1 == nil and s2 == nil and s3 == nil and s4 == nil and s5 == nil and s6 == nil and s7 == nil and s8 == nil then
		list = {};
	elseif type(s1) == 'string' and s2 == nil then
		list = SpecBarParseStrengthPayload(s1);
	elseif type(s1) == 'table' and s2 == nil then
		list = s1;
	else
		list = {s1, s2, s3, s4, s5, s6, s7, s8};
	end;

	list = SpecBarNormalizeStrengthValues(list);
	
	for i = 1, 8 do
		SpecBar.strengthValues[i] = list[i] or 0;
	end;
	
	if SpecBar.currentPage == 3 then
		SpecBarRefreshPowerPage();
	end;
end;

function setPlayerResearch(r1, r2, r3, r4, r5, r6, r7, r8)
	local list;

	if r1 == nil and r2 == nil and r3 == nil and r4 == nil and r5 == nil and r6 == nil and r7 == nil and r8 == nil then
		list = {};
	elseif type(r1) == 'string' and r2 == nil then
		list = SpecBarParseResearchString(r1);
	elseif type(r1) == 'table' and r2 == nil then
		list = r1;
	else
		list = {r1, r2, r3, r4, r5, r6, r7, r8};
	end;

	local payloadSide = SpecBar.researchPayloadSide;
	SpecBar.researchPayloadSide = nil;

	list = SpecBarNormalizeResearchBySide(list, payloadSide);
	if type(list) ~= 'table' then
		return;
	end;

	SpecBar.researchBySide = list;
	SpecBar.researchRenderKey = '';

	if SpecBar.currentPage == 2 then
		SpecBarRefreshResearchPage();
	end;
end;

function setSpecBarSelectedSide(side)
	SpecBarSelectSide(side);
end;

function setPlayerResearchSide(side)
	local targetSide = SpecBarNormalizeSide(side);
	if targetSide == nil then
		return;
	end;

	SpecBar.researchPayloadSide = targetSide;

	SpecBarSelectSide(targetSide);
end;

local function SpecBarParseKillsString(payload)
	if type(payload) ~= 'string' then
		return nil;
	end;

	payload = string.gsub(payload, '^%s+', '');
	payload = string.gsub(payload, '%s+$', '');

	if payload == '' then
		return {};
	end;

	local normalized = string.gsub(payload, '%[', '{');
	normalized = string.gsub(normalized, '%]', '}');
	normalized = string.gsub(normalized, '}%s*{', '},{');

	-- Handle array format like [{1,2,3},{3,2,4},...] and [{1,2,3}{3,2,4}...]
	if normalized:match('^%s*{') and (normalized:match('}%s*,') or normalized:match('}%s*{')) then
		normalized = '{' .. normalized .. '}';
	end;

	local loader = loadstring or load;

	if type(loader) ~= 'function' then
		return nil;
	end;

	local chunk = loader('return ' .. normalized);
	if chunk == nil then
		return nil;
	end;

	local ok, data = pcall(chunk);
	if not ok or type(data) ~= 'table' then
		return nil;
	end;

	return data;
end;

local function SpecBarParseKillRowPayload(payload)
	if payload == nil then
		return nil;
	end;

	if type(payload) == 'table' then
		return payload;
	end;

	if type(payload) == 'number' then
		return {payload};
	end;

	if type(payload) ~= 'string' then
		return {payload};
	end;

	payload = string.gsub(payload, '^%s+', '');
	payload = string.gsub(payload, '%s+$', '');

	if payload == '' then
		return {};
	end;

	local commaValues = {};

	for token in string.gmatch(payload, '([^,]+)') do
		local trimmed = string.gsub(token, '^%s+', '');
		trimmed = string.gsub(trimmed, '%s+$', '');

		if tonumber(trimmed) == nil then
			commaValues = nil;
			break;
		end;

		commaValues[#commaValues + 1] = tonumber(trimmed);
	end;

	if commaValues ~= nil and #commaValues > 0 then
		return commaValues;
	end;

	local parsed = SpecBarParseKillsString(payload);

	if type(parsed) == 'table' then
		return parsed;
	end;

	if tonumber(payload) ~= nil then
		return {tonumber(payload)};
	end;

	return nil;
end;

local function SpecBarNormalizeKillRow(row, existingRow)
	local normalized = {0, 0, 0};

	if type(existingRow) == 'table' then
		normalized[1] = SpecBarSafeNumber(existingRow[1]);
		normalized[2] = SpecBarSafeNumber(existingRow[2]);
		normalized[3] = SpecBarSafeNumber(existingRow[3]);
	end;

	if type(row) ~= 'table' then
		return normalized;
	end;

	if row.people ~= nil or row.humans ~= nil or row.vehicles ~= nil or row.vehicle ~= nil or row.buildings ~= nil or row.building ~= nil then
		normalized[1] = SpecBarReadKillValue(row, 'people', 'humans', nil);
		normalized[2] = SpecBarReadKillValue(row, 'vehicles', 'vehicle', nil);
		normalized[3] = SpecBarReadKillValue(row, 'buildings', 'building', nil);
		return normalized;
	end;

	local isZeroBased = (row[0] ~= nil) and (row[3] == nil);

	if isZeroBased then
		if row[0] ~= nil then normalized[1] = SpecBarSafeNumber(row[0]); end;
		if row[1] ~= nil then normalized[2] = SpecBarSafeNumber(row[1]); end;
		if row[2] ~= nil then normalized[3] = SpecBarSafeNumber(row[2]); end;

		return normalized;
	end;

	if row[1] ~= nil then normalized[1] = SpecBarSafeNumber(row[1]); end;
	if row[2] ~= nil then normalized[2] = SpecBarSafeNumber(row[2]); end;
	if row[3] ~= nil then normalized[3] = SpecBarSafeNumber(row[3]); end;

	return normalized;
end;

local function SpecBarNormalizeKillStats(list, preferredSide)
	if type(list) ~= 'table' then
		return nil;
	end;

	local normalized = {};

	for i = 1, 8 do
		normalized[i] = {};

		if type(SpecBar.killStats) == 'table' and type(SpecBar.killStats[i]) == 'table' then
			normalized[i] = SpecBarNormalizeKillRow(SpecBar.killStats[i]);
		end;
	end;

	-- Check if list is a flat per-side row (e.g. [people,vehicles,buildings] for one side)
	local hasNestedTables = false;

	for i = 0, 8 do
		if type(list[i]) == 'table' then
			hasNestedTables = true;
			break;
		end;
	end;

	if not hasNestedTables then
		-- Single row sent with explicit side
		local targetSide = SpecBarNormalizeSide(preferredSide);

		if targetSide ~= nil then
			normalized[targetSide] = SpecBarNormalizeKillRow(list, normalized[targetSide]);
		end;
	else
		local hasZeroBasedSideKeys = (list[0] ~= nil);
		for i = 1, 8 do
			local sourceIndex = i;
			if hasZeroBasedSideKeys then
				sourceIndex = i - 1;
			end;

			local sideKills = list[sourceIndex];

			if type(sideKills) == 'table' and next(sideKills) ~= nil then
				normalized[i] = SpecBarNormalizeKillRow(sideKills, normalized[i]);
			end;
		end;
	end;

	return normalized;
end;

function setPlayerKills(k1, k2, k3, k4, k5, k6, k7, k8)
	-- Handle different call formats
	local list;
	local payloadSide = SpecBar.killPayloadSide;
	SpecBar.killPayloadSide = nil;

	if k1 == nil and k2 == nil and k3 == nil and k4 == nil and k5 == nil and k6 == nil and k7 == nil and k8 == nil then
		list = {};
	elseif payloadSide == nil and not (type(k1) == 'string' and k2 == nil) and not (type(k1) == 'table' and k2 == nil) then
		list = {};
		local args = {k1, k2, k3, k4, k5, k6, k7, k8};

		for i = 1, 8 do
			local parsedRow = SpecBarParseKillRowPayload(args[i]);
			if parsedRow ~= nil then
				list[i] = parsedRow;
			end;
		end;
	elseif type(k1) == 'string' and k2 == nil then
		if payloadSide ~= nil then
			list = SpecBarParseKillRowPayload(k1);
		else
			list = SpecBarParseKillsString(k1);
			if list == nil then
				list = SpecBarParseKillRowPayload(k1);
			end;
		end;
	elseif type(k1) == 'table' and k2 == nil then
		list = k1;
	else
		list = {k1, k2, k3, k4, k5, k6, k7, k8};
	end;

	list = SpecBarNormalizeKillStats(list, payloadSide);

	if type(list) ~= 'table' then
		return;
	end;

	SpecBar.killStats = list;

	if SpecBar.currentPage == 5 then
		SpecBarRefreshKillsPage();
	end;
end;

function setPlayerKillsSide(side)
	local targetSide = SpecBarNormalizeSide(side);

	if targetSide == nil then
		return;
	end;

	SpecBar.killPayloadSide = targetSide;
end;

function setSpecBarSelectedNation(nation)
	local normalized = SpecBarNormalizeNation(nation);

	if normalized == nil then
		return;
	end;

	if SpecBar.selectedNation == normalized then
		return;
	end;

	SpecBar.selectedNation = normalized;

	if SpecBar.currentPage == 2 and SpecBarRefreshResearchPage ~= nil then
		SpecBarRefreshResearchPage();
	end;
end;

function SpecBarSetPage(page)
	local p = tonumber(page);

	if p == nil then
		return;
	end;

	if p < 1 or p > 5 then
		return;
	end;

	SpecBar.currentPage = p;

	for i = 1, 5 do
		SpecBarSetTabStyle(SpecBar.tabs[i], i == p);
	end;

	for i = 1, 9 do
		if SpecBar.bars[i] then
			setVisible(SpecBar.bars[i], p == 1 and SpecBar.bars[i].isInGame == true and specBarVisible == 1);
		end;
	end;

	for i = 2, 5 do
		if SpecBar.pages[i] then
			setVisible(SpecBar.pages[i], i == p and specBarVisible == 1);
		end;
	end;

	SpecBarRefreshPages();
end;

function switchSpecBarPage(page)
	SpecBarSetPage(page);
end;

function setSpecBarPage(page)
	SpecBarSetPage(page);
end;

for i=1,9 do
	SpecBar.bars[i] = makeSpecBar(i);
end;

SpecBarBuildTabsAndPages();

function setSpecBarCoords(ID,ISACTIVE)
	local specpos = 0;

	if ISACTIVE then
		specpos = 50;
		-- Keep auto-side sync on Resource tab only; otherwise onTick selection drives Research tab.
		if SpecBar.currentPage == 1 then
			SpecBarSelectSide(ID);
		end;
	end;

	set_SubCoords(SpecBar.bars[ID].ID,PROP_SUBCOORDS,SUBCOORD(0,specpos,interface.current.game.ui.specbar.wt,50));
end;

function setSpecLogo(ID, ICON)
	if ID > 1 and ID < 6 then
		for i=1,8 do
			if ICON and ICON ~= "" then
				setInterfaceTexture(SpecBar.bars[i].logo[ID], 'SpecBar/'.. ICON ..'.png');
				SpecBar.bars[i].logo[ID].iconName = ICON;
			else
				setTexture(SpecBar.bars[i].logo[ID], 'empty.png');
				SpecBar.bars[i].logo[ID].iconName = "";
			end
		end;
	end;
end;

function setSpecLogoNumber(ID, ICONNUMBER)
	if (ICONNUMBER <= 0 or ICONNUMBER > 4) then
		return;
	end;

	local ICON = '';

	if ICONNUMBER == 1 then
		ICON = 'crate';
	end;

	if ICONNUMBER == 2 then
		ICON = 'oil';
	end;

	if ICONNUMBER == 3 then
		ICON = 'sib';
	end;

	if ICONNUMBER == 4 then
		ICON = 'human';
	end;

	setSpecLogo(ID, ICON);
end;

function setSpecText(SIDE, ID, TEXT)
	if (ID > 1 and ID < 6) and (SIDE > 0 and SIDE < 9) then
		setText(SpecBar.bars[SIDE].l[ID], TEXT);
	end;
end;

function DoInterfaceChange_Game_SpecBar()
	local specbarui = interface.current.game.ui.specbar;
	local tabW = SpecBarGetTabWidth();

	for i = 1, 5 do
		setXYWH(SpecBar.tabs[i], XYWH(SpecBarGetX() + (i - 1) * (tabW + SpecBar.layout.tabGap), 0, tabW, SpecBar.layout.tabH));
		setXYWH(SpecBar.pages[i], XYWH(SpecBarGetX(), SpecBar.layout.tabH, specbarui.width, specbarui.h * SpecBar.layout.rowsMax));
	end;

	for i=1,9 do
		setInterfaceTexture(SpecBar.bars[i],'SpecBar/SpecBar.png');
		setXYWH(SpecBar.bars[i], XYWH(SpecBarGetX(), SpecBarGetY(i), specbarui.width, specbarui.h));
		setXYWH(SpecBar.bars[i].l[1],XYWH(specbarui.x1,specbarui.y1,specbarui.w3,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[2],XYWH(specbarui.x2,specbarui.y1,specbarui.w1,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[3],XYWH(specbarui.x2+specbarui.w2,specbarui.y1,specbarui.w1,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[4],XYWH(specbarui.x2+specbarui.w2*2,specbarui.y1,specbarui.w1,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[5],XYWH(specbarui.x2+specbarui.w2*3,specbarui.y1,specbarui.w1,specbarui.h1));
		setSpecBarCoords(i,false);

		for j=2,5 do
			if not SpecBar.bars[i].logo[j].iconName == "" then
				setInterfaceTexture(SpecBar.bars[i].logo[j],'SpecBar/'.. SpecBar.bars[i].logo[j].iconName ..'.png');
			end;
		end;
	end;

	SpecBarReflowResourceRows();

	SpecBarSetPage(SpecBar.currentPage);
end;

function showSpecBar(bool)
	if bool == true then
		specBarVisible = 1;
	else
		specBarVisible = 0;
	end;

	for i = 1, 5 do
		if SpecBar.tabs[i] then
			setVisible(SpecBar.tabs[i], specBarVisible == 1);
		end;
	end;

	for i = 1, 9 do
		if SpecBar.bars[i] then
			setVisible(SpecBar.bars[i], false);
		end;
	end;

	for i = 2, 5 do
		if SpecBar.pages[i] then
			setVisible(SpecBar.pages[i], false);
		end;
	end;

	if specBarVisible == 1 then
		SpecBarSetPage(SpecBar.currentPage);
	end;
end;

function showFadeSpaceBar()
	local width = interface.current.game.ui.specbar.width;
	local result = ScrWidth;

	if specBarFadeVisible then
		result = result - 20;
		specBarFadeVisible = false;
	else
		result = result-width;
		specBarFadeVisible = true;
	end;

	for i = 1, 9 do
		AddEventSlideX(SpecBar.bars[i].ID, result, 0.80, nil);
	end;

	for i = 1, 5 do
		local tabW = SpecBarGetTabWidth();
		local tabX = result + (i - 1) * (tabW + SpecBar.layout.tabGap);
		AddEventSlideX(SpecBar.tabs[i].ID, tabX, 0.80, nil);
		AddEventSlideX(SpecBar.pages[i].ID, result, 0.80, nil);
	end;
end;

function SpecBarApplySides(sides)
	SpecBar.activeSides = {};
	SpecBar.sideNatTex = {};
	SpecBar.sideNation = {};
	local yOffSet = SpecBarGetContentYOffset();

	for i = 1, 8 do
		if sides[i] and sides[i].nat then
			SpecBar.bars[i].isInGame = true;
			setText(SpecBar.bars[i].l[1], sides[i].name or '');
			setTexture(SpecBar.bars[i].logo[1].nat, sides[i].nat);
			SpecBar.sideNatTex[i] = sides[i].nat;
			SpecBar.sideNation[i] = SpecBarNormalizeNation(sides[i].nation);
			SpecBar.activeSides[#SpecBar.activeSides + 1] = i;

			for k = 2, 5 do
				setTexture(SpecBar.bars[i].logo[k], 'empty.png');
				SpecBar.bars[i].logo[k].iconName = "";
				setText(SpecBar.bars[i].l[k], '');
			end;

			setY(SpecBar.bars[i], yOffSet);
			yOffSet = yOffSet + interface.current.game.ui.specbar.h;
		else
			SpecBar.bars[i].isInGame = false;
			setVisible(SpecBar.bars[i], false);
		end;
	end;

	SpecBarReflowResourceRows();

	SpecBarRefreshPages();
end;

function init_specBars()
	local sides= {};
	local myInfo;

	for i = 1, 9 do
		sides[i] = {};
	end;

	if MULTI_PLAYERINFO_CURRENT_PLID == nil then
		showSpecBar(false);
		return;
	end;

	for k, v in pairs(MULTI_PLAYERINFO_CURRENT_PLID) do
		if v.ALIVE and v.COLOUR > 0 then
			if loadingPlayers[k] and loadingPlayers[k].NTex then
				sides[v.COLOUR].nat = loadingPlayers[k].NTex;
			end;
			if sides[v.COLOUR].nation == nil and v.NATION ~= nil then
				sides[v.COLOUR].nation = v.NATION;
			end;
			if sides[v.COLOUR].name then
				sides[v.COLOUR].name = sides[v.COLOUR].name .. '+' .. v.NAME;
			else
				sides[v.COLOUR].name = v.NAME;
			end;
		end;
	end;

	SpecBarApplySides(sides);
	myInfo = MULTI_PLAYERINFO_CURRENT_PLID[MyID];

	if myInfo and myInfo.ISSPEC == true then
		showSpecBar(true);
	else
		showSpecBar(false);
	end;
end;