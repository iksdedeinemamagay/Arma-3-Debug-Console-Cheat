n4m3nl0s_Menu_Recoil =
	{
		if (isNil "n4m3nl0srecoilx") then {n4m3nl0srecoilx = 0;};
		if (n4m3nl0srecoilx==0) then
	{
		player setUnitRecoilCoefficient 0;
		player enableAimPrecision false;
		player setCustomAimCoef 0;
		player forceWalk false;
		n4m3nl0srecoilx=1;
		hint "Recoil deaktiviert!";
		sleep 0.001;
	}
	else
	{
		player setUnitRecoilCoefficient 1;
		player enableAimPrecision True;
		player setCustomAimCoef 0.5;
		n4m3nl0srecoilx=0;
		hint "Recoil aktiviert!";
		sleep 0.001;
	};
};

n4m3nl0s_Menu_Stamina =
	{
		if (isNil "n4m3nl0sstaminax") then {n4m3nl0sstaminax = 0;};
		if (n4m3nl0sstaminax==0) then
	{
		player enableFatigue false;
		player enableStamina false;
		n4m3nl0sstaminax=1;
		hint "Stamina deaktiviert!";
		sleep 0.001;
	}
	else
	{
		player enableFatigue true;
		player enableStamina true;
		n4m3nl0sstaminax=0;
		hint "Stamina aktiviert!";
		sleep 0.001;
	};
};

n4m3nl0s_Menu_Arsenal =
{
	hint "Du hast das Arsenal geöfffnet!";
	["Open", [true]] call BIS_fnc_arsenal;
};

n4m3nl0s_Menu_Heal =
{
	hint"Du hast dich geheilt!";
	player setDamage 0;
	vehicle player setDamage 0;
	vehicle player setFuel 1;
};

n4m3nl0s_Menu_n4m3nl0sinfi_Ammo =
{
	if (isnil ("n4m3nl0sEndlessClip")) then 
	{
		n4m3nl0sEndlessClip = 0;
	};

	if (n4m3nl0sEndlessClip==0) then
	{
		hint "Du hast jetzt unendlich Munition!";
		n4m3nl0sEndlessClip=1;
	}
	
	else
	{
		n4m3nl0sEndlessClip=0;
		hint "Du hast nicht mehr unendlich Munition!";
	};

	n4m3nl0sShit = "while {n4m3nl0sEndlessClip==1} do{(vehicle player) setVehicleAmmo 1;sleep 0.1;};";

	[] spawn compile n4m3nl0sShit;
};

n4m3nl0s_Menu_God ={
	if (isNil "n4m3nl0sgodx") then {n4m3nl0sgodx = 0;};
	if (n4m3nl0sgodx==0) then
	{
		vehicle player removeAllEventHandlers "handleDamage";
		vehicle player allowDamage false;
		player removeAllEventHandlers "handleDamage";
		player allowDamage false;
		n4m3nl0sgodx=1;
		hint "Godmode aktiviert!";
		sleep 0.001;
	}
	
	else
	{
		vehicle player removeAllEventHandlers "handleDamage";
		vehicle player allowDamage true;	
		player removeAllEventHandlers "handleDamage";
		player allowDamage true;
		n4m3nl0sgodx=0;
		hint"Godmode deaktiviert!";
		sleep 0.001;
	};
};

n4m3nl0s_Menu_ESP = {
	  if (isnil("n4m3nl0s_namen4m3nl0stags")) then {
                    n4m3nl0s_namen4m3nl0stags = 0;
                };
                if (n4m3nl0s_namen4m3nl0stags == 0) then {
                    n4m3nl0s_namen4m3nl0stags = 1;
					hint "ESP aktiviert!";
                } else {
                    n4m3nl0s_namen4m3nl0stags = 0;
                       hint "ESP deaktiviert!";
                };
                if (n4m3nl0s_namen4m3nl0stags == 1) then {
                    onEachFrame {
                        _l49 = nearestobjects[player, ["CAManBase"], 5000]; {
                            if ((side _x != side player) && (getPlayerUID _x != "") && ((player distance _x) < 5000)) then {
                                drawIcon3D["", [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(player distance _x), name _x]), 1, 0.03, "TahomaB"];
                            } else {
                                if ((getPlayerUID _x != "") && ((player distance _x) < 1000)) then {
                                    drawIcon3D["", [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1m", round(player distance _x), name _x]), 1, 0.03, "TahomaB"];
                                };
                            };
                        }
                        foreach allUnits;
                    };
                } else {
                    onEachFrame {
                        nil
                    };
                };
};

n4m3nl0s_Menu_Tele = 
{
	hint "Alt + Linke Maustaste auf der Map um dich zu Teleportieren!";
	player onMapSingleClick "if (_alt) then {vehicle player setPosATL _pos}";
};

n4m3nl0s_Hide_Menu = 
{
    n4m3nl0s_hide_player = player;
	removeAllActions player;
	hint "Admin Menü ausgeschaltet. Aktivierte funktionen sind aber noch aktiviert.";
	n4m3nl0s_hide_player addAction ["<t color=""#a12525"">[Admin]</t> Menü öffnen", "[]spawn n4m3nl0s_Main_Menu"];
};

n4m3nl0s_Main_Menu = 
{
	n4m3nl0s_main_menu_player = player;
	removeAllActions player;
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Teleport", "[]spawn n4m3nl0s_Menu_Tele"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Heal", "[]spawn n4m3nl0s_Menu_Heal"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Stamina", "[]spawn n4m3nl0s_Menu_Stamina"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Recoil", "[]spawn n4m3nl0s_Menu_Recoil"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Arsenal", "[]spawn n4m3nl0s_Menu_Arsenal"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Godmode", "[]spawn n4m3nl0s_Menu_God"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Infinite Ammo", "[]spawn n4m3nl0s_Menu_n4m3nl0sinfi_Ammo"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> ESP", "[]spawn n4m3nl0s_Menu_ESP"];
	n4m3nl0s_main_menu_player addAction ["<t color=""#a12525"">[Admin]</t> Menü schließen", "[]spawn n4m3nl0s_Hide_Menu"];
};

if (!isServer && (player != player)) then 
{
   waitUntil {player == player};
};
player addAction ["<t color=""#a12525"">[Admin]</t> Menü Laden","[]spawn n4m3nl0s_Main_Menu"];
player addEventHandler ["Respawn",{waitUntil {alive player}; player addAction ["<t color=""#a12525"">[Admin]</t> Menü Laden","[]spawn n4m3nl0s_Main_Menu"]}];
