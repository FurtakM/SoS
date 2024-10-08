TID_Difficulty = 6000;
TID_Easy = 6001;
TID_Medium = 6002;
TID_Hard = 6003;
TID_NotAllowed = 6004;
TID_AllowedOnlyForEnemy = 6005;
TID_Allowed = 6006;
TID_SiberiteBomb = 6007;
TID_Rare = 6008;
TID_Normal = 6009;
TID_Common = 6010;
TID_CratesSpawn = 6011;
TID_AdditionalReinforcements = 6012;
TID_Commander = 6013;
TID_Mechanics = 6014;
TID_TeamsAmount = 6015;
TID_TimeMinutes = 6016;
TID_Road = 6017;
TID_Short = 6018;
TID_Long = 6019;
TID_VeryHard = 6020;
TID_Nation = 6021;
TID_Random = 6022;
TID_HunterClass = 6023;
TID_Soldier = 6024;
TID_Sniper = 6025;
TID_AnimalsAmount = 6026;
TID_Side = 6027;
TID_AchivUnlocked = 6028;
TID_Sheik = 6029;

TID_Burlak = 6030;
TID_Gladkov = 6031;
TID_Stolypin = 6032;
TID_Davidov = 6033;

TID_Americans = 6040;
TID_Arabs = 6041;
TID_Russians = 6042;
TID_Alliance = 6043;
TID_Legion = 6044;
TID_Neptun = 6045;
TID_Achievements_Ares = 6046;

TID_GameType = 6050;
TID_Color1 = 6051;
TID_Color2 = 6052;
TID_Color3 = 6053;
TID_Color4 = 6054;
TID_Color5 = 6055;
TID_Color6 = 6056;
TID_Color7 = 6057;
TID_Color8 = 6058;
TID_Color9 = 6059;

TID_PeopleAmount = 6060;
TID_ResourcesAmount = 6061;
TID_Small = 6062;
TID_Medium = 6063;
TID_Huge = 6064;
TID_CratesDrop = 6065;

TID_Website = 6090;
TID_Contact = 6091;
TID_InGame_Save_Game_Limit = 6092;
TID_InGame_Save_Game_Limit_Desc = 6093;

TID_Credits_Mod = 6100;
TID_Credits_Maps = 6101;
TID_Credits_Scenarios = 6102;
TID_Credits_Dialogs = 6103;
TID_Credits_SupportM = 6104;
TID_Credits_SupportT = 6105;
TID_Credits_SupportMed = 6106;
TID_Credits_Website = 6107;
TID_Credits_Thanks_1 = 6108;
TID_Credits_Thanks_2 = 6109;
TID_Credits_Thanks_3 = 6110;
TID_Credits_Thanks_4 = 6111;
TID_Credits_Thanks_5 = 6112;
TID_Credits_Ares_Voice_Actors = 6113;
TID_Credits_American_Soldier = 6114;
TID_Credits_Arabian_Soldier = 6115;
TID_Credits_Russian_Soldier = 6116;

TID_Biographies = 8000;

TID_Chechen = 9000;
TID_Croatia = 9001;
TID_Georgia = 9002;
TID_Germany = 9003;
TID_France = 9004;
TID_Bulgaria = 9005;
TID_Romania = 9006;
TID_Greece = 9007;
TID_Britain = 9008;
TID_Norway = 9009;
TID_Switzerland = 9010;
TID_Afghanistan = 9011;
TID_Azerbaijan = 9012;
TID_Austria = 9013;
TID_Ireland = 9014;
TID_Rhodesia = 9015;
TID_Belgium = 9016;
TID_Turkey = 9017;
TID_Algeria = 9018;
TID_Arabia = 9019;
TID_Bosna = 9020;
TID_RPA = 9021;
TID_Holand = 9022;
TID_Estonia = 9023;
TID_Latvia = 9024;
TID_Lithuania = 9025;
TID_Iraq = 9026;
TID_Sweden = 9027;
TID_Finland = 9028;
TID_Iran = 9029;
TID_USA = 9030;
TID_Canada = 9031;
TID_Ethiopia = 9032;
TID_Poland = 9033;
TID_England = 9034;
TID_Scotland = 9035;
TID_Wales = 9036;
TID_Japan = 9037;
TID_USSR = 9038;
TID_Ukraine = 9039;
TID_Belarus = 9040;
TID_TannuTuva = 9041;
TID_Kyrgyzstan = 9042;
TID_Moldova = 9043;
TID_Uzbekistan = 9044;

TID_Main_Menu_Support = 9996;
TID_Main_Menu_Contact = 9997;
TID_Main_Menu_Changelog = 9998;
TID_Changelog = 9999;

-- config variables
CONFIG_LOGOS = false;

-- variables for lua
SOS_GAME_DIFFICULTY = 1;

function setGameDifficulty(DIFFICULTY)
	SOS_GAME_DIFFICULTY = parseInt(DIFFICULTY);
end;