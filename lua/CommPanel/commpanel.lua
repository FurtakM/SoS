--[[
This file is used by the 2nd LUA Instance for the Command Panel Buttons as well as logic for commands they activate.
--]]
	 
function canChangeProfession(HUMAN,BUILDING,NEWCLASS)
--[[
HUMAN
   SIDE
   NATION
   CLASS
   CLASSTYPE
   
BUILDING
   SIDE
   NATION
   KIND
   BUILDINGTYPE
--]]

	if NEWCLASS > 21 then -- Non Altar Units
		return RESULT_TRUE;
	end;

	if BUILDING.BUILDINGTYPE == 0 then -- No Building
		return RESULT_FALSE;
	end;
	
	if NEWCLASS ~= HUMAN.CLASS then
		if isInArray(HUMAN.CLASSTYPE,{clt_soldier,clt_engineer,clt_mechanic,clt_scientist,clt_noble}) then
		
			local sc = SPECIAL_CLASSES[NEWCLASS];
			if (sc ~= nil) then
				if (BUILDING.NATION ~= sc.NAT) or not GET_TECH(sc.TECH,BUILDING.SIDE).researched then
						return RESULT_FALSE;
				end;
			elseif not isInArray(NEWCLASS,{class_soldier,class_engineer,class_mechanic,class_scientist,class_noble}) then
				return RESULT_FALSE;
			end;
			
		elseif HUMAN.CLASSTYPE == clt_apeman then
		
			if NEWCLASS == class_soldier then
				if HUMAN.CLASS == class_apeman_soldier then
					return RESULT_FALSE;
				end;
				NEWCLASS = class_apeman_soldier;
			elseif NEWCLASS == class_engineer then
				if HUMAN.CLASS == class_apeman_engineer then
					return RESULT_FALSE;
				end;
				NEWCLASS = class_apeman_engineer;
			end;
			
			if not isInArray(NEWCLASS,class_apes) then
				return RESULT_FALSE;
			else
				local sca = SPECIAL_APE_CLASSES[NEWCLASS];
			
				if (sca ~= nil) then
					if (isInArray(BUILDING.NATION,sca.NAT) or not GET_TECH(sca.TECH,BUILDING.SIDE).researched) then
						return RESULT_FALSE;
					end;
				end;				
			end;
		else
			return RESULT_FALSE;
		end;
	
		if isInArray(NEWCLASS,{class_soldier,class_sniper,class_mortarer,class_bazooker,class_apeman_soldier,class_apeman_kamikaze,class_noble}) then
			if not isInArray(BUILDING.KIND,{bud_armoury,bud_barracks}) then
				return RESULT_FALSE;
			end;
		elseif isInArray(NEWCLASS,{class_engineer,class_apeman_engineer}) then
			if not isInArray(BUILDING.KIND,set_stores) then
				return RESULT_FALSE;
			end;
		elseif NEWCLASS == class_mechanic then
			if not isInArray(BUILDING.KIND,set_factory) and not (BUILDING.KIND == bud_control_tower) then
				return RESULT_FALSE;
			end;
		elseif NEWCLASS == class_scientist then
			if not isInArray(BUILDING.KIND,set_labs) then
				return RESULT_FALSE;
			end;
		end;
		
		return NEWCLASS;
	end;

	return RESULT_FALSE;
end;

function canChangeProfessions(HUMAN,BUILDING,MAXCLASS) -- Only Called by Vanilla if getButtons() returns RESULT_IGNORE
	local RES = 0;
	for i=1,MAXCLASS do
		RES = canChangeProfession(HUMAN,BUILDING,i);
		if RES == RESULT_IGNORE then
			return RESULT_IGNORE;
		elseif RES ~= RESULT_FALSE then
			if RES == RESULT_TRUE then
				CP_BYTESET(i);
			else
				CP_BYTESET(RES);
			end;
		end;
	end;

	return RESULT_TRUE;
end;

function getButtons(BUTTONS,STATE,PAGEID)
	return RESULT_IGNORE, BUTTONS;
--[[
	local BUT,BUT_OR,BUT_ID;

	for b=1,9 do
		for h=1,2 do
			BUT = BUTTONS[b][h];
			
			if BUT.ID >= 0 then			
				BUT_OR = BUTTON_OVERRIDES[BUT.COMMAND];
				if BUT_OR ~= nil then
					BUT_ID = BUT_OR.func(STATE,BUT.ID);
					if BUT_ID ~= BUT.ID then
						BUTTONS[b][h] = GET_BUTTON(BUT_ID);
						BUT           = BUTTONS[b][h];
					end;
				end;
			
				if BUT.ID >= 0 then
					-- Handle State HERE!
				end;			
			end;
		end;
	end;

	return RESULT_IGNORE, BUTTONS;
--]]
end;

-- [Result Types] --
RESULT_FALSE  = -1;
RESULT_TRUE   = -2;
RESULT_IGNORE = -3;

-- [Button States] --
BUTTONSTATE_HIDDEN   = 0;
BUTTONSTATE_NORMAL   = 1;
BUTTONSTATE_DISABLED = 2;
BUTTONSTATE_INVENTED = 3;

-- [Cursor States] --
CURSORSTATE_NORMAL          = 0;
CURSORSTATE_WAITFORTARGET   = 1;
CURSORSTATE_MOVEINFORMATION = 2;

-- [[Buttons]] --
BUTTON_MOVE                 = 0;
BUTTON_STOP                 = 1;
BUTTON_FORTSTOP             = 2;
BUTTON_ATTACK               = 3;
BUTTON_ATTACKGROUND         = 4;
BUTTON_ATTACKPRIOR          = 5;
BUTTON_ATTACKNO             = 6;
BUTTON_FREE                 = 7;
BUTTON_HOLD                 = 8;
BUTTON_STANDGROUND          = 9;
BUTTON_SLEEPON              = 10;
BUTTON_SLEEPOFF             = 11;
BUTTON_NORMALGRENADES       = 12; -- Not Used
BUTTON_SPACEON              = 13;
BUTTON_TIMEON               = 14;
BUTTON_WALK                 = 15;
BUTTON_CRAWL                = 16;
BUTTON_PLACEDELAYEDCHARGE   = 17;
BUTTON_PLACEEXP             = 18;
BUTTON_FIREEXP              = 19;
BUTTON_REPAIRVEHICLE        = 20;
BUTTON_RECYCLEVEHICLE       = 21;
BUTTON_DISMANTLEBUILDING    = 22;
BUTTON_HEAL                 = 23;
BUTTON_TAME                 = 24;
BUTTON_TAMEAR               = 25;
BUTTON_GHANDI               = 26; -- Not Used
BUTTON_DUMB                 = 27; -- Not Used
BUTTON_HARAKIR              = 28; -- Not Used
BUTTON_BERSERK              = 29; -- Not Used
BUTTON_HACK                 = 30;
BUTTON_INFECT               = 31;
BUTTON_CONTAMINATE          = 32;
BUTTON_PLACETELEPORTEXIT    = 33;
BUTTON_PLACETELEPORTEXIT2   = 34;
BUTTON_PLACESECURITYLASER   = 35; -- Not Used
BUTTON_PLACEHIDDENCAMERA    = 37;
BUTTON_CRANEREPAIRBUILDING  = 38;
BUTTON_EXITVEHICLE          = 39;
BUTTON_DESTRUCT             = 40; -- Not Used
BUTTON_UPGRADEBUILDING      = 41;
BUTTON_UPGRADEARMORY        = 42;
BUTTON_EVERYBODYEXIT        = 43;
BUTTON_EXITBUILDING         = 44;
BUTTON_CONSTRUCTVEHICLE     = 45;
BUTTON_ICONGROUPCANCEL      = 46;
BUTTON_ICONGROUPCANCEL2     = 47;
BUTTON_SABREON              = 48;
BUTTON_CARBINEON            = 49;
BUTTON_SELFDESTRUCTION      = 50;
BUTTON_CARGOUNLOAD          = 51;
BUTTON_CARGOUNLOAD2         = 52;
BUTTON_PUTDOWN              = 53;
BUTTON_SPEED                = 54; -- Not Used
BUTTON_SELECTIONUNDO        = 55;
BUTTON_SELECTIONREDO        = 56;
BUTTON_B_DEPOT              = 57;
BUTTON_B_WORKSHOP           = 58;
BUTTON_B_ARMOURY            = 59;
BUTTON_B_BASICLAB           = 60;
BUTTON_B_REMOTECT           = 61;
BUTTON_B_TELEPORT           = 62;
BUTTON_B_POWERPLANTSOLAR    = 63;
BUTTON_B_POWERPLANTOIL      = 64;
BUTTON_B_POWERPLANTSIBERIUM = 65;
BUTTON_B_OILDRILLINGTOWER   = 66;
BUTTON_B_SIBERIUMMINE       = 67;
BUTTON_B_BWORKS             = 68;
BUTTON_B_BUNKER             = 69;
BUTTON_B_TURRET             = 70;
BUTTON_BUILDBEHEMOTH        = 71;
BUTTON_REBUILDTOBUNKER      = 72;
BUTTON_REBUILDTOTURRET      = 73;
BUTTON_LR_SOLPOW            = 74;
BUTTON_LR_SOLENG            = 75;
BUTTON_LR_OILPOW            = 76;
BUTTON_LR_OILENG            = 77;
BUTTON_LR_APELANG           = 78;
BUTTON_LR_APEPSYCH          = 79;
BUTTON_LR_APEAGRES          = 80;
BUTTON_LR_APENEURAL         = 81;
BUTTON_LR_APEBRAIN          = 82;
BUTTON_LR_STIMDRUGS         = 83;
BUTTON_LR_RADAR             = 84;
BUTTON_LR_MATDET            = 85;
BUTTON_LR_BIODET            = 86;
BUTTON_LR_MATPRED           = 87;
BUTTON_LR_LASSIGHT          = 88;
BUTTON_LR_SOPORIFIC         = 89;
BUTTON_LR_LASER             = 90;
BUTTON_LR_LASDOUBLE         = 91;
BUTTON_LR_REMCONT           = 92;
BUTTON_LR_REMCHARGE         = 93;
BUTTON_LR_PARTINVIS         = 94;
BUTTON_LR_HIDCAM            = 95;
BUTTON_LR_SIBDET            = 96;
BUTTON_LR_SIBLOC            = 97;
BUTTON_LR_SIBPOW            = 98;
BUTTON_LR_SIBENG            = 99;
BUTTON_LR_BEHEMOTH          = 100;
BUTTON_LR_ARTIFACT          = 101;
BUTTON_LR_SIBFISS           = 102;
BUTTON_LR_SIBIMPL           = 103;
BUTTON_LR_SIBCONTAM         = 104;
BUTTON_LR_TAURAD            = 105;
BUTTON_LR_SPACEANOM         = 106;
BUTTON_LR_TAUFIELD          = 107;
BUTTON_LR_LAPSER            = 108;
BUTTON_LR_LIMTELEPORT       = 109;
BUTTON_LR_TARGTELEPORT      = 110;
BUTTON_LR_AI                = 111;
BUTTON_LR_ADVAI             = 112;
BUTTON_LR_VIRUS             = 113;
BUTTON_LR_ADVCHASSIS        = 114;
BUTTON_LR_FLAME             = 115;
BUTTON_LR_GATTLING          = 116;
BUTTON_LR_GUN               = 117;
BUTTON_LR_ADVMET            = 118;
BUTTON_LR_ROCKET            = 119;
BUTTON_LR_ADVROCKET         = 120;
BUTTON_LR_MORTAR            = 121;
BUTTON_LR_EXPLOS            = 122;
BUTTON_LR_SELFDEST          = 123;
BUTTON_LR_BAZOOKA           = 124;
BUTTON_LR_TECH1             = 125;
BUTTON_LR_TECH2             = 126;
BUTTON_LR_TECH3             = 127;
BUTTON_LR_WEAP1             = 128;
BUTTON_LR_WEAP2             = 129;
BUTTON_LR_WEAP3             = 130;
BUTTON_LR_SIB1              = 131;
BUTTON_LR_SIB2              = 132;
BUTTON_LR_SIB3              = 133;
BUTTON_LR_COMP1             = 134;
BUTTON_LR_COMP2             = 135;
BUTTON_LR_COMP3             = 136;
BUTTON_LR_OPTO1             = 137;
BUTTON_LR_OPTO2             = 138;
BUTTON_LR_OPTO3             = 139;
BUTTON_LR_ST1               = 140;
BUTTON_LR_ST2               = 141;
BUTTON_LR_ST3               = 142;
BUTTON_LR_BIO1              = 143;
BUTTON_LR_BIO2              = 144;
BUTTON_LR_BIO3              = 145;
BUTTON_CP_SOLDIER           = 146;
BUTTON_CP_MECHANIC          = 147;
BUTTON_CP_SCIENTIST         = 148;
BUTTON_CP_ENGINEER          = 149;
BUTTON_CP_AMERICANSNIPER    = 150;
BUTTON_CP_RUSSIANBAZOOKA    = 151;
BUTTON_CP_ARABMORTAR        = 152;
BUTTON_CP_KAMIKAZE          = 153;
BUTTON_CP_SOLDIERF          = 154;
BUTTON_CP_MECHANICF         = 155;
BUTTON_CP_SCIENTISTF        = 156;
BUTTON_CP_ENGINEERF         = 157;
BUTTON_FE_TRACK             = 158;
BUTTON_FE_GUN               = 159;
BUTTON_FE_ROCKET            = 160;
BUTTON_FE_NONCOMBAT         = 161;
BUTTON_FE_RADAR             = 162;
BUTTON_FE_SIBERIUM          = 163;
BUTTON_FE_RADIO             = 164; -- Not Used
BUTTON_FE_STITCHING         = 165; -- Not Used
BUTTON_FE_COMPUTER          = 166;
BUTTON_FE_LASER             = 167;
BUTTON_LABWEAPON            = 168;
BUTTON_LABSIBERIUM          = 169;
BUTTON_LABCOMPUTER          = 170;
BUTTON_LABBIO               = 171;
BUTTON_LABSPACE             = 172;
BUTTON_LABOPTO              = 173;
BUTTON_TRANSPORT            = 174;
BUTTON_VEHTRANSPORT         = 175;
BUTTON_DEPOTTRANSPORT       = 176;
BUTTON_INFECT               = 177;
BUTTON_BUILD                = 178;
BUTTON_VEHBUILD             = 179;
BUTTON_BUILDRESOURCES       = 180;
BUTTON_BUILDMINE            = 181; -- Not Used
BUTTON_BUILDFORTIFICATION   = 182;
BUTTON_FACTORYADDEXTENSION  = 183;
BUTTON_REPLACEWEAPON        = 184;
BUTTON_LABBASICRESEARCH     = 185;
BUTTON_OPTORESEARCH1        = 186;
BUTTON_OPTORESEARCH2        = 187;
BUTTON_BIORESEARCH1         = 188;
BUTTON_BIORESEARCH2         = 189;
BUTTON_WEAPONRESEARCH1      = 190;
BUTTON_WEAPONRESEARCH2      = 191;
BUTTON_TIMERESEARCH1        = 192;
BUTTON_TIMERESEARCH2        = 193;
BUTTON_COMPRESEARCH1        = 194;
BUTTON_COMPRESEARCH2        = 195;
BUTTON_SIBRESEARCH1         = 196;
BUTTON_SIBRESEARCH2         = 197;
BUTTON_UPGRADELAB1          = 198;
BUTTON_UPGRADELAB2          = 199;
BUTTON_ACTIONPAUSE          = 200;
BUTTON_ACTIONRESUME         = 201;
BUTTON_ACTIONCANCEL         = 202;
BUTTON_LINKTOCT             = 203;
BUTTON_UNLINK               = 204;
BUTTON_CT_LINK              = 205;
BUTTON_CT_UNLINK            = 206;
BUTTON_TRANSPORTCANS        = 207;
BUTTON_TRANSPORTOIL         = 208;
BUTTON_TRANSPORTSIB         = 209;
BUTTON_TRANSPORT1           = 210;
BUTTON_TRANSPORT2           = 211;
BUTTON_TRANSPORTSTOP        = 212;
BUTTON_PLACEWEAPON          = 213;
BUTTON_PLACEWEAPON2         = 214;
BUTTON_CANCELPLACEWEAPON    = 215;
BUTTON_USEARTEFACT1         = 216;
BUTTON_USEARTEFACT2         = 217;
BUTTON_USEARTEFACT3         = 218;
BUTTON_USEARTEFACT4         = 219;
BUTTON_USEARTEFACT5         = 220;
BUTTON_USEARTEFACT6         = 221;
BUTTON_USEARTEFACT7         = 222;
BUTTON_USEARTEFACT8         = 223;
BUTTON_USEARTEFACT9         = 224;
BUTTON_USEARTEFACT10        = 225;
BUTTON_USEARTEFACT11        = 226;
BUTTON_USEARTEFACT12        = 227;
BUTTON_USEARTEFACT13        = 228;
BUTTON_USEARTEFACT14        = 229;
BUTTON_USEARTEFACT15        = 230;
BUTTON_MAKEINVISIBLE        = 231;
BUTTON_PATROL               = 232;
BUTTON_PATROL2              = 233;
BUTTON_LINKTOBASE           = 234;
BUTTON_BURY                 = 235;
BUTTON_MAINTENANCE          = 236;
BUTTON_UNUSED1              = 237; -- Not Used
BUTTON_UNUSED2              = 238; -- Not Used
BUTTON_WALL                 = 239;
BUTTON_ARAB_SIBFUSION       = 240;
BUTTON_HOLDFIRE             = 241;
BUTTON_UNUSED3              = 242; -- Not Used

-- [[BUTTON COMMANDS]] --
COMMAND_ICONGROUPCANCEL      = 0;
COMMAND_ICONGROUPCANCEL2     = 1;
COMMAND_MOVE                 = 2;
COMMAND_STOP                 = 3;
COMMAND_FORTSTOP             = 4;
COMMAND_ATTACK               = 5;
COMMAND_ATTACKGROUND         = 6;
COMMAND_ATTACKPRIOR          = 7;
COMMAND_ATTACKNO             = 8;
COMMAND_EXITVEHICLE          = 9;
COMMAND_FREE                 = 10;
COMMAND_HOLD                 = 11;
COMMAND_STANDGROUND          = 12;
COMMAND_SLEEPON              = 13;
COMMAND_SLEEPOFF             = 14;
COMMAND_NORMALGRENADES       = 15;
COMMAND_SPACESHIFTING        = 16;
COMMAND_TIMESHIFTING         = 17;
COMMAND_WALK                 = 18;
COMMAND_CRAWL                = 19;
COMMAND_PLACEDELAYEDCHARGE   = 20;
COMMAND_PLACEEXP             = 21;
COMMAND_FIREEXP              = 22;
COMMAND_REPAIRVEHICLE        = 23;
COMMAND_RECYCLEVEHICLE       = 24;
COMMAND_DISMANTLEBUILDING    = 25;
COMMAND_HEAL                 = 26;
COMMAND_TAME                 = 27;
COMMAND_TAMEAR               = 28;
COMMAND_GHANDI               = 29;
COMMAND_DUMB                 = 30;
COMMAND_HARAKIR              = 31;
COMMAND_BERSERK              = 32;
COMMAND_HACK                 = 33;
COMMAND_INFECT               = 34;
COMMAND_CONTAMINATE          = 35;
COMMAND_PLACETELEPORTEREXIT  = 36;
COMMAND_PLACETELEPORTEREXIT2 = 37;
COMMAND_REPAIRBUILDING       = 38;
COMMAND_CRANEREPAIRBUILDING  = 39;
COMMAND_PLACESECURITYLASER   = 40;
COMMAND_PLACEHIDDENCAMERA    = 41;
COMMAND_DESTRUCT             = 42;
COMMAND_UPGRADEBUILDING      = 43;
COMMAND_UPGRADEARMORY        = 44;
COMMAND_EVERYBODYEXIT        = 45;
COMMAND_EXITBUILDING         = 46;
COMMAND_CONSTRUCTVEHICLE     = 47;
COMMAND_SABREON              = 48;
COMMAND_CARBINEON            = 49;
COMMAND_SELFDESTRUCTION      = 50;
COMMAND_CARGOUNLOAD          = 51;
COMMAND_CARGOUNLOAD2         = 52;
COMMAND_PUTDOWN              = 53;
COMMAND_SPEED                = 54;
COMMAND_SELECTIONUNDO        = 55;
COMMAND_SELECTIONREDO        = 56;
COMMAND_B_DEPOT              = 57;
COMMAND_B_WORKSHOP           = 58;
COMMAND_B_ARMOURY            = 59;
COMMAND_B_BASICLAB           = 60;
COMMAND_B_REMOTECT           = 61;
COMMAND_B_TELEPORT           = 62;
COMMAND_B_POWERPLANTSOLAR    = 63;
COMMAND_B_POWERPLANTOIL      = 64;
COMMAND_B_POWERPLANTSIBERIUM = 65;
COMMAND_B_OILDRILLINGTOWER   = 66;
COMMAND_B_SIBERIUMMINE       = 67;
COMMAND_B_BWORKS             = 68;
COMMAND_B_BUNKER             = 69;
COMMAND_B_TURRET             = 70;
COMMAND_BUILDBEHEMOTH        = 71;
COMMAND_REBUILDTOBUNKER      = 72;
COMMAND_REBUILDTOTURRET      = 73;
COMMAND_LR_FIRST             = 74; -- Not Used. Used in Engine to mark start of lab research
COMMAND_LR_SOLPOW            = 75;
COMMAND_LR_SOLENG            = 76;
COMMAND_LR_OILPOW            = 77;
COMMAND_LR_OILENG            = 78;
COMMAND_LR_APELANG           = 79;
COMMAND_LR_APEPSYCH          = 80;
COMMAND_LR_APEAGRES          = 81;
COMMAND_LR_APENEURAL         = 82;
COMMAND_LR_APEBRAIN          = 83;
COMMAND_LR_STIMDRUGS         = 84;
COMMAND_LR_RADAR             = 85;
COMMAND_LR_MATDET            = 86;
COMMAND_LR_BIODET            = 87;
COMMAND_LR_MATPRED           = 88;
COMMAND_LR_LASSIGHT          = 89;
COMMAND_LR_SOPORIFIC         = 90;
COMMAND_LR_LASER             = 91;
COMMAND_LR_LASDOUBLE         = 92;
COMMAND_LR_REMCONT           = 93;
COMMAND_LR_REMCHARGE         = 94;
COMMAND_LR_PARTINVIS         = 95;
COMMAND_LR_HIDCAM            = 96;
COMMAND_LR_SIBDET            = 97;
COMMAND_LR_SIBLOC            = 98;
COMMAND_LR_SIBPOW            = 99;
COMMAND_LR_SIBENG            = 100;
COMMAND_LR_BEHEMOTH          = 101;
COMMAND_LR_ARTIFACT          = 102;
COMMAND_LR_SIBFISS           = 103;
COMMAND_LR_SIBIMPL           = 104;
COMMAND_LR_SIBCONTAM         = 105;
COMMAND_LR_TAURAD            = 106;
COMMAND_LR_SPACANOM          = 107;
COMMAND_LR_TAUFIELD          = 108;
COMMAND_LR_LAPSER            = 109;
COMMAND_LR_LIMTELEPORT       = 110;
COMMAND_LR_TARGTELEPORT      = 111;
COMMAND_LR_AI                = 112;
COMMAND_LR_ADVAI             = 113;
COMMAND_LR_VIRUS             = 114;
COMMAND_LR_ADVCHASSIS        = 115;
COMMAND_LR_FLAME             = 116;
COMMAND_LR_GATTLING          = 117;
COMMAND_LR_GUN               = 118;
COMMAND_LR_ADVMET            = 119;
COMMAND_LR_ROCKET            = 120;
COMMAND_LR_ADVROCKET         = 121;
COMMAND_LR_MORTAR            = 122;
COMMAND_LR_EXPLOS            = 123;
COMMAND_LR_SELFDEST          = 124;
COMMAND_LR_BAZOOKA           = 125;
COMMAND_LR_TECH1             = 126;
COMMAND_LR_TECH2             = 127;
COMMAND_LR_TECH3             = 128;
COMMAND_LR_WEAP1             = 129;
COMMAND_LR_WEAP2             = 130;
COMMAND_LR_WEAP3             = 131;
COMMAND_LR_SIB1              = 132;
COMMAND_LR_SIB2              = 133;
COMMAND_LR_SIB3              = 134;
COMMAND_LR_COMP1             = 135;
COMMAND_LR_COMP2             = 136;
COMMAND_LR_COMP3             = 137;
COMMAND_LR_OPTO1             = 138;
COMMAND_LR_OPTO2             = 139;
COMMAND_LR_OPTO3             = 140;
COMMAND_LR_ST1               = 141;
COMMAND_LR_ST2               = 142;
COMMAND_LR_ST3               = 143;
COMMAND_LR_BIO1              = 144;
COMMAND_LR_BIO2              = 145;
COMMAND_LR_BIO3              = 146;
COMMAND_LR_LAST              = 147; -- Not Used. Used in Engine to mark end of lab research
COMMAND_CP_SOLDIER           = 148;
COMMAND_CP_MECHANIC          = 149;
COMMAND_CP_SCIENTIST         = 150;
COMMAND_CP_ENGINEER          = 151;
COMMAND_CP_AMERICANSNIPER    = 152;
COMMAND_CP_RUSSIANBAZOOKA    = 153;
COMMAND_CP_ARABIANMORTARER   = 154;
COMMAND_CP_KAMIKAZE          = 155;
COMMAND_CP_SOLDIERF          = 156;
COMMAND_CP_MECHANICF         = 157;
COMMAND_CP_SCIENTISTF        = 158;
COMMAND_CP_ENGINEERF         = 159;
COMMAND_LABWEAPON            = 160;
COMMAND_LABSIBERIUM          = 161;
COMMAND_LABCOMPUTER          = 162;
COMMAND_LABBIO               = 163;
COMMAND_LABSPACE             = 164;
COMMAND_LABOPTO              = 165;
COMMAND_FE_TRACK             = 166;
COMMAND_FE_GUN               = 167;
COMMAND_FE_ROCKET            = 168;
COMMAND_FE_NONCOMBAT         = 169;
COMMAND_FE_RADAR             = 170;
COMMAND_FE_SIBERIUM          = 171;
COMMAND_FE_RADIO             = 172;
COMMAND_FE_STITCHING         = 173;
COMMAND_FE_COMPUTER          = 174;
COMMAND_FE_LASER             = 175;
COMMAND_TRANSPORTCANS        = 176;
COMMAND_TRANSPORTOIL         = 177;
COMMAND_TRANSPORTSIB         = 178;
COMMAND_TRANSPORT1           = 179;
COMMAND_TRANSPORT2           = 180;
COMMAND_TRANSPORTSTOP        = 181;
COMMAND_UPGRADELAB1          = 182;
COMMAND_UPGRADELAB2          = 183;
COMMAND_OPTORESEARCH1        = 184;
COMMAND_OPTORESEARCH2        = 185;
COMMAND_BIORESEARCH1         = 186;
COMMAND_BIORESEARCH2         = 187;
COMMAND_WEAPONRESEARCH1      = 188;
COMMAND_WEAPONRESEARCH2      = 189;
COMMAND_TIMERESEARCH1        = 190;
COMMAND_TIMERESEARCH2        = 191;
COMMAND_COMPRESEARCH1        = 192;
COMMAND_COMPRESEARCH2        = 193;
COMMAND_SIBRESEARCH1         = 194;
COMMAND_SIBRESEARCH2         = 195;
COMMAND_TRANSPORT            = 196;
COMMAND_VEHTRANSPORT         = 197;
COMMAND_DEPOTTRANSPORT       = 198;
COMMAND_INFECT               = 199;
COMMAND_BUILD                = 200;
COMMAND_VEHBUILD             = 201;
COMMAND_BUILDRESOURCES       = 202;
COMMAND_BUILDMINE            = 203;
COMMAND_BUILD_FORTIFICATION  = 204;
COMMAND_FACTORYADDEXTENSION  = 205;
COMMAND_LABBASICRESEARCH     = 206;
COMMAND_REPLACEWEAPON        = 207;
COMMAND_ACTIONPAUSE          = 208;
COMMAND_ACTIONRESUME         = 209;
COMMAND_ACTIONCANCEL         = 210;
COMMAND_LINK                 = 211;
COMMAND_UNLINK               = 212;
COMMAND_CT_LINK              = 213;
COMMAND_CT_UNLINK            = 214;
COMMAND_MAKEINVISIBLE        = 215;
COMMAND_PLACEWEAPON          = 216;
COMMAND_PLACEWEAPON2         = 217;
COMMAND_CANCELPLACEWEAPON    = 218;
COMMAND_USEARTEFACT1         = 219;
COMMAND_USEARTEFACT2         = 220;
COMMAND_USEARTEFACT3         = 221;
COMMAND_USEARTEFACT4         = 222;
COMMAND_USEARTEFACT5         = 223;
COMMAND_USEARTEFACT6         = 224;
COMMAND_USEARTEFACT7         = 225;
COMMAND_USEARTEFACT8         = 226;
COMMAND_USEARTEFACT9         = 227;
COMMAND_USEARTEFACT10        = 228;
COMMAND_USEARTEFACT11        = 229;
COMMAND_USEARTEFACT12        = 230;
COMMAND_USEARTEFACT13        = 231;
COMMAND_USEARTEFACT14        = 232;
COMMAND_USEARTEFACT15        = 233;
COMMAND_PATROL               = 234;
COMMAND_PATROL2              = 235;
COMMAND_LINKTOBASE           = 236;
COMMAND_BURY                 = 237;
COMMAND_MAINTENANCE          = 238;
COMMAND_B_CUSTOM             = 239; -- Custom Build Building
COMMAND_PROF_CUSTOM          = 240; -- Custom Profession Change
COMMAND_LUA_CUSTOM           = 241; -- Custom LUA (Runs lua when button pressed)
COMMAND_RESEARCH_CUSTOM      = 242; -- Custom Research
COMMAND_HOLDFIRE             = 243;

-- [[OVERRIDES]] --

function getCP(STATE,CLASS)
	return canChangeProfession(STATE.CURHUMAN,STATE.CURUNIT) == RESULT_TRUE;
end;

BUTTON_OVERRIDES = {};
BUTTON_OVERRIDES[COMMAND_PLACEEXP] = {
									func=function (STATE,BUTTONID)
										if (STATE.CURUNIT.ISHUMAN and not STATE.CURUNIT.ISINSIDE) and (STATE.CURHUMAN.CHARGE > 0) then
											return BUTTON_FIREEXP;
										end;
										
										return BUTTONID;
									end;
									};
									
BUTTON_OVERRIDES[COMMAND_ACTIONRESUME] = {
									func=function (STATE,BUTTONID)
										if (STATE.CURUNIT.ISBUILDING or STATE.CURUNIT.ISINSIDE) and (STATE.CURUNIT.ACTIVITY ~= act_stand_by) then
											return BUTTON_ACTIONPAUSE;
										end;
										
										return BUTTONID;
									end;
									};
									
BUTTON_OVERRIDES[COMMAND_REPLACEWEAPON] = {
									func=function (STATE,BUTTONID)
										if (STATE.CURUNIT.ISBUILDING or STATE.CURUNIT.ISINSIDE) then
											if (STATE.CURUNIT.ACTIVITY == act_wait_for_weapon) then
												return BUTTON_CANCELPLACEWEAPON;
											elseif (STATE.CURUNIT.WEAPON ~= 0) then
												return BUTTON_PLACEWEAPON2;
											end;
										end;
										
										return BUTTONID;
									end;
									};
									
BUTTON_OVERRIDES[COMMAND_CP_AMERICANSNIPER] = {
									func=function (STATE,BUTTONID)
										if ((STATE.CURUNIT.ISBUILDING or STATE.CURUNIT.ISINSIDE) and isInArray(STATE.CURUNIT.KIND,{bud_armoury, bud_barracks})) then
											if (STATE.CURUNIT.NATION == nation_am) then
												return BUTTON_CP_AMERICANSNIPER;
											elseif (STATE.CURUNIT.NATION == nation_ar) then
												if isInArray(STATE.CURHUMAN.CLASS,class_apes) and getCP(STATE,class_apeman_kamikaze) and not getCP(STATE,class_mortarer) then
													return BUTTON_CP_KAMIKAZE;
												else
													return BUTTON_CP_ARABMORTAR;
												end;
											elseif (STATE.CURUNIT.NATION == nation_ru) then
												return BUTTON_CP_RUSSIANBAZOOKA;
											end;
										end;
										
										return BUTTONID;
									end;
									};
									
BUTTON_OVERRIDES[COMMAND_CP_RUSSIANBAZOOKA] = {
									func=BUTTON_OVERRIDES[COMMAND_CP_AMERICANSNIPER].func
									};
									
BUTTON_OVERRIDES[COMMAND_CP_ARABIANMORTARER] = {
									func=BUTTON_OVERRIDES[COMMAND_CP_AMERICANSNIPER].func
									};

BUTTON_OVERRIDES[COMMAND_CP_KAMIKAZE] = {
									func=BUTTON_OVERRIDES[COMMAND_CP_AMERICANSNIPER].func
									};
									
BUTTON_OVERRIDES[COMMAND_SPACESHIFTING] = {
									func=function (STATE,BUTTONID)
										if ((STATE.CURUNIT.ISBUILDING or STATE.CURUNIT.ISINSIDE) and isInArray(STATE.CURUNIT.KIND,{bud_armoury, bud_barracks, bud_breast}) and (STATE.CURUNIT.INSIDECOUNT > 0)) then
											local hasBazooka, hasSniper = false, false;
											
											for u = 1, STATE.CURUNIT.INSIDECOUNT do
												hasSniper  = hasSniper or (STATE.CURUNIT.INSIDE[u].CLASS == class_sniper);
												hasBazooka = hasBazooka or (STATE.CURUNIT.INSIDE[u].CLASS == class_bazooker);
											end;
											
											if hasSniper and not hasBazooka then
												return BUTTON_SLEEPON;
											end;
										end;
										
										return BUTTONID;
									end;
									};
									
BUTTON_OVERRIDES[COMMAND_FIREEXP] = {
									func=function (STATE,BUTTONID)
										if ((STATE.CURUNIT.ISBUILDING or STATE.CURUNIT.ISINSIDE) and isInArray(STATE.CURUNIT.KIND,{bud_armoury, bud_barracks, bud_breast}) and (STATE.CURUNIT.INSIDECOUNT > 0)) then
											local hasBazooka = false;
											
											for u = 1, STATE.CURUNIT.INSIDECOUNT do
												hasBazooka = hasBazooka or (STATE.CURUNIT.INSIDE[u].CLASS == class_bazooker);
											end;
											
											if hasBazooka then
												return BUTTON_TIMEON;
											end;
										end;
										
										return BUTTONID;
									end;
									};
									
			

-- [Nations] --
nation_nature = 0;
nation_am = 1;
nation_ar = 2;
nation_ru = 3;

-- [Building Kinds] --
bud_depot			        = 0;
bud_warehouse				= 1;

bud_workshop				= 2;
bud_factory				= 3;

bud_armoury				= 4;
bud_barracks				= 5;

bud_lab					= 6;
bud_lab1				= 7;
bud_lab2				= 8;

bud_lab_basic				= 9;
bud_lab_weapon				= 10;
bud_lab_siberium			= 11;
bud_lab_computer			= 12;
bud_lab_biological			= 13;
bud_lab_spacetime                       = 14;
bud_lab_optoelectronics                 = 15;

bud_ext_track				= 16;
bud_ext_gun				= 17;
bud_ext_rocket				= 18;
bud_ext_noncombat			= 19;
bud_ext_radar				= 20;
bud_ext_siberium			= 21;
bud_ext_radio				= 22; -- Cancelled
bud_ext_stitch				= 23;
bud_ext_computer			= 24;
bud_ext_laser				= 25;

bud_power_oil				= 26;
bud_power_solar				= 27;
bud_power_siberium			= 28;

bud_mine_oil				= 29;
bud_mine_siberium			= 30;

bud_breast				= 31;
bud_bunker				= 32;
bud_turret				= 33;

bud_teleport				= 34;

bud_fort				= 35;

bud_control_tower			= 36;
bud_behemoth				= 37;
bud_eon					= 38;
bud_alien				= 39;

bud_wall				= 40;

bud_types_factory                       = {bud_workshop,bud_factory};
bud_types_bunker                        = {bud_breast,bud_bunker,bud_turret};
bud_types_bunker_weapon                 = {bud_bunker,bud_turret};
bud_types_lab                           = {bud_lab,bud_lab1,bud_lab2,bud_alien};

set_stores={bud_depot,bud_warehouse,bud_fort};
set_factory={bud_workshop,bud_factory};
set_labs={bud_lab,bud_lab1,bud_lab2};
-- [Technologies]
  tech_ApeLang=1;
  tech_ApePsych=2;
  tech_ApeNeural=3;
  tech_ApeBrain=4;
  tech_StimDrugs=5;
  tech_Radar=6;
  tech_MatDet=7;
  tech_BioDet=8;
  tech_MatPred=9;
  tech_Laser=10;
  tech_ApeAgres=11;
  tech_LasSight=12;
  tech_Soporific=13;
  tech_LasDouble=14;
  tech_RemCont=15;
  tech_PartInvis=16;
  tech_HidCam=17;
  tech_RemCharge=18;
  tech_SibLoc=19;
  tech_SibDet=20;
  tech_SibPow=21;
  tech_SibEng=22;
  tech_Behemoth=23;
  tech_Artifact=24;
  tech_SibFiss=25;
  tech_SibContam=26;
  tech_AdvAI=27;
  tech_TauRad=28;
  tech_SpacAnom=29;
  tech_TauField=30;
  tech_Lapser=31;
  tech_AI=32;
  tech_Virus=33;
  tech_AdvMet=34;
  tech_SolPow=35;
  tech_AdvChassis=36;
  tech_LimTeleport=37;
  tech_TargTeleport=38;
  tech_Gun=39;
  tech_Rocket=40;
  tech_Mortar=41;
  tech_Explos=42;
  tech_SelfDest=43;
  tech_Bazooka=44;
  tech_SolEng=45;
  tech_OilPow=46;
  tech_OilEng=47;
  tech_Tech1=48;
  tech_Tech2=49;
  tech_Tech3=50;
  tech_Weap1=51;
  tech_Weap2=52;
  tech_Weap3=53;
  tech_Sib1=54;
  tech_Sib2=55;
  tech_Sib3=56;
  tech_Comp1=57;
  tech_Comp2=58;
  tech_Comp3=59;
  tech_Opto1=60;
  tech_Opto2=61;
  tech_Opto3=62;
  tech_ST1=63;
  tech_ST2=64;
  tech_ST3=65;
  tech_Bio1=66;
  tech_Bio2=67;
  tech_Bio3=68;
  tech_Gatling=69;
  tech_Flame=70;
  tech_AdvRocket=71;
  tech_SibImpl=72;

-- [Human Classes] --

class_soldier				= 1;
class_engineer				= 2;
class_mechanic				= 3;
class_scientist				= 4;
class_sniper				= 5;
--class_upgsniper			= 6;
--class_terrorist			= 7;
class_mortarer				= 8;
class_bazooker				= 9;
--class_taubazooker			= 10;
class_noble				= 11;
class_apeman				= 12;
class_baggie				= 13;
class_tiger				= 14;
class_apeman_soldier		        = 15;
class_apeman_engineer		        = 16;
class_apeman_kamikaze		        = 17;
class_phororhacos			= 18;
class_frog				= 19;
class_fish				= 20;
class_prakun				= 21;

class_animal                            = {class_baggie,class_tiger,class_phororhacos,class_frog,class_fish,class_prakun};
class_apes                              = {class_apeman,class_apeman_soldier,class_apeman_engineer,class_apeman_kamikaze};
                                        
clt_soldier=1;
clt_engineer=2;
clt_mechanic=3;
clt_scientist=4;
clt_noble=5;
clt_apeman=6;
clt_critter=7;
clt_tiger=8;

SPECIAL_CLASSES     = {[class_sniper]={NAT=nation_am,TECH=tech_LasSight},[class_mortarer]={NAT=nation_ar,TECH=tech_Mortar},[class_bazooker]={NAT=nation_ru,TECH=tech_Bazooka},};
SPECIAL_APE_CLASSES = {[class_apeman_soldier]={NAT={nation_am},TECH=tech_ApeAgres},[class_apeman_engineer]={NAT={},TECH=tech_ApePsych},[class_apeman_kamikaze]={NAT={nation_am,nation_ru},TECH=tech_ApeBrain},};

-- [Vehicle Driver Types] --

controller_human			= 1;
controller_remote			= 2;
controller_computer			= 3;
controller_desertrider		        = 4;
controller_apeman			= 5;

-- [Activities] --
act_none				= 0;
act_forward_left			= 1;
act_forward				= 2;
act_forward_right			= 3;
act_back_right				= 4;
act_back				= 5;
act_back_left				= 6;
act_left				= 7;
act_right				= 8;
act_wait				= 9;
act_change_tracks			= 10;
act_animate				= 11;
act_fly_up				= 12;
act_fly_down				= 13;
act_heal				= 14;
act_repair_vehicle			= 15;
act_up					= 16;
act_down				= 17;
act_build				= 18; --construct_himself
act_help_build				= 19; --help_to_construct
act_repair_building			= 20; --repair_building
act_materialize				= 21;
act_change_class			= 22;
act_factory_construct		        = 23; --construct_vehicle/turret
act_factory_inside			= 24;
act_factory_leave			= 25; --move_out
act_research				= 26;
act_mine				= 27;
act_make_power				= 28;
act_suspend				= 29;
act_stand_by				= 30;
act_on_hold				= 31;
act_attack				= 32;
act_attack_left				= 33;
act_attack_right			= 34;
act_tame				= 35;
act_capture				= 36;
act_wait_for_weapon			= 37;
act_push_vehicle			= 38;
act_bulldozer_forward		        = 39;
act_bulldozer_backwards		        = 40;
act_place_mine				= 41;
act_make_invisible			= 42;
act_invisible				= 43;
act_hack				= 44;
act_shift_unit				= 45;
act_teleport_unit			= 46;
act_contaminate				= 47;
act_teleport_recharge		        = 48;
act_pp_no_oil				= 49;
act_dismantle				= 50;
act_enter_factory			= 51;
act_recycle				= 52;
act_place_behemoth			= 53;
act_wait_for_construction	        = 54;
act_siberite_rocket_ignition            = 55;
act_eon					= 56;
act_behemoth_power_up		        = 57;
act_custom				= 58;
act_unplaced				= 59;
act_wait_for_material		        = 60;

-- [[Helper Functions]] --

function isInArray(value, thearray)
	for _, v in ipairs(thearray) do
		if v == value then
			return true;
		end;
	end;

	return false;
end;