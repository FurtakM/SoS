--[[
This file is used by the 3nd LUA Instance for custom weapon logic.
--]]

TYPE_HUMAN    = 1;
TYPE_VEHICLE  = 2;
TYPE_BUILDING = 3;

ATT_FRIEND    = 1;
ATT_NEUTRAL   = 0;
ATT_ENEMY     = 2;

EXPLOSION_VEHICLE= 1;
EXPLOSION_CANNON_OR_BAZOOKA_IMPACT = 2;
EXPLOSION_MORTAR_IMPACT= 3;
EXPLOSION_MATERIALIZE= 4;
EXPLOSION_MINE = 5;
EXPLOSION_SIBERITE = 7;
EXPLOSION_BUILDING = 8;
EXPLOSION_TIME_BAZOOKA_IMPACT= 9;
EXPLOSION_SMALL_BUILDING = 10;
EXPLOSION_HIT_MISSILE_BIG= 11;
EXPLOSION_OIL_BARREL = 12;
EXPLOSION_ROCKET_HIT_SMALL = 13;

UPG_OILMININGSPEED=1;
UPG_SOLARENGINEDISCHARGING=2;
UPG_OILENGINECONSUMPTION=3;
UPG_SOLARENGINESPEED=4;
UPG_OILENGINESPEED=5;
UPG_CONSTRUCTIONSPEED=6;
UPG_BUILDINGSQUALITY=7;
UPG_VEHICLECONSTRUCTIONSPEED=8;
UPG_HANDWEAPONRANGEBONUS=9;
UPG_HANDWEAPONSTRENGTHVSARMOR=10;
UPG_MACHINEGUNFIRERATE=11;
UPG_GUNSTRENGTH=12;
UPG_ROCKETLAUNCHERRANGEBONUS=13;
UPG_HEAVYGUNAIMINGTIME=14;
UPG_BEHEMOTHFIREPOWER=15;
UPG_EXPLOSIVESSTRENGTH=16;
UPG_ADVANCEDCHASSISARMOR=17;
UPG_BAZOOKERRANGESIGHT=18;
UPG_MORTARACCURACY=19;
UPG_SNIPERRANGESIGHT=20;
UPG_SIBERITEENGINESPEED=21;
UPG_SIBERITEMININGSPEED=22;
UPG_SIBERITEPLANTPOWER=23;
UPG_SIBERITEROCKETCONSTRUCTIONTIME=24;
UPG_SIBERITEDECAYSTRENGTH=25;
UPG_COMPUTERVEHICLESIGHT=26;
UPG_AISKILL=27;
UPG_MORPHLINGSPEED=28;
UPG_HACKINGSPEED=29;
UPG_HUMANSIGHT=30;
UPG_RADARRANGE=31;
UPG_REMOTECONTROLSKILL=32;
UPG_REMOTECONTROLSIGHT=33;
UPG_LASERDAMAGE=34;
UPG_HIDDENCAMERARANGE=35;
UPG_TAUFIELD=36;
UPG_TAURAD=37;
UPG_LAPSER=38;
UPG_SPACESHIFTINGDISTANCE=39;
UPG_LIMTELEPORTDISTANCE=40;
UPG_TELEPORTRECHARGETIME=41;
UPG_TAMINGSPEED=42;
UPG_APEMANDRIVERSKILL=43;
UPG_STIMDRUGS=44;
UPG_BIODETECTION=45;
UPG_HEALSPEED=46;
UPG_SOPOROFICDURATION=47;
UPG_SIBERITEROCKETRANGE=48;
UPG_LASERRANGE=49;
UPG_SOLARPLANTPOWER=50;
UPG_CONTAMRANGE=51;
UPG_CONTAMDURATION=52;

AA_SABRE = 1;
AA_CARBINE = 2;
AA_SLEEP_OFF = 1;
AA_SLEEP_ON= 2;
AA_DISMANTLE = 2;
AA_SPACESHIFTING = 2;
AA_TIMESHIFTING= 3;

TASK_SOPORIFIC     = 'n';
TASK_SPACESHIFTING = '%';
TASK_TIMESHIFTING  = '&';
TASK_ATTACK        = 'A';
TASK_ATTACK_PLACE  = '|';

ANIMTYPE_SLONZERE=1;
ANIMTYPE_OPICAKDOLU=2;
ANIMTYPE_OPICAKNAHORU=3;
ANIMTYPE_OPICAKZERE=4;
ANIMTYPE_OPICAKDREPI=5;
ANIMTYPE_OPICAKHOP=6;
ANIMTYPE_VAKOMYSSNIFA=7;
ANIMTYPE_VAKOMYSCHVOSTI=8;
ANIMTYPE_MASTODONTRVE=9;
ANIMTYPE_MASTODONTZERE=10;
ANIMTYPE_MASTODONTKLEKA=11;
ANIMTYPE_MASTODONTKLECI=12;
ANIMTYPE_MASTODONTVSTAT=13;
ANIMTYPE_MASTODONT_ATTACK=14;
ANIMTYPE_APE_ATTACK=15;
ANIMTYPE_BULDOZERUTOK=16;
ANIMTYPE_PHORORHLAVA=17;
ANIMTYPE_PHORORPIJE=18;
ANIMTYPE_TIGER_ATTACK=19;
ANIMTYPE_FROG_BLOW=20;
ANIMTYPE_FROG_ATTACK=21;
ANIMTYPE_NOBLE_ATTACK1=22;
ANIMTYPE_NOBLE_ATTACK2=23;
ANIMTYPE_NOBLE_ATTACK3=24;
ANIMTYPE_NOBLE_ATTACK4=25;
ANIMTYPE_PAKUN_ATTACK=26;
ANIMTYPE_PAKUN_ZERE=27;

SPECSOUND_MAKEINVISIBLE      = 0;
SPECSOUND_TELEPORTATION      = 1;
SPECSOUND_LIMTELEPORTATION   = 2;
SPECSOUND_APEMANATTACK       = 3;
SPECSOUND_TIGERSELECT        = 4;
SPECSOUND_TIGERATTACK        = 5;
SPECSOUND_VAKOMYSSELECT      = 6;
SPECSOUND_VAKOMYSDEATH       = 7;
SPECSOUND_MASTODONTATTACK    = 8;
SPECSOUND_EONSELECT          = 9;
SPECSOUND_EONWORK            = 10;
SPECSOUND_NOBLEATTACK        = 11;

SAILEVENT_UNITGOESTORED = 1;
SAILEVENT_UNITDESTROYED = 2;
SAILEVENT_UNITKAMIKAZED = 3;
SAILEVENT_UNITGOESTOSLEEP = 4;
SAILEVENT_VEHICLECONSTRUCTED = 5;
SAILEVENT_VEHICLECONSTRUCTIONSTARTED = 6;
SAILEVENT_WEAPONPLACED = 7;
SAILEVENT_BUILDINGCOMPLETE = 8;
SAILEVENT_UPGRADECOMPLETE = 9;
SAILEVENT_RESEARCHCOMPLETE = 10;
SAILEVENT_SIBDEPOSITCONTAMINATED = 11;
SAILEVENT_SIBERITEROCKETEXPLODED = 12;
SAILEVENT_VEHICLECAPTURED = 13;
SAILEVENT_BUILDINGCAPTURED = 14;
SAILEVENT_UNITTELEPORTED = 15;
SAILEVENT_DESTINATIONUNREACHABLE = 16;
SAILEVENT_APEMANTAMED = 17;
SAILEVENT_MASTODONTAMED = 18;
SAILEVENT_TIGERTAMED = 19;
SAILEVENT_SIBERITEDEPOSITDESTROYED = 20;
SAILEVENT_ENDTHEMISSIONRAISED = 21;
SAILEVENT_DIALOGUESKIPPED = 22;
SAILEVENT_SAILEVENT = 23;
SAILEVENT_MCDONE = 24;
SAILEVENT_DEINVISIBLED = 25;
SAILEVENT_HUMANDESTROYED = 26;
SAILEVENT_VEHICLEDESTROYED = 27;
SAILEVENT_ENTERBUILDING = 28;
SAILEVENT_LEAVEBUILDING = 29;
SAILEVENT_CONTACT = 30;
SAILEVENT_ACTIVEUNITCHANGED = 31;
SAILEVENT_MCREGISTRYRESULTCHANGES = 32;
SAILEVENT_MCDEFENDTAKESUNIT = 33;
SAILEVENT_MCDEFENDRETURNSUNIT = 34;
SAILEVENT_MCATTACKOUTOFFUEL = 35;
SAILEVENT_MCATTACKDONE = 36;
SAILEVENT_MCPATROLOUTOFFUEL = 37;
SAILEVENT_MCPATROLSEESENEMY = 38;
SAILEVENT_BUILDINGSTARTED = 39;
SAILEVENT_ARTIFACTRESEARCHCOMPLETE = 40;
SAILEVENT_ARTIFACTUSED = 41;
SAILEVENT_ARTIFACTLOADED = 42;
SAILEVENT_ARTIFACTUNLOADED = 43;
SAILEVENT_BEHEMOTHCONSTRUCTED = 44;
SAILEVENT_SPONTANEOUSTELEPORTED = 45;
SAILEVENT_SPECRESEARCHCOMPLETE = 46;
SAILEVENT_SPECRESEARCHCANCEL = 47;
SAILEVENT_COMMAND = 48;
SAILEVENT_MCSVEHICLEADDED = 49;
SAILEVENT_MCSNEEDCRATES = 50;
SAILEVENT_MCREPAIRTAKESUNIT = 51;
SAILEVENT_MCREPAIRRETURNSUNIT = 52;
SAILEVENT_MCREPAIRCAPTUREDVEHICLE = 53;
SAILEVENT_MCREPAIRSAVEDVEHICLE = 54;
SAILEVENT_MCWITHDRAWTAKESUNIT = 55;
SAILEVENT_MCWITHDRAWRETURNSUNIT = 56;
SAILEVENT_RESEARCHSTARTED = 57;
SAILEVENT_RESEARCHCANCEL = 58;
SAILEVENT_UNITGOESFROMRED = 59;
SAILEVENT_STARTHEAL = 60;
SAILEVENT_EVACUATEVEHICLE = 61;
SAILEVENT_DIPLOMACYCHANGED = 62;
SAILEVENT_UNITBURY = 63;
SAILEVENT_CUSTOMCOMMAND = 64;
SAILEVENT_ENTERVEHICLE = 65;
SAILEVENT_LEAVEVEHICLE = 66;
SAILEVENT_ENTERVEHICLEFROMBUILDING = 67;
SAILEVENT_CRATESPAWN          = 68;
SAILEVENT_VEHICLERECYCLED     = 69;
SAILEVENT_UNITDESTROYED_EXTRA = 70;
SAILEVENT_TARGETABLESAIL      = 71;
SAILEVENT_CAMERAPLACED        = 72;
SAILEVENT_OILEXTRACTED        = 73;
SAILEVENT_SIBEXTRACTED        = 74;
SAILEVENT_EVACUATEBUILDING    = 75;
SAILEVENT_COMMANDUNITXY       = 76;
SAILEVENT_TAKEMATERIALS       = 77;
SAILEVENT_CHANGEPROF          = 78;
SAILEVENT_SAILEVENTCUSTOM     = 79;
SAILEVENT_MAPSTART            = 80;
SAILEVENT_COMMPANELCOMMAND    = 81;
SAILEVENT_UPGRADESTARTED      = 82;

dxh = {[0]=0,[1]=1,[2]=1,[3]=0,[4]=-1,[5]=-1,[6]=0,};
dyh = {[0]=-1,[1]=0,[2]=1,[3]=1,[4]=0,[5]=-1,[6]=0,};

SETTING_ROCKET_RANGE               = 3;
SETTING_SPACESHIFITNG_RANGE        = 5;
SETTING_SPACESHIFITNG_THROW_DIST   = {[0]=10,[1]=9,[2]=8,[3]=6,[4]=4,[5]=2};
SETTING_TIMESHIFITNG_RANGE         = 5;
SETTING_TIMESHIFITNG_DURATION      = 200;
SETTING_KAMIKAZE_RANGE             = 4;
SETTING_SIBERITEEXPLOSION_DURATION = 125;
SETTING_SIBERITEEXPLOSION_DAMAGE   = {[1]=2000,[2]=20000,[3]=17000};
SETTING_MINE_RANGE                 = 3;

SETTING_CONTAMINATION_RANGE           = 10;
SETTING_CONTAMINATION_PERIOD          = 10;
SETTING_CONTAMINATION_EXPLOSIONDAMAGE = {[1]=1500,[2]=1200,[3]=900};

SETTING_CONTAMINATION_TEST_DAMAGE = {[1]=10,[2]=10,[3]=10};

CHASSIS_MASTODONT = 31;

CLASS_NOBLE = 11;
CLASS_APEMAN= 12;
CLASS_TIGER = 14;
CLASS_APEMAN_ENGINEER = 16;

ACT_NONE=0;--NOTHING
ACT_FORWARD_LEFT=1;--FORWARD_LEFT
ACT_FORWARD=2;--FORWARD
ACT_FORWARD_RIGHT=3;--FORWARD_RIGHT
ACT_BACK_RIGHT=4;--BACK_RIGHT
ACT_BACK=5;--BACK
ACT_BACK_LEFT=6;--BACK_LEFT
ACT_LEFT=7;--LEFT
ACT_RIGHT=8;--RIGHT
ACT_WAIT=9;--WAIT
ACT_CHANGE_TRACKS=10;--CHANGE_TRACKS
ACT_ANIMATE=11;--ANIMATE
ACT_FLY_UP=12;--FLY_UP
ACT_FLY_DOWN=13;--FLY_DOWN
ACT_HEAL=14;--HEAL
ACT_REPAIR_VEHICLE=15;--REPAIR_VEHICLE
ACT_UP=16;--UP
ACT_DOWN=17;--DOWN
ACT_BUILD=18;--CONSTRUCT_HIMSELF
ACT_HELP_BUILD=19;--HELP_TO_CONSTRUCT
ACT_REPAIR_BUILDING=20;--REPAIR_BUILDING
ACT_MATERIALIZE=21;--MATERIALIZE
ACT_CHANGE_CLASS=22;--REQUALIFY
ACT_FACTORY_CONSTRUCT=23;--CONSTRUCT_VEHICLE/TURRET
ACT_FACTORY_INSIDE=24;--CLEAN_ENTRANCE
ACT_FACTORY_LEAVE=25;--MOVE_OUT
ACT_RESEARCH=26;--RESEARCH
ACT_MINE=27;--MINE
ACT_MAKE_POWER=28;--MAKE_POWER
ACT_SUSPEND=29;--SUSPEND
ACT_STAND_BY=30;--STAND_BY
ACT_ON_HOLD=31;--ON_HOLD
ACT_ATTACK=32;--ATTACK
ACT_ATTACK_LEFT=33;--LEFT_AND_ATTACK
ACT_ATTACK_RIGHT=34;--RIGHT_AND_ATTACK
ACT_TAME=35;--TAME
ACT_CAPTURE=36;--CAPTURE
ACT_WAIT_FOR_WEAPON=37;--WAIT_FOR_WEAPON
ACT_PUSH_VEHICLE=38;--PUSH
ACT_BULLDOZER_FORWARD=39;
ACT_BULLDOZER_BACKWARDS=40;
ACT_PLACE_MINE=41;
ACT_MAKE_INVISIBLE=42;
ACT_INVISIBLE=43;
ACT_HACK=44;
ACT_SHIFT_UNIT=45;
ACT_TELEPORT_UNIT=46;
ACT_CONTAMINATE=47;
ACT_TELEPORT_RECHARGE=48;
ACT_PP_NO_OIL=49;--NO_OIL
ACT_DISMANTLE=50;
ACT_ENTER_FACTORY=51;
ACT_RECYCLE=52;
ACT_PLACE_BEHEMOTH=53;
ACT_WAIT_FOR_CONSTRUCTION=54;
ACT_SIBERITE_ROCKET_IGNITION=55;
ACT_EON=56;
ACT_BEHEMOTH_POWER_UP=57;
ACT_CUSTOM=58;
ACT_UNPLACED=59;
ACT_WAIT_FOR_MATERIAL=60;
ACT_LOOKAROUND=61;
ACT_ANIMATE_CUSTOM=62;--ANIMATE

SPEC_OIL=1;
SPEC_SIBERIUM=2;
SPEC_POWERHIGH=3;
SPEC_POWERMED=4;
SPEC_POWERLOW=5;
SPEC_POWERZERO=6;
SPEC_NEEDSCIENTIST=7;
SPEC_NEEDMECHANIC=8;
SPEC_NEEDEXTENSION=9;
SPEC_TELEPORTEXIT=10;
SPEC_TELEPORTEXITNOPLACED=11;
SPEC_VEHICLEINSIDE=12;
SPEC_NEEDAPEMAN=13;

WEAPONTYPE_LASER             = 8;
WEAPONTYPE_TIMESLOWDOWN      = 21;
WEAPONTYPE_SIBERITEEXPLOSION = 24;
WEAPONTYPE_DOUBLELASER2      = 28;
WEAPONTYPE_LUAWEAPON         = 32;

WEAPONTYPE_PRISM             = -100;
WEAPONTYPE_PRISM2            = -101;
WEAPONTYPE_TEST              = -102;

RVZD = OW_GET_RVZD();


WeaponList = {};
UNIT= nil; -- Will be filled with the unit who is shooting. Also will be returned at end.
WEAP_ID = -1;-- Will be filled with the lua weapon ID

BasicWeapon = {};
function BasicWeapon.make()
	return {doIdle = BasicWeapon.doIdle,doShoot = BasicWeapon.doShoot,doFireWeapon = BasicWeapon.doFireWeapon, 
	doDrawAttack = BasicWeapon.doDrawAttack, doAttack = BasicWeapon.doAttack, doProcessActivity = BasicWeapon.doProcessActivity,
	doUpdateParameters = BasicWeapon.doUpdateParameters,
	doAttack_MakeUnitList = BasicWeapon.doAttack_MakeUnitList, doAttack_MakeUnitListEX = BasicWeapon.doAttack_MakeUnitListEX};
end;

function BasicWeapon:doIdle()
	UNIT.SHOOTING_PHASE = 0;
end;

function BasicWeapon:doShoot(ATTACKTARGET, X, Y)
	UNIT.SHOOTING_PHASE = 1;
	OW_FIRE_WEAPON(X,Y,true);
	OW_WEAPON_SOUND();
end;

function BasicWeapon:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	OW_WEAPON_APPLY_ATTACK(1,1);
end;

function BasicWeapon:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
end;

function BasicWeapon:doAttack(TIME, X, Y, DIRECTION, DAMAGE)	
end;

function BasicWeapon:doProcessActivity()	
	return false;
end;

function BasicWeapon:doUpdateParameters() -- can be used to modify damage based on upgrades
end;



function BasicWeapon:doAttack_MakeUnitList(TIME, X, Y, DIRECTION, DAMAGE, FRIENDLYFIRE)	
	local XY = {};
	local d2 = math.mod(DIRECTION+5,6);
	
	XY[1] = {x=X,y=Y};
	XY[2] = {x=X+dxh[DIRECTION],y=Y+dyh[DIRECTION]};
	XY[3] = {x=X+dxh[d2],y=Y+dyh[d2]};
	
	local hx,hy,hex, j;
	local units = BasicList.make();
	
	for i=1,3 do
		hx,hy = XY[i].x,XY[i].y;
		hex = OW_GET_HEX(hx,hy);		
		
		if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) and (FRIENDLYFIRE or (hex.UNIT.ID ~= UNIT.ID)) then
			j = 1;
			while (j <= units.COUNT) and (units.LIST[j].ID ~= hex.UNIT.ID) do
				j = j + 1;
			end;
			
			if j > units.COUNT then
				units:add({ID=hex.UNIT.ID,AMOUNT=1});
			else
				if hex.UNIT.typ ~= TYPE_HUMAN then
					units.LIST[j].AMOUNT = units.LIST[j].AMOUNT+1;
				end;
			end;
		end;
	end;
	
	return units;
end;

function BasicWeapon:doAttack_MakeUnitListEX(TIME, XY, COUNT, DIRECTION, DAMAGE, FRIENDLYFIRE)
	local hx,hy,hex, j;
	local units = BasicList.make();
	
	for i=1,COUNT do
		hx,hy = XY[i].x,XY[i].y;
		hex = OW_GET_HEX(hx,hy);
		
		if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) and (FRIENDLYFIRE or (hex.UNIT.ID ~= UNIT.ID)) then
			j = 1;
			while (j <= units.COUNT) and (units.LIST[j].ID ~= hex.UNIT.ID) do
				j = j + 1;
			end;
			
			if j > units.COUNT then
				units:add({ID=hex.UNIT.ID,AMOUNT=1});
			else
				if hex.UNIT.typ ~= TYPE_HUMAN then
					units.LIST[j].AMOUNT = units.LIST[j].AMOUNT+1;
				end;
			end;
		end;
	end;
	
	return units;
end;

SpecialWeapon = {};
function SpecialWeapon.make()
	return {doAttack = SpecialWeapon.doAttack, doAttack_MakeUnitList = BasicWeapon.doAttack_MakeUnitList, doAttack_MakeUnitListEX = BasicWeapon.doAttack_MakeUnitListEX};
end;

function SpecialWeapon:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	OW_SET_SPECIAL_ATTACK_TIME(TIME-1);
end;

--OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, PROJECTILE, PALETTE, MODE, AFTER_MODE, Z_OFF, USE_SECOND_BARREL = FALSE, START_X = -1, START_Y = -1);
--Z_OFF = 75 

---------------------------
--WEAPONS--
---------------------------

Weap_Head_Melee = BasicWeapon.make();
function Weap_Head_Melee:doShoot(ATTACKTARGET, X, Y)
	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	
	local DA = WeaponList:getDefAttack();
	
	if UNIT.SHOOTING_PHASE == math.floor(DA.FIRING_TIME*7/10) then
		OW_FIRE_WEAPON(X,Y,UNIT.SHOOTING_PHASE==1);
	end;
end;

Weap_MachineGun = BasicWeapon.make();
function Weap_MachineGun:doShoot(ATTACKTARGET, X, Y)
	if UNIT.SHOOTING_PHASE == 0 then
		OW_WEAPON_SOUND();
	end;

	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	
	if math.mod(UNIT.SHOOTING_PHASE,4)==1 then
		OW_FIRE_WEAPON(X,Y,UNIT.SHOOTING_PHASE==1);
	end;
end;

Weap_Gun = BasicWeapon.make();
function Weap_Gun:doIdle()
	if UNIT.SHOOTING_PHASE > 0 then
		UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
		if UNIT.SHOOTING_PHASE > 12 then
			UNIT.SHOOTING_PHASE = 0;
		end;
	end;
end;

function Weap_Gun:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local sm = math.random(6);
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y);
	OW_REGISTER_ATTACK(tim,WEAPONTYPE_LUAWEAPON,X,Y,sm);
end;

function Weap_Gun:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local units = self:doAttack_MakeUnitList(TIME, X, Y, DIRECTION, DAMAGE, true);
	
	for i=1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/3,1);
	end;
	
	if WEAP_ID ~= 4 then
		OW_DRAW_EXPLOSION(X,Y,DIRECTION,EXPLOSION_CANNON_OR_BAZOOKA_IMPACT,1,0);
	end;
end;

function Weap_Gun:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	--OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, 8);
	--OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, 10);
	--OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, 7);
end;

Weap_Rifle = BasicWeapon.make();
function Weap_Rifle:doShoot(ATTACKTARGET, X, Y)
	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	local DA = WeaponList:getDefAttack();
	
	if UNIT.SHOOTING_PHASE == DA.FIRING_TIME-30 then
		if UNIT.USE_ATTACK == AA_SLEEP_ON then
			OW_CHANGE_ACTIVE_ATTACK(AA_SLEEP_ON);
		end;
		OW_FIRE_WEAPON(X,Y,true);
		OW_WEAPON_SOUND();
		UNIT.SHOOTING_PHASE = -30;
		if UNIT.USE_ATTACK == AA_SLEEP_ON then
			if (UNIT.TASKS.COUNT > 0) and (UNIT.TASKS[1].TYP == TASK_SOPORIFIC) then
				if ((ATTACKTARGET.TYP == TYPE_HUMAN) and (ATTACKTARGET.SLEPT > 0)) or ((ATTACKTARGET.TYP == TYPE_VEHICLE) and (ATTACKTARGET.DRIVER ~= nil) and (ATTACKTARGET.DRIVER.SLEPT > 0)) then
					OW_REMOVE_FIRST_TASK();
				end;
			end;
		
			OW_CHANGE_ACTIVE_ATTACK(AA_SLEEP_OFF);
		end;
	end;
end;

Weap_Bazooka = BasicWeapon.make();
Weap_Bazooka.doIdle = Weap_Gun.doIdle;
Weap_Bazooka.doFireWeapon = Weap_Gun.doFireWeapon;

function Weap_Bazooka:doShoot(ATTACKTARGET, X, Y)
	UNIT.SHOOTING_PHASE = 1;
	
	if UNIT.USE_ATTACK == AA_SPACESHIFTING then
		OW_CHANGE_ACTIVE_ATTACK(AA_SPACESHIFTING);
	elseif UNIT.USE_ATTACK == AA_TIMESHIFTING then
		OW_CHANGE_ACTIVE_ATTACK(AA_TIMESHIFTING);
	end;
	
	OW_FIRE_WEAPON(X,Y,true);
	OW_WEAPON_SOUND();
end;

function Weap_Bazooka:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	Weap_Gun:doAttack(TIME, X, Y, DIRECTION, DAMAGE);

	if isInArray(UNIT.USE_ATTACK,{AA_SPACESHIFTING,AA_TIMESHIFTING}) and not UNIT.KEEP_ATTACK_TYPE then
		if (UNIT.TASKS.COUNT > 0) and (isInArray(UNIT.TASKS[1].TYP,{TASK_SPACESHIFTING,TASK_TIMESHIFTING})) then
			OW_REMOVE_FIRST_TASK();
		end;
		
		OW_CHANGE_ACTIVE_ATTACK(1);
	end;
end;

function Weap_Bazooka:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
end;

Weap_Pistol = BasicWeapon.make();
function Weap_Pistol:doIdle()
	if UNIT.SHOOTING_PHASE == 1 then
		UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE +1
	else
		UNIT.SHOOTING_PHASE = 0;
	end;
end;

function Weap_Pistol:doShoot(ATTACKTARGET, X, Y)
	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	local DA = WeaponList:getDefAttack();
	
	if UNIT.SHOOTING_PHASE == DA.FIRING_TIME-10 then
		OW_FIRE_WEAPON(X,Y,true);
		OW_WEAPON_SOUND();
		UNIT.SHOOTING_PHASE = -10;
	end;
end;

Weap_Mortar = BasicWeapon.make();

function Weap_Mortar:doIdle()
	if UNIT.SHOOTING_PHASE > 0 then
		UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
		if UNIT.SHOOTING_PHASE > 20 then
			UNIT.SHOOTING_PHASE = 0;
		end;
	end;
end;

function Weap_Mortar:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
end;

function Weap_Mortar:getsm()
	if OW_GET_UPGRADE_VALUE(UPG_MORTARACCURACY,UNIT.SIDE) > 0 then
		return 6
	else 
		return math.random(7);
	end;
end;

function Weap_Mortar:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local sm = self:getsm();
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y);
	if OW_INVALID_HEX(X+dxh[sm],Y+dyh[sm]) then
		sm = 6;
	end;
	OW_REGISTER_ATTACK(tim*3,WEAPONTYPE_LUAWEAPON,X+dxh[sm],Y+dyh[sm],6);
end;

function Weap_Mortar:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local hx,hy,hex, j;
	local units = BasicList.make();
	
	for i=1,6 do
		hx,hy = X+dxh[i],Y+dyh[i];
		hex = OW_GET_HEX(hx,hy);		
		
		if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) then
			j = 1;
			while (j <= units.COUNT) and (units.LIST[j].ID ~= hex.UNIT.ID) do
				j = j + 1;
			end;
			
			if j > units.COUNT then
				units:add({ID=hex.UNIT.ID,AMOUNT=1});
			else
				if hex.UNIT.typ ~= TYPE_HUMAN then
					units.LIST[j].AMOUNT = units.LIST[j].AMOUNT+1;
				end;
			end;
		end;
	end;
	
	for i=1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/6,1);
	end;
end;

Weap_RocketLauncher = BasicWeapon.make();
function Weap_RocketLauncher:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local sm = math.random(6);
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y);
	OW_REGISTER_ATTACK(tim*2,WEAPONTYPE_LUAWEAPON,X,Y,sm);
end;

function Weap_RocketLauncher:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
    --OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
    OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, 1, 0, 10, 4, 0);
end;

function Weap_RocketLauncher:getAmount(R)
	return math.round(100*(SETTING_ROCKET_RANGE-R)/(SETTING_ROCKET_RANGE));
end;

function Weap_RocketLauncher:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local hx,hy,hex, j;
	local units = BasicList.make();
	
	hex = OW_GET_HEX(X,Y);
	
	if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) then
		units:add({ID=hex.UNIT.ID,AMOUNT=100});
	end;
	
	for i=1,SETTING_ROCKET_RANGE do
		hx,hy = X+dxh[4]*i,Y+dyh[4]*i;
		hex = OW_GET_HEX(hx,hy);

		for dir = 0, 5 do
			for d = 1, i do
				if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) then
					j = 1;
					while (j <= units.COUNT) and (units.LIST[j].ID ~= hex.UNIT.ID) do
						j = j + 1;
					end;
			
					if j > units.COUNT then
						units:add({ID=hex.UNIT.ID,AMOUNT=self:getAmount(i)});
					else
						if hex.UNIT.typ ~= TYPE_HUMAN then
							units.LIST[j].AMOUNT = units.LIST[j].AMOUNT+self:getAmount(i);
						end;
					end;
				end;
				hx = hx+dxh[dir];
				hy = hy+dyh[dir];
			end;
		end;
	end;
	
	for i=1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/100,1);
	end;
end;

Weap_Laser = BasicWeapon.make();
function Weap_Laser:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y);
	OW_REGISTER_ATTACK(3+math.floor(tim/3),WEAPONTYPE_LUAWEAPON,X,Y,6);
end;

function Weap_Laser:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
end;

function Weap_Laser:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local hex;
	hex = OW_GET_HEX(X,Y);
	
	if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) then
		if hex.UNIT.typ ~= TYPE_HUMAN then
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1,1);
		else
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1/3,1);
		end;
	end;
end;

Weap_MultiArrow = BasicWeapon.make();
function Weap_MultiArrow:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local bt= OW_GET_BALISTA_TARGETS(UNIT.XS,UNIT.YS,X,Y);
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y);
	
	for i=1,5 do
		if bt[i].X >= 0 then
			OW_REGISTER_ATTACK(tim*3,WEAPONTYPE_LUAWEAPON,bt[i].X,bt[i].Y,bt[i].SM);
		end;
	end;
end;

function Weap_MultiArrow:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
end;

function Weap_MultiArrow:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local hex;
	
	if DIRECTION == 6 then
		local units = self:doAttack_MakeUnitList(TIME, X, Y, DIRECTION, DAMAGE, true);
		for i=1,units.COUNT do
			OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/3,1);
		end;
	else
		hex = OW_GET_HEX(X,Y);
		if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) and (UNIT.ID ~= hex.UNIT.ID) then
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1,1);
		end;
	end;
end;

Weap_Flame = BasicWeapon.make();
function Weap_Flame:doShoot(ATTACKTARGET, X, Y)
	if UNIT.SHOOTING_PHASE == 0 then
		OW_WEAPON_SOUND();
	end;
	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	
	if math.mod(UNIT.SHOOTING_PHASE,2) == 0 then
		OW_FIRE_WEAPON(X,Y,UNIT.SHOOTING_PHASE==1);
	end;
end;

Weap_Flame.variation = {[0]=6,[1]=0,[2]=1,[3]=2,[4]=3,[5]=4,[6]=5,[7]=6,[8]=6,[9]=6};

function Weap_Flame:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y)*4+10;	
	local sm = OW_GET_DIRECTION(UNIT.XS,UNIT.YS,X,Y);	
	
	OW_REGISTER_ATTACK(tim,WEAPONTYPE_LUAWEAPON,X,Y,sm);
end;

function Weap_Flame:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(math.floor((TIME*5)/4), X, Y, DIRECTION, WEAP_ID);
end;

function Weap_Flame:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local hex;
	
	if TIME <= 2 then
		self.variation[0] = 6;
	else
		self.variation[0] = DIRECTION;
	end;
	
	local DIR = self.variation[math.random(10)];
	
	local HX,HY = X+dxh[DIR],Y+dyh[DIR];
	
	hex = OW_GET_HEX(HX,HY);
	
	if OW_VALID_HEX(HX,HY) then
		if (hex.UNIT ~= nil) and (UNIT.ID ~= hex.UNIT.ID) then
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1,1);
		end;
	
		local CanRemoveTask = (hex.ENV ~= nil) and (UNIT.ATTACK_TARGET == nil);
	
		if OW_CAN_BE_BURNED(HX,HY) then
			OW_BURN_ENVIRONMENT(HX,HY);
		else
			OW_DESTROY_ENVIRONMENT(HX,HY);
		end;
	
		hex = OW_GET_HEX(HX,HY);
	
		if CanRemoveTask and (hex.ENV == nil) then
			OW_REMOVE_FIRST_TASK();
		end;
	
		OW_CUT_HEX_GRASS(HX,HY,5);
		OW_CHANGE_SHADE_HEX_GRASS(HX,HY,-200);	
	end;
end;

Weap_Melee = BasicWeapon.make();
function Weap_Melee:doIdle()
	if UNIT.SHOOTING_PHASE > 0 then
		if UNIT.TYP == TYPE_VEHICLE then
			OW_WEAPON_SOUND_STOP();
		end;
	end;
	UNIT.SHOOTING_PHASE = 0;
end;

function Weap_Melee:doShoot(ATTACKTARGET, X, Y)
	if UNIT.SHOOTING_PHASE == 0 then
		OW_WEAPON_SOUND();
	end;
	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	
	if math.mod(UNIT.SHOOTING_PHASE,4) == 1 then
		OW_FIRE_WEAPON(X,Y,UNIT.SHOOTING_PHASE==1);
	end;
end;

function Weap_Melee:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	OW_WEAPON_APPLY_ATTACK(1,1);
	
	if FIRST then
		local DA = WeaponList:getDefAttack();
		local t  = DA.AIMING_TIME+DA.FIRING_TIME;
	
		if unitIsMastodont(UNIT) then
			setUnitAnimate(ANIMTYPE_MASTODONT_ATTACK,t);
			if not OW_IS_UNIT_SPEC_SOUND_PLAYING() then
				OW_UNIT_PLAY_SPEC_SOUND(SPECSOUND_MASTODONTATTACK);
			end;
		elseif unitIsTiger(UNIT) then
			setUnitAnimate(ANIMTYPE_TIGER_ATTACK,t);
			
			UNIT.WEAPON_DIR = OW_GET_DIRECTION(UNIT.XS,UNIT.YS,X,Y)-UNIT.DIR;
			if UNIT.WEAPON_DIR > 1 then
				UNIT.WEAPON_DIR = UNIT.WEAPON_DIR - 6;
			end;
			if UNIT.WEAPON_DIR < -2 then
				UNIT.WEAPON_DIR = 0;
			end;
			
			OW_UNIT_PLAY_SPEC_SOUND(SPECSOUND_TIGERATTACK);
		elseif unitIsMeleeApe(UNIT) then
			setUnitAnimate(ANIMTYPE_APE_ATTACK,t);
			OW_UNIT_PLAY_SPEC_SOUND(SPECSOUND_APEMANATTACK);
		elseif unitIsNoble(UNIT) then
			setUnitAnimate(ANIMTYPE_NOBLE_ATTACK1+math.random(4),20);
			OW_UNIT_PLAY_SPEC_SOUND(SPECSOUND_NOBLEATTACK);
		end;
	end;
end;

Weap_Bulldozer = BasicWeapon.make();
Weap_Bulldozer.doIdle = Weap_Melee.doIdle;

function Weap_Bulldozer:doShoot(ATTACKTARGET, X, Y)
	local DA = WeaponList:getDefAttack();

	if UNIT.SHOOTING_PHASE == 0 then
		OW_ENGINE_SOUND();
	end;
	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	
	local hex = OW_GET_HEX(UNIT.ATTACK_SITE_X,UNIT.ATTACK_SITE_Y);
	
	if (math.mod(UNIT.SHOOTING_PHASE,4) == 1) and ((UNIT.ATTACK_TARGET ~= nil) or (hex.ENV ~= nil)) then
		OW_FIRE_WEAPON(X,Y,UNIT.SHOOTING_PHASE==1);
	end;
	
	if (UNIT.SHOOTING_TICK == math.floor(DA.FIRING_TIME/4)) then	
		if (hex.ENV ~= nil) then
			OW_DESTROY_ENVIRONMENT(UNIT.ATTACK_SITE_X,UNIT.ATTACK_SITE_Y);
		end;
		
		if (UNIT.TASKS.COUNT > 0) and (UNIT.TASKS[1].TYP == TASK_ATTACK_PLACE) and (UNIT.TASKS[1].X == UNIT.ATTACK_SITE_X) and (UNIT.TASKS[1].Y == UNIT.ATTACK_SITE_Y) then
			OW_REMOVE_FIRST_TASK();
		end;	
	end;
end;

function Weap_Bulldozer:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local sm = UNIT.DIR;
	
	local nx,ny = UNIT.XS+2*dxh[sm],UNIT.YS+2*dyh[sm];	
	OW_REGISTER_ATTACK(1,WEAPONTYPE_LUAWEAPON,nx,ny,sm);

	if FIRST then
		local DA = WeaponList:getDefAttack();
	
		UNIT.ACTIVITY     = ACT_BULLDOZER_FORWARD;
		UNIT.PHASE        = 1;
		UNIT.PHASE_COUNT  = DA.FIRING_TIME;
		UNIT.NEW_ACTIVITY = true;
	end;
end;

function Weap_Bulldozer:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local XY = {};
	XY[1] = {x=X,y=Y};
	XY[2] = {x=X+dxh[math.mod(DIRECTION+2,6)],y=Y+dyh[math.mod(DIRECTION+2,6)]};
	XY[3] = {x=X+dxh[math.mod(DIRECTION+4,6)],y=Y+dyh[math.mod(DIRECTION+4,6)]};

	local units = self:doAttack_MakeUnitListEX(TIME, XY, 3, DIRECTION, DAMAGE, true);
	
	for i=1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,1,1);
	end;
end;

Weap_SpaceShifting              = BasicWeapon.make();
Weap_SpaceShifting.doIdle       = Weap_Bazooka.doIdle;
Weap_SpaceShifting.doFireWeapon = Weap_Bazooka.doFireWeapon;
Weap_SpaceShifting.doShoot      = Weap_Bazooka.doShoot;
Weap_SpaceShifting.doDrawAttack = Weap_Bazooka.doDrawAttack;

function Weap_SpaceShifting:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local units   = OW_GET_UNITS_WITHIN_RANGE(SETTING_SPACESHIFITNG_RANGE,X,Y);
	local upgrade = OW_GET_UPGRADE_VALUE(UPG_SPACESHIFTINGDISTANCE,UNIT.SIDE);
	local dir,target;
	
	for i=1,units.COUNT do		
		target = units.UNITS[i];
		
		if target.DISTANCE <= 0 then
			dir = math.random(6);
		else
			dir = OW_GET_DIRECTION(X,Y,target.XS,target.YS);
		end;
		
		OW_SPACESHIFT_UNIT(target.ID,math.floor(SETTING_SPACESHIFITNG_THROW_DIST[target.DISTANCE]*upgrade/100),dir)
	end;
end;

Weap_TimeShifting              = BasicWeapon.make();
Weap_TimeShifting.doIdle       = Weap_Bazooka.doIdle;
Weap_TimeShifting.doFireWeapon = Weap_Bazooka.doFireWeapon;
Weap_TimeShifting.doShoot      = Weap_Bazooka.doShoot;
Weap_TimeShifting.doDrawAttack = Weap_Bazooka.doDrawAttack;

function Weap_TimeShifting:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local upgrade  = OW_GET_UPGRADE_VALUE(UPG_TAURAD,UNIT.SIDE);	
	local duration = math.floor(SETTING_TIMESHIFITNG_DURATION*upgrade/100);
	local range    = math.floor(SETTING_TIMESHIFITNG_RANGE*upgrade/100);
	
	OW_REGISTER_SPECIAL_ATTACK(duration,WEAPONTYPE_TIMESLOWDOWN,X,Y,0,range);
	OW_REGISTER_TIMESHIFTING(X,Y,range);
end;

Weap_DoubleLaser          = BasicWeapon.make();
Weap_DoubleLaser.doAttack = Weap_Laser.doAttack;

function Weap_DoubleLaser:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local tim = 10;
	DMG = {};
	DMG[1] = UNIT.DAMAGE[1]*4;
	DMG[2] = UNIT.DAMAGE[2]*4;
	DMG[3] = UNIT.DAMAGE[3]*4;
	OW_REGISTER_ATTACK_EX(10,WEAPONTYPE_LUAWEAPON,X,Y,6,DMG);
end;

function Weap_DoubleLaser:doShoot(ATTACKTARGET, X, Y)
end;

function Weap_DoubleLaser:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
end;

function Weap_DoubleLaser:doProcessActivity()

	local DA = WeaponList:getDefAttack();	
	local AT = nil;
	
	if not OW_GET_STOP_ACTION() and OW_UNIT_READY_FOR_FIRE() and (UNIT.WEAPON_LOADED == 0) and ((math.mod(UNIT.ID+OW_GET_TICK(),DA.AIMING_TIME2) == 0)) then
		AT = OW_UNIT_SELECT_ATTACK_TARGET();
	end;
	
	if (AT ~= nil) and OW_UNIT_TARGET_IN_RANGE() then
		OW_FIRE_WEAPON(AT.XS,AT.YS,true,WEAPONTYPE_DOUBLELASER2);
	end;
	
	UNIT.ATTACK_TARGET = 0;

	return true;
end;

Weap_DoubleLaser2              = BasicWeapon.make();
Weap_DoubleLaser2.doAttack     = Weap_DoubleLaser.doAttack;
Weap_DoubleLaser2.doFireWeapon = Weap_DoubleLaser.doFireWeapon;

function Weap_DoubleLaser2:doShoot(ATTACKTARGET, X, Y)
end;

function Weap_DoubleLaser2:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
end;

Weap_Kamikaze = BasicWeapon.make();

function Weap_Kamikaze:doUpdateParameters() -- can be used to modify damage based on upgrades
	local upg = OW_GET_UPGRADE_VALUE(UPG_EXPLOSIVESSTRENGTH,UNIT.SIDE)/100;
	for i=1,3 do
		UNIT.DAMAGE[i] = math.floor(UNIT.DAMAGE[i]*upg);
	end;
end;

function Weap_Kamikaze:doShoot(ATTACKTARGET, X, Y)
	OW_WEAPON_SOUND();
	UNIT.SHOOTING_PHASE = UNIT.SHOOTING_PHASE + 1;
	OW_FIRE_WEAPON(X,Y,UNIT.SHOOTING_PHASE == 1);
end;

function Weap_Kamikaze:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	OW_REGISTER_ATTACK(1,WEAPONTYPE_LUAWEAPON,X,Y,6);
end;

function Weap_Kamikaze:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local prange = 0;
	if UNIT.typ == TYPE_VEHICLE then
		prange = 1;
	end;
	
	local hx,hy,hex;
	local units = BasicList.make();
	
	for vzd = 1+prange, SETTING_KAMIKAZE_RANGE+prange do
		hx,hy = X+dxh[4]*vzd, Y+dyh[4]*vzd;
		for dir = 0,5 do
			for i = 1,vzd do
				if OW_VALID_HEX(hx,hy) then
					if UNIT.typ == TYPE_VEHICLE then
						if vzd <= 3 then
							OW_DESTROY_ENVIRONMENT(hx,hy);
						else
							OW_BURN_ENVIRONMENT(hx,hy);
						end;
					end;
					
					hex = OW_GET_HEX(hx,hy);
					if (hex.UNIT ~= nil) and (hex.UNIT.ID ~= UNIT.ID) then
						j = 1;
						while (j <= units.COUNT) and (units.LIST[j].ID ~= hex.UNIT.ID) do
							j = j + 1;
						end;
			
						if j > units.COUNT then
							units:add({ID=hex.UNIT.ID,AMOUNT=math.round(100*(SETTING_KAMIKAZE_RANGE-vzd+1+prange)/SETTING_KAMIKAZE_RANGE)});
						else
							if hex.UNIT.typ ~= TYPE_HUMAN then
								units.LIST[j].AMOUNT = units.LIST[j].AMOUNT+math.round(100*(SETTING_KAMIKAZE_RANGE-vzd+1+prange)/SETTING_KAMIKAZE_RANGE);
							end;
						end;
					end;
				end;
				hx = hx + dxh[dir];
				hy = hy + dyh[dir];
			end;			
		end;
	end;
	
	for i = 1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/100,1/2);
	end;
	
	OW_HEX_EXPLOSION_EFFECT(X,Y);
	OW_DRAW_EXPLOSION(X,Y,6,EXPLOSION_MINE,1,0);
	OW_SAILEVENT1(SAILEVENT_UNITKAMIKAZED,UNIT.ID);
	OW_DESTROY_UNIT(UNIT.ID);
end;

Weap_SiberiteRocket = BasicWeapon.make();

function Weap_SiberiteRocket:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAP_ID);
end;

function Weap_SiberiteRocket:doShoot(ATTACKTARGET, X, Y)
	UNIT.ACTIVITY          = ACT_ANIMATE;
	UNIT.ACTIVITY_TARGET_X = X;
	UNIT.ACTIVITY_TARGET_Y = Y;
	UNIT.PHASE             = 1;
	UNIT.PHASE_COUNT       = 20;
	UNIT.NEW_ACTIVITY      = true;
	OW_WEAPON_SOUND();	
	if (UNIT.TASKS.COUNT > 0) and isInArray(UNIT.TASKS[1].TYP,{TASK_ATTACK,TASK_ATTACK_PLACE}) then
		OW_REMOVE_FIRST_TASK();
	end;
end;

function Weap_SiberiteRocket:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local sm = math.random(6);
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y)*2;
	OW_REGISTER_ATTACK(tim,WEAPONTYPE_LUAWEAPON,X,Y,sm);
end;

function Weap_SiberiteRocket:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	OW_REGISTER_SPECIAL_ATTACK_EX(SETTING_SIBERITEEXPLOSION_DURATION,WEAPONTYPE_SIBERITEEXPLOSION,X,Y,0,0,SETTING_SIBERITEEXPLOSION_DAMAGE);
	if UNIT.ID > 0 then
		OW_SAILEVENT3(SAILEVENT_UNITKAMIKAZED,UNIT.ID,X,Y);
	end;
end;

Weap_Dismantle = BasicWeapon.make();

function Weap_Dismantle:doUpdateParameters() -- can be used to modify damage based on upgrades
	UNIT.DAMAGE = OW_GET_HUMAN_DISMANTLE_DAMAGE(); -- note: returns 0's for damage if its not a human
end;

function Weap_Dismantle:doShoot(ATTACKTARGET, X, Y)
	UNIT.SHOOTING_PHASE = 1;
	OW_FIRE_WEAPON(X,Y,true);
end;

function Weap_Dismantle:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	OW_WEAPON_APPLY_ATTACK(1,0.5);
end;

Weap_RifleLaser = BasicWeapon.make();
Weap_RifleLaser.doShoot      = Weap_Rifle.doShoot;
Weap_RifleLaser.doFireWeapon = Weap_Laser.doFireWeapon;
Weap_RifleLaser.doAttack     = Weap_Laser.doAttack;

function Weap_RifleLaser:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAPONTYPE_LASER);
end;

--[[
 WEAPON REPAIR
--]]

Weap_Repair = BasicWeapon.make();

function Weap_Repair:doShoot(ATTACKTARGET, X, Y)
end;

function Weap_Repair:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
end;

function Weap_Repair:doProcessActivity()

	local DA = WeaponList:getDefAttack();
	local T = nil;
	
	local ATT = OW_GET_ATTITUDES();
	
	local BEST = nil;
	
	local units = OW_GET_UNITS_WITHIN_RANGE(5,UNIT.XS,UNIT.YS);
	
	for i=1,units.COUNT do
		T = OW_GET_UNIT(units.UNITS[i].ID);
		
		if (T.HEALTH < T.MAXHEALTH) and (ATT[T.SIDE][UNIT.SIDE] == ATT_FRIEND) and isInArray(T.TYP,{TYPE_VEHICLE,TYPE_BUILDING}) then			
			if (BEST == nil) or (T.MAXHEALTH-T.HEALTH) > BEST.MAXHEALTH-BEST.HEALTH then
				BEST = T;
			end;
		end;
	end;
	
	local dorepair = not OW_GET_STOP_ACTION() and OW_UNIT_READY_FOR_FIRE_IGNORE_NONCOMBAT() and (UNIT.WEAPON_LOADED == 0) and ((math.mod(UNIT.ID+OW_GET_TICK(),DA.AIMING_TIME2) == 0));
	
	if BEST ~= nil then
		if dorepair then
			OW_SET_UNIT_HEALTH(BEST.ID,BEST.HEALTH+20);
			OW_FIRE_WEAPON_EX(BEST.ID,BEST.XS,BEST.YS,true);
		end;
		
		if UNIT.ACTIVITY == ACT_REPAIR_BUILDING then		
			UNIT.PHASE = UNIT.PHASE + 1;
			if UNIT.PHASE > UNIT.PHASE_COUNT then
				UNIT.PHASE = UNIT.PHASE_COUNT;
			end;
		elseif not isInArray(UNIT.ACTIVITY,{ACT_FORWARD_LEFT,ACT_FORWARD,ACT_FORWARD_RIGHT,ACT_BACK_RIGHT,ACT_BACK,ACT_BACK_LEFT,ACT_LEFT,ACT_RIGHT})  then
			UNIT.ACTIVITY        = ACT_REPAIR_BUILDING;
			UNIT.PHASE           = 1;
			UNIT.PHASE_COUNT     = 50;
			UNIT.NEW_ACTIVITY    = true;
			UNIT.ACTIVITY_TARGET = 0;
		end;
	elseif UNIT.ACTIVITY == ACT_REPAIR_BUILDING then
		UNIT.ACTIVITY        = ACT_NONE;
		UNIT.PHASE           = 1;
		UNIT.PHASE_COUNT     = 1;
		UNIT.NEW_ACTIVITY    = true;
		UNIT.ACTIVITY_TARGET = 0;
	end;
	
	UNIT.ATTACK_TARGET = 0;

	return true;
end;

--[[
 WEAPON VEHICLE REPAIR MODULE
--]]

Weap_VehicleRepairModule = BasicWeapon.make();

function Weap_VehicleRepairModule:doShoot(ATTACKTARGET, X, Y)
end;

function Weap_VehicleRepairModule:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
end;

function Weap_VehicleRepairModule:doProcessActivity()

	local DA = WeaponList:getDefAttack();
	local T = nil;
	
	local ATT = OW_GET_ATTITUDES();
	
	local BEST = nil;
	
	local units = OW_GET_UNITS_WITHIN_RANGE(5,UNIT.XS,UNIT.YS);
	
	for i=1,units.COUNT do
		T = OW_GET_UNIT(units.UNITS[i].ID);
		
		if (T.HEALTH < T.MAXHEALTH) and (ATT[T.SIDE][UNIT.SIDE] == ATT_FRIEND) and T.TYP == TYPE_VEHICLE then			
			if (BEST == nil) or (T.MAXHEALTH-T.HEALTH) > BEST.MAXHEALTH-BEST.HEALTH then
				BEST = T;
			end;
		end;
	end;
	
	local dorepair = not OW_GET_STOP_ACTION() and OW_UNIT_READY_FOR_FIRE_IGNORE_NONCOMBAT() and (UNIT.WEAPON_LOADED == 0) and ((math.mod(UNIT.ID+OW_GET_TICK(),DA.AIMING_TIME2) == 0));
	
	if BEST ~= nil then
		if dorepair then
			OW_SET_UNIT_HEALTH(BEST.ID,BEST.HEALTH+20);
			OW_FIRE_WEAPON_EX(BEST.ID,BEST.XS,BEST.YS,true);
		end;
		
		if UNIT.ACTIVITY == ACT_REPAIR_BUILDING then		
			UNIT.PHASE = UNIT.PHASE + 1;
			if UNIT.PHASE > UNIT.PHASE_COUNT then
				UNIT.PHASE = UNIT.PHASE_COUNT;
			end;
		elseif not isInArray(UNIT.ACTIVITY,{ACT_FORWARD_LEFT,ACT_FORWARD,ACT_FORWARD_RIGHT,ACT_BACK_RIGHT,ACT_BACK,ACT_BACK_LEFT,ACT_LEFT,ACT_RIGHT})  then
			UNIT.ACTIVITY        = ACT_REPAIR_BUILDING;
			UNIT.PHASE           = 1;
			UNIT.PHASE_COUNT     = 50;
			UNIT.NEW_ACTIVITY    = true;
			UNIT.ACTIVITY_TARGET = 0;
		end;
	elseif UNIT.ACTIVITY == ACT_REPAIR_BUILDING then
		UNIT.ACTIVITY        = ACT_NONE;
		UNIT.PHASE           = 1;
		UNIT.PHASE_COUNT     = 1;
		UNIT.NEW_ACTIVITY    = true;
		UNIT.ACTIVITY_TARGET = 0;
	end;
	
	UNIT.ATTACK_TARGET = 0;

	return true;
end;

--[[
 WEAPON PRISM
--]]

Weap_Prism = BasicWeapon.make();
function Weap_Prism:doFireWeapon(ATTACKTARGET, X, Y, FIRST)
	local tim = OW_DISTANCE(UNIT.XS,UNIT.YS,X,Y);
	OW_REGISTER_ATTACK(3+math.floor(tim/3),WEAPONTYPE_PRISM,X,Y,6);
end;

function Weap_Prism:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAPONTYPE_LASER, false, STARTX, STARTY);
end;

function Weap_Prism:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local hex;
	hex = OW_GET_HEX(X,Y);
	   local T = nil;
	
	local ATT = OW_GET_ATTITUDES();
	
	if OW_VALID_HEX(X,Y) and (hex.UNIT ~= nil) then
		if hex.UNIT.typ ~= TYPE_HUMAN then
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1,1);
		else
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1/3,1);
		end;
		
		local units = OW_GET_UNITS_WITHIN_RANGE(4,X,Y);
		local u;
		
		for i = 1,units.COUNT do
			u = units.UNITS[i];
			T = OW_GET_UNIT(u.ID);
			if u.ID ~= hex.UNIT.ID and (ATT[T.SIDE][UNIT.SIDE] ~= ATT_FRIEND) then
				OW_REGISTER_ATTACK(3+math.floor(u.DISTANCE/3),WEAPONTYPE_PRISM2,u.XS,u.YS,6,X,Y);
			end;
		end;

---		OW_REGISTER_SPECIAL_ATTACK_EX(35*5,WEAPONTYPE_TEST,X,Y,6,0,SETTING_CONTAMINATION_TEST_DAMAGE,UNIT.ID); -- contamination test
	end;
end;

Weap_Prism2              = BasicWeapon.make();
Weap_Prism2.doFireWeapon = Weap_Laser.doFireWeapon;
Weap_Prism2.doAttack     = Weap_Laser.doAttack;

function Weap_Prism2:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAPONTYPE_LASER, false, STARTX, STARTY);
end;

SpecWeap_Mine = SpecialWeapon.make();
function SpecWeap_Mine:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local side, unitid = 0, 0;
	if (UNIT.ID ~= nil) then
		side   = UNIT.SIDE;
		unitid = UNIT.ID;
	end;	
	
	local upgrade = OW_GET_UPGRADE_VALUE(UPG_EXPLOSIVESSTRENGTH,side);
	
	for i=1,3 do
		DAMAGE[i] = DAMAGE[i]*upgrade;
	end;
	
	local hx,hy,hex;
	local units = BasicList.make();
	
	if OW_VALID_HEX(X,Y) then
		hex = OW_GET_HEX(X,Y);
		if (hex.UNIT ~= nil) then
			units:add({ID=hex.UNIT.ID,AMOUNT=100});
		end;
	end;
	
	for vzd = 1, SETTING_MINE_RANGE do
		hx,hy = X+dxh[4]*vzd, Y+dyh[4]*vzd;
		for dir = 0,5 do
			for i = 1,vzd do
				if OW_VALID_HEX(hx,hy) then
					if vzd == 1 then
						OW_DESTROY_ENVIRONMENT(hx,hy);
					end;
					
					hex = OW_GET_HEX(hx,hy);
					if (hex.UNIT ~= nil) then
						j = 1;
						while (j <= units.COUNT) and (units.LIST[j].ID ~= hex.UNIT.ID) do
							j = j + 1;
						end;
			
						if j > units.COUNT then
							units:add({ID=hex.UNIT.ID,AMOUNT=math.round(100*(SETTING_MINE_RANGE-vzd+1)/SETTING_MINE_RANGE)});
						else
							if hex.UNIT.typ ~= TYPE_HUMAN then
								units.LIST[j].AMOUNT = units.LIST[j].AMOUNT+math.round(100*(SETTING_MINE_RANGE-vzd+1)/SETTING_MINE_RANGE);
							end;
						end;
					end;
				end;
				hx = hx + dxh[dir];
				hy = hy + dyh[dir];
			end;			
		end;
	end;
	
	for i = 1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/100,1/3,unitid);
	end;
	
	OW_HEX_EXPLOSION_EFFECT(X,Y);
	OW_DRAW_EXPLOSION(X,Y,6,EXPLOSION_MINE,1,0);
	
	OW_SET_SPECIAL_ATTACK_TIME(0);
end;

--[[
 SPECIALWEAPON CONTAMINATION
--]]

SpecWeap_Contamination = SpecialWeapon.make();
function SpecWeap_Contamination:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	TIME = TIME-1;
	
	local units = OW_GET_UNITS_WITHIN_RANGE(100,X,Y);
	local unit, vzd, T;	
	local hex;
	
	if (TIME > 0) then
		for i = 1,units.COUNT do
			unit = units.UNITS[i];
			vzd  = math.floor(RVZD[X-unit.XS][Y-unit.YS] / 86);
			if (vzd <= SETTING_CONTAMINATION_RANGE) and (math.mod(unit.ID+OW_GET_TICK(),SETTING_CONTAMINATION_PERIOD) == 0) then
				if (vzd == 0) then
					vzd = 1;
				end;
				--TODO: Disable Exclamations
				OW_WEAPON_APPLY_ATTACK_EX(unit.ID,DAMAGE,(SETTING_CONTAMINATION_RANGE-vzd+1)/(SETTING_CONTAMINATION_RANGE+1),1);
				--TODO: Enable Exclamations
				--TODO: ProcessExclamation ex_deposit_contaminated
			end;
		end;
	else
		for i = 1,units.COUNT do
			unit = units.UNITS[i];
			vzd  = unit.DISTANCE;
			T    = OW_GET_UNIT(unit.ID);
			if (vzd <= SETTING_CONTAMINATION_RANGE) and (isInArray(T.TYP,{TYPE_VEHICLE,TYPE_BUILDING}) or (T.INSIDE_UNIT == nil)) then
				if (vzd == 0) then
					vzd = 1;
				end;
				--TODO: Disable Exclamations
				OW_WEAPON_APPLY_ATTACK_EX(unit.ID,SETTING_CONTAMINATION_EXPLOSIONDAMAGE,(SETTING_CONTAMINATION_RANGE-vzd+1)/(SETTING_CONTAMINATION_RANGE+1),1);
				--TODO: Enable Exclamations
			end;
			
			if (vzd <= SETTING_CONTAMINATION_RANGE*2) then
				--TODO: ProcessExclamation ex_deposit_destroyed
			end;
		end;
		OW_DESTROY_SOURCE(X,Y,SPEC_SIBERIUM);
		OW_SAILEVENT2(SAILEVENT_SIBERITEDEPOSITDESTROYED,X,Y);
		
		hex = OW_GET_HEX(X,Y);
		if (hex.UNIT ~= nil) then
			OW_SET_UNIT_HEALTH(hex.UNIT.ID,0);
		end;
	end;
	
	if OW_GET_SOURCE(X,Y,-1) ~= SPEC_SIBERIUM then
		TIME = 0;
	end;
	
	OW_SET_SPECIAL_ATTACK_TIME(TIME);
end;

--[[
 SPECIALWEAPON CONTAMINATION TEST
--]]

SpecWeap_Contamination_Test = SpecialWeapon.make();
function SpecWeap_Contamination_Test:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	TIME = TIME-1;
	
	local units = OW_GET_UNITS_WITHIN_RANGE(SETTING_CONTAMINATION_RANGE,X,Y);
	local unit, vzd, T;	
	local hex;
	
	for i = 1,units.COUNT do
		unit = units.UNITS[i];
		vzd  = unit.DISTANCE;
		if (vzd <= SETTING_CONTAMINATION_RANGE) and (math.mod(unit.ID+OW_GET_TICK(),SETTING_CONTAMINATION_PERIOD) == 0) then
			if (vzd == 0) then
				vzd = 1;
			end;
			--TODO: Disable Exclamations
			OW_WEAPON_APPLY_ATTACK_EX(unit.ID,DAMAGE,(SETTING_CONTAMINATION_RANGE-vzd+1)/(SETTING_CONTAMINATION_RANGE+1),1);
			--TODO: Enable Exclamations
			--TODO: ProcessExclamation ex_deposit_contaminated
		end;
	end;
	
	OW_SET_SPECIAL_ATTACK_TIME(TIME);
end;

--[[
 ALASKITE GUN
--]]

Weap_GunAlaskite              = BasicWeapon.make();
Weap_GunAlaskite.doIdle       = Weap_Gun.doIdle;
Weap_GunAlaskite.doFireWeapon = Weap_Gun.doFireWeapon;
Weap_GunAlaskite.doDrawAttack = Weap_Gun.doDrawAttack;

function Weap_GunAlaskite:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local upgrade_range  = OW_GET_UPGRADE_VALUE(UPG_CONTAMRANGE,UNIT.SIDE);
	local upgrade_duration  = OW_GET_UPGRADE_VALUE(UPG_CONTAMDURATION,UNIT.SIDE);		
	local duration = upgrade_duration;
	local range = 
	{
	[1] = -102;
	[2] = -103;
	[3] = -104;
	};
	local units = self:doAttack_MakeUnitList(TIME, X, Y, DIRECTION, DAMAGE, true);
	
	for i=1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/3,1);
	end;
	
	if WEAP_ID ~= 4 then
		OW_DRAW_EXPLOSION(X,Y,DIRECTION,EXPLOSION_CANNON_OR_BAZOOKA_IMPACT,1,0);
	end;
		
	OW_REGISTER_SPECIAL_ATTACK_LUAWEAPON(duration,range,X,Y,0,range);
end;

--[[
 TOXIN SPRAYER
--]]

Weap_ToxinSprayer              = BasicWeapon.make();
Weap_ToxinSprayer.doFireWeapon = Weap_Laser.doFireWeapon;

function Weap_ToxinSprayer:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK(TIME, X, Y, DIRECTION, WEAPONTYPE_LASER, false, STARTX, STARTY);
end;

function Weap_ToxinSprayer:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local upgrade_range  = OW_GET_UPGRADE_VALUE(UPG_CONTAMRANGE,UNIT.SIDE);
	local upgrade_duration  = OW_GET_UPGRADE_VALUE(UPG_CONTAMDURATION,UNIT.SIDE);		
	local duration = upgrade_duration;
	local range = 
	{
	[1] = -102;
	[2] = -103;
	[3] = -104;
	};
	
	local hex;
	hex = OW_GET_HEX(X,Y);
	
	if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) then
		if hex.UNIT.typ ~= TYPE_HUMAN then
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1,1);
		else
			OW_WEAPON_APPLY_ATTACK_EX(hex.UNIT.ID,DAMAGE,1/3,1);
		end;
	end;
		
	OW_REGISTER_SPECIAL_ATTACK_LUAWEAPON(duration,range,X,Y,0,range);
end;

--[[
 Rakiety nowo-stare aby miały kolory i inny model
--]]

Weap_RocketLauncher_Example              = BasicWeapon.make();
Weap_RocketLauncher_Example.doFireWeapon = Weap_RocketLauncher.doFireWeapon;
Weap_RocketLauncher_Example.getAmount    = Weap_RocketLauncher.getAmount;
Weap_RocketLauncher_Example.doAttack     = Weap_RocketLauncher.doAttack;

function Weap_RocketLauncher_Example:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	local Proj = UNIT.NATION;
	
	if (Proj < 1) or (Proj > 3) then
		Proj = 2;
	end;
		
	OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, UNIT.NATION, UNIT.SIDE, 10, 1, 0);
end;

--[[
 NOWA BAZOOKA ABY RAKIETY MIAŁY KOLORY
--]]

Weap_Bazooka_Example             = BasicWeapon.make();
Weap_Bazooka_Example.doFireWeapon = Weap_Bazooka.doFireWeapon;
Weap_Bazooka_Example.getAmount    = Weap_Bazooka.getAmount;
Weap_Bazooka_Example.doAttack     = Weap_Bazooka.doAttack;
Weap_Bazooka_Example.doIdle       = Weap_Bazooka.doIdle;

function Weap_Bazooka_Example:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	local Proj = UNIT.NATION;

	if (Proj < 4) or (Proj > 6) then
		Proj = 5;
	end;

	OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, UNIT.NATION, UNIT.SIDE, 10, 1, 0);
end;

--[[
 NOWY TESTOWY MIOTACZ FLAME
--]]
--[[
Weap_Flame_Example             = BasicWeapon.make();
Weap_Flame_Example.doFireWeapon = Weap_Flame.doFireWeapon;
Weap_Flame_Example.getAmount    = Weap_Flame.getAmount;
Weap_Flame_Example.doAttack     = Weap_Flame.doAttack;

function Weap_Flame_Example:doShoot(ATTACKTARGET, X, Y)
	local Proj = UNIT.NATION;

	if (Proj < 1) or (Proj > 3) then
		Proj = 2;
	end;

	OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, 6, 0, 5, -1, 0);
end;
--]]

--[[
 NOWA TESTOWA ARTA
--]]
Weap_Artillery_Example              = BasicWeapon.make();
Weap_Artillery_Example.getsm        = Weap_Mortar.getsm;
Weap_Artillery_Example.doFireWeapon = Weap_Mortar.doFireWeapon;
Weap_Artillery_Example.getAmount    = Weap_Mortar.getAmount;
Weap_Artillery_Example.doAttack     = Weap_Mortar.doAttack;
Weap_Artillery_Example.doDrawAttack = Weap_Mortar.doDrawAttack;

function Weap_Artillery_Example:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)
	OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, 9, 0, 2, 4, 75);
end;

--[[


OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, PROJECTILE, PALETTE, MODE, AFTER_MODE, Z_OFF, USE_SECOND_BARREL = FALSE, START_X = -1, START_Y = -1);
Z_OFF = 75 for mortar and siberite rocket. Its the arc of the shots.
When PALETTE is 0 it has no side colours. When above its the side.

PROJECTILE and PALETTE are ignored when MODE is not 10,11,12,13.

MODE
1 = Bazooka
2 = Mortar
3 = Balista 
4 = Siberite Rocket (American)
5 = Flamethrower
6 = Siberite Rocket (Russian)
7 = American Rocket
8 = Russian Rocket
9 = Arabian Rocket
10 = Custom Bazooka
11 = Custom Projectile
12 = Custom Siberite Rocket
13 = Custom Rocket

AFTER_MODE (Explosion left behind)
-1 = Do Nothing
1 = Bazooka
2 = Mortar
3 = Time Bazooka (Not used by OW. Don't know what it does)
4 = Rocket

--]]

--[[
 AHEAD
--]]

Weap_RocketLauncher_Example_AHEAD              = BasicWeapon.make();
Weap_RocketLauncher_Example_AHEAD.doFireWeapon = Weap_RocketLauncher.doFireWeapon;
Weap_RocketLauncher_Example_AHEAD.getAmount    = Weap_RocketLauncher.getAmount;
Weap_RocketLauncher_Example_AHEAD.doAttack     = Weap_RocketLauncher.doAttack;

function Weap_RocketLauncher_Example_AHEAD:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY)	
	OW_DRAW_ATTACK_EX(TIME, X, Y, DIRECTION, 1, UNIT.SIDE, 10, 4, 0);
end;

function Weap_RocketLauncher_Example_AHEAD:doAttack(TIME, X, Y, DIRECTION, DAMAGE)
	local hx,hy,hex, j;
	local units = BasicList.make();
	
	hex = OW_GET_HEX(X,Y);
	
	if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) then
		units:add({ID=hex.UNIT.ID,AMOUNT=100});
	end;
	
	for i=1,SETTING_ROCKET_RANGE do
		hx,hy = X+dxh[4]*i,Y+dyh[4]*i;
		hex = OW_GET_HEX(hx,hy);

		for dir = 0, 5 do
			for d = 1, i do
				if OW_VALID_HEX(hx,hy) and (hex.UNIT ~= nil) then
					j = 1;
					while (j <= units.COUNT) and (units.LIST[j].ID ~= hex.UNIT.ID) do
						j = j + 1;
					end;
			
					if j > units.COUNT then
						units:add({ID=hex.UNIT.ID,AMOUNT=self:getAmount(i)});
					else
						if hex.UNIT.typ ~= TYPE_HUMAN then
							units.LIST[j].AMOUNT = units.LIST[j].AMOUNT+self:getAmount(i);
						end;
					end;
				end;
				hx = hx+dxh[dir];
				hy = hy+dyh[dir];
			end;
		end;
	end;
	
	for i=1,units.COUNT do
		OW_WEAPON_APPLY_ATTACK_EX(units.LIST[i].ID,DAMAGE,units.LIST[i].AMOUNT/100,1);
	end;
	
	if OW_VALID_HEX(X,Y) and (hex.UNIT ~= nil) then
		units = OW_GET_UNITS_WITHIN_RANGE(10,X,Y);
		local u;
		
		for i = 1,units.COUNT do
			u = units.UNITS[i];
			if u.ID ~= hex.UNIT.ID then
				OW_REGISTER_ATTACK(3+math.floor(u.DISTANCE/3),WEAPONTYPE_PRISM2,u.XS,u.YS,6,X,Y);
			end;
		end;
	end;
end;


---------------------------
--     WEAPON INDEX      --
---------------------------

WeaponList[ 0] = Weap_Head_Melee;
WeaponList[ 1] = Weap_MachineGun;
WeaponList[ 2] = Weap_Gun;
WeaponList[ 3] = Weap_Rifle;
WeaponList[ 4] = Weap_Bazooka;
WeaponList[ 5] = Weap_Pistol;
WeaponList[ 6] = Weap_Mortar;
WeaponList[ 7] = Weap_RocketLauncher;
WeaponList[ 8] = Weap_Laser;
WeaponList[ 9] = Weap_MultiArrow;
WeaponList[10] = Weap_Flame;
WeaponList[11] = Weap_Melee;
WeaponList[12] = Weap_Bulldozer;
WeaponList[13] = SpecWeap_Mine;
-- 14 is Crane which isn't a proper weapon
WeaponList[15] = Weap_SpaceShifting;
WeaponList[16] = Weap_TimeShifting;
WeaponList[17] = Weap_DoubleLaser;
-- 18 is Time Lapser which isn't a proper weapon
WeaponList[19] = Weap_Kamikaze;
WeaponList[20] = SpecWeap_Contamination;
-- 21 is TimeSlowDown which isn't a proper weapon
-- 22 is SelfDestruction which isn't a proper weapon
WeaponList[23] = Weap_SiberiteRocket;
-- 24 is SiberiteExplosion which isn't a proper weapon
-- 25 is SiberiteExplosion_Contamination which isn't a proper weapon
WeaponList[26] = Weap_Dismantle;
-- 27 is OilBarrel which isn't a proper weapon
WeaponList[28] = Weap_DoubleLaser2;
WeaponList[29] = Weap_RifleLaser;
WeaponList[30] = Weap_Gun; -- Artillery, NOTE: Identical to Gun. What is different in the EXE version is that its indirect ranged weapon. That is controlled in the ATTACK section with LUA_WEAPONRANGETYPE
-- 31 is Suppression which isn't a proper weapon
-- 32 is LUA_WEAPON which isn't a proper weapon

WeaponList[96] = Weap_VehicleRepairModule;
WeaponList[97] = Weap_ToxinSprayer;
WeaponList[98] = Weap_GunAlaskite;
WeaponList[99]  = Weap_Repair;
WeaponList[100] = Weap_Prism;
WeaponList[101] = Weap_Prism2;
WeaponList[102] = SpecWeap_Contamination_Test;
WeaponList[103] = SpecWeap_Contamination_Test;
WeaponList[104] = SpecWeap_Contamination_Test;

WeaponList[200] = Weap_RocketLauncher_Example;
WeaponList[201] = Weap_RocketLauncher_Example_AHEAD;
WeaponList[202] = Weap_Bazooka_Example;
WeaponList[203] = Weap_Flame_Example;
WeaponList[204] = Weap_Artillery_Example;


---------------------------
-- EDIT ABOVE THIS POINT --
---------------------------

function math.random(MINVALUE,MAXVALUE)
	if (MAXVALUE == nil) or (MAXVALUE < MINVALUE) then
		return OW_RANDOM(MINVALUE);
	else
		return MINVALUE+OW_RANDOM(MAXVALUE-MINVALUE+1);
	end;
end;

function math.round(VALUE)
	return OW_ROUND(VALUE);
end;

function isInArray(value, thearray)
	for _, v in ipairs(thearray) do
		if v == value then
			return true;
		end;
	end;

	return false;
end;

BasicList = {};
function BasicList.make()
	return {COUNT=0,LIST={},add=BasicList.add};
end;

function BasicList:add(DATA)
	self.COUNT = self.COUNT+1;
	self.LIST[self.COUNT] = DATA;
end;

function WeaponList:getDefAttack()
	return UNIT.DEFATTACK[UNIT.ACTIVEATTACK];
end;

function WeaponList:get(WEAPON_ID,ISSPECWEAPON)
	if (WEAPON_ID == nil) then
		if UNIT.DEFATTACK == nil then
			WEAP_ID = 0; -- UNIT is nil, can't get weapon ID
			return nil;
		else
			WEAP_ID = self:getDefAttack().LUA.ID;
		end;
	else
		WEAP_ID = WEAPON_ID;
	end;
	
	local r = self[WEAP_ID];
	
	if (r == nil) and (ISSPECWEAPON ~= nil) and (ISSPECWEAPON == true) then
		return SpecialWeapon; -- This prevents the attack from never ending as it will force it to decrease its time
	end;
	
	return r;
end;

function unitIsMastodont(U)
	return (U ~= nil) and (U.TYP == TYPE_VEHICLE) and (U.CHASSIS == CHASSIS_MASTODONT);
end;

function unitIsTiger(U)
	return (U ~= nil) and (U.TYP == TYPE_HUMAN) and (U.CLASS == CLASS_TIGER);
end;

function unitIsMeleeApe(U)
	return (U ~= nil) and (U.TYP == TYPE_HUMAN) and (isInArray(U.CLASS,{CLASS_APEMAN,CLASS_APEMAN_ENGINEER}));
end;

function unitIsNoble(U)
	return (U ~= nil) and (U.TYP == TYPE_HUMAN) and (U.CLASS == CLASS_NOBLE);
end;

function setUnitAnimate(TYP,COUNT)
	UNIT.ACTIVITY     = ACT_ANIMATE;
	UNIT.ANIM_TYPE    = TYP;
	UNIT.PHASE        = 1;
	UNIT.PHASE_COUNT  = COUNT;
	UNIT.NEW_ACTIVITY = true;
end;


function doIdle(SHOOTER)
	UNIT = SHOOTER;
	local lWeap = WeaponList:get();
	
	if lWeap == nil then
		
	else
		lWeap:doIdle();
	end;
	
	return UNIT;
end;

function doShoot(SHOOTER, ATTACKTARGET, X, Y)
	UNIT = SHOOTER;
	local lWeap = WeaponList:get();
	
	if lWeap == nil then
		
	else
		lWeap:doShoot(ATTACKTARGET, X, Y);
	end;
	
	return UNIT;
end;

function doFireWeapon(SHOOTER, ATTACKTARGET, X, Y, FIRST)
	UNIT = SHOOTER;

	local lWeap = WeaponList:get();
	
	if lWeap == nil then
		
	else
		lWeap:doFireWeapon(ATTACKTARGET, X, Y, FIRST);
	end;
	
	return UNIT;
end;

function doDrawAttack(SHOOTER, TIME, X, Y, DIRECTION, STARTX, STARTY, WEAPON_ID)
	UNIT = SHOOTER;

	if (WEAPON_ID ~= nil) and (WEAPON_ID ~= WEAPONTYPE_LUAWEAPON) then
		lWeap = WeaponList:get(math.abs(WEAPON_ID));
	else	
		lWeap = WeaponList:get(nil);
	end;
	
	if lWeap == nil then
		
	else
		lWeap:doDrawAttack(TIME, X, Y, DIRECTION, STARTX, STARTY);
	end;
	
	return UNIT;
end;

function doAttack(SHOOTER, TIME, X, Y, DIRECTION, DAMAGE, WEAPON_ID, STARTX, STARTY, ISSPECWEAPON)
	UNIT = SHOOTER;

	local lWeap;
	
	if (WEAPON_ID ~= nil) and (WEAPON_ID ~= WEAPONTYPE_LUAWEAPON) then
		lWeap = WeaponList:get(math.abs(WEAPON_ID),ISSPECWEAPON);
	else	
		lWeap = WeaponList:get(nil,ISSPECWEAPON);
	end;
	
	if lWeap == nil then
		
	else
		lWeap:doAttack(TIME, X, Y, DIRECTION, DAMAGE);
	end;
	
	return UNIT;
end;

function doProcessActivity(SHOOTER)
	UNIT = SHOOTER;

	local lWeap   = WeaponList:get();
	local handled = false;	
	
	if lWeap == nil then
		
	else
		handled = lWeap:doProcessActivity();
	end;
	
	return handled, UNIT;
end;

function doUpdateParameters(SHOOTER)
	UNIT = SHOOTER;

	local lWeap   = WeaponList:get();
	local handled = false;	
	
	if lWeap == nil then
		
	else
		lWeap:doUpdateParameters();
	end;
	
	return UNIT;
end;

