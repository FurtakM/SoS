AVATARS_DATA = {}; -- global array which contains OpenGL id's of AVATARS
AVATAR_PREVIEW_ID = nil;
AVATARS_COMPONENTS = {};
AVATAR_PARTS = {};

function FROMOW_XICHT_PORTRAIT_PARTS(DATA)
	AVATAR_PARTS = DATA;
end;

OW_XICHT_PORTRAIT_GETPARTS(0);
AVATARS_COMPONENTS.MALE = AVATAR_PARTS;
OW_XICHT_PORTRAIT_GETPARTS(1);
AVATARS_COMPONENTS.FEMALE = AVATAR_PARTS;

function generateAvatar(INDEX, AVATAR, SEX, NATION)
	if NATION < 0 then
		NATION = 0;
	end;

	INDEX = parseInt(INDEX);

	if (AVATARS_DATA[INDEX] ~= nil) then
		OW_XICHT_PORTRAIT_FREETEXTURE(AVATARS_DATA[INDEX]);
	end;
	
	local id = OW_XICHT_PORTRAIT(
		0, 
		SEX,
		NATION,
		true,
		0,
		AVATAR[2],
		AVATAR[3],
		AVATAR[4],
		AVATAR[5],
		AVATAR[6],
		AVATAR[7],
		AVATAR[8],
		AVATAR[9],
		AVATAR[10],
		AVATAR[11],
		0,
		AVATAR[13],
		0
	);

	AVATARS_DATA[INDEX] = id;

	return id;
end;

function getAvatarID(INDEX)
	if (AVATARS_DATA[INDEX] ~= nil) then
		return AVATARS_DATA[INDEX];
	end;

	return 0;
end;

function setAvatar(SEX, AVATAR)
	clearAvatarCache();
	
	OW_MULTIROOM_SET_MYAVATAR(
		SEX,
		'0;'
		..AVATAR[2]
		..';'
		..AVATAR[3]
		..';'
		..AVATAR[4]
		..';'
		..AVATAR[5]
		..';'
		..AVATAR[6]
		..';'
		..AVATAR[7]
		..';'
		..AVATAR[8]
		..';'
		..AVATAR[9]
		..';'
		..AVATAR[10]
		..';'
		..AVATAR[11]
		..';0;'
		..AVATAR[13]
		..';0;'
	);
end;

function clearAvatarCache()
	clearPreviewAvatarCache();

	if AVATARS_DATA ~= nil then
		for i = 1, #AVATARS_DATA do
			OW_XICHT_PORTRAIT_FREETEXTURE(AVATARS_DATA[i]);
		end;

		AVATARS_DATA = {};
	end;
end;

function clearPreviewAvatarCache()
	if (AVATAR_PREVIEW_ID ~= nil) then
		OW_XICHT_PORTRAIT_FREETEXTURE(AVATAR_PREVIEW_ID);
	end;

	AVATAR_PREVIEW_ID = nil;
end;

function previewAvatar(AVATAR)
	clearPreviewAvatarCache();

	AVATAR_PREVIEW_ID = OW_XICHT_PORTRAIT(
		0, 
		AVATAR[1],
		1,
		true,
		0,
		AVATAR[2],
		AVATAR[3],
		AVATAR[4],
		AVATAR[5],
		AVATAR[6],
		AVATAR[7],
		AVATAR[8],
		AVATAR[9],
		AVATAR[10],
		AVATAR[11],
		0,
		AVATAR[13],
		0
	);

	return AVATAR_PREVIEW_ID;
end;
