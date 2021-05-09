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
		if isInArray(HUMAN.CLASSTYPE,{clt_soldier,clt_engineer,clt_mechanic,clt_scientist}) then

			if NEWCLASS == class_sniper then
				if (BUILDING.NATION ~= nation_am) or not GET_TECH(tech_LasSight,BUILDING.SIDE).researched then
					return RESULT_FALSE;
				end;
			elseif NEWCLASS == class_mortarer then
				if (BUILDING.NATION ~= nation_ar) or not GET_TECH(tech_Mortar,BUILDING.SIDE).researched then
					return RESULT_FALSE;
				end;
			elseif NEWCLASS == class_bazooker then
				if (BUILDING.NATION ~= nation_ru) or not GET_TECH(tech_Bazooka,BUILDING.SIDE).researched then
					return RESULT_FALSE;
				end;
			elseif not isInArray(NEWCLASS,{class_soldier,class_engineer,class_mechanic,class_scientist}) then
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

				if NEWCLASS == class_apeman_soldier then
					if (BUILDING.NATION == nation_am) or not GET_TECH(tech_ApeAgres,BUILDING.SIDE).researched then
						return RESULT_FALSE;
					end;
				elseif NEWCLASS == class_apeman_engineer then
					if not GET_TECH(tech_ApePsych,BUILDING.SIDE).researched then
						return RESULT_FALSE;
					end;
				elseif NEWCLASS == class_apeman_kamikaze then
					if (BUILDING.NATION ~= nation_ar) or not GET_TECH(tech_ApeBrain,BUILDING.SIDE).researched then
						return RESULT_FALSE;
					end;
				end;

			end;
		else
			return RESULT_FALSE;
		end;

		if isInArray(NEWCLASS,{class_soldier,class_sniper,class_mortarer,class_bazooker,class_apeman_soldier,class_apeman_kamikaze}) then
			if not isInArray(BUILDING.KIND,{bud_armoury,bud_barracks}) then
				return RESULT_FALSE;
			end;
		elseif isInArray(NEWCLASS,{class_engineer,class_apeman_engineer}) then
			if not isInArray(BUILDING.KIND,set_stores) then
				return RESULT_FALSE;
			end;
		elseif NEWCLASS == class_mechanic then
			if not isInArray(BUILDING.KIND,set_factory) and not (BUILDING.KIND == bud_ct) then
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

-- [Result Types] --
RESULT_FALSE  = -1;
RESULT_TRUE   = -2;
RESULT_IGNORE = -3;

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

-- [[Helper Functions]] --

function isInArray(value, thearray)
	for _, v in ipairs(thearray) do
		if v == value then
			return true;
		end;
	end;

	return false;
end;