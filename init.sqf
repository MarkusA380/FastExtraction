[] spawn compile preprocessFileLineNumbers "scripts\briefing.sqf";

if (!isServer) exitWith {};

exfilRadius = 150;
areaCenter = [14150, 8548, 0];

/* This variable defines the progress of the mission. */
progress = 0;
hostages = [hostage1, hostage2];
exfiltrated = [false, false];
found = [false, false];
freed = [false, false];

findTask = ["findHostages", playerGroup, ["Find the two aid workers being held hostage somewhere in the hotel area.", "Find the hostages", ""], objNull, "ASSIGNED", 1, true, true, "search", true];
freeTask = ["freeHostages", playerGroup, ["Free the hostages from their restraints.", "Free the hostages", ""], objNull, "ASSIGNED", 1, true, true, "interact", true];
exfilTask = ["exfilHostages", playerGroup, ["Exfiltrate the hostages to somewhere outside of the area of operations.", "Exfiltrate the hostages", ""], objNull, "ASSIGNED", 1, true, true, "exit", true];

sleep 10;

/* This is the main loop */
while {progress < 5} do {

	switch (progress) do {
			/* Mission started */
			case 0: {
				scriptHandler = [] execVM "scripts\hostageBehaviour.sqf";
				waitUntil { scriptDone scriptHandler };
			};
			/* Find the hostages */
	    case 1: {
				scriptHandler = [] execVM "scripts\findHostages.sqf";
				waitUntil { scriptDone scriptHandler };
			};
			/* Free the hostages */
			case 2: {
				scriptHandler = [] execVM "scripts\freeHostages.sqf";
				waitUntil { scriptDone scriptHandler };
			};
			/* Exfiltrate the hostages */
			case 3: {
				scriptHandler = [] execVM "scripts\exfilHostages.sqf";
				waitUntil { scriptDone scriptHandler };
			};
			/* Mission completed */
			case 4: {
				sleep 5;
				"EveryoneWon" call BIS_fnc_endMissionServer;
				progress = 5;
			};
	    default { };
	};
};
